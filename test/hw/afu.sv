// Copyright (c) 2020 University of Florida
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// Greg Stitt
// University of Florida

//***************************************************************************//
// Modify to integrate CMT matrix multiply; see readme.txt in ../
// Added:
//
//***************************************************************************//

// OLD:

// Module Name:  afu.sv
// Project:      simple pipeline
// Description:  This AFU implements a simple pipeline that streams 32-bit
//               unsigned integers from an input array, with each cache line
//               providing 16 inputs. The pipeline multiplies the 8 pairs of
//               inputs from each input cache line, and sums all the products
//               to get a 64-bit result that is written to an output array.
//               All multiplications and additions should provide 64-bit
//               outputs, which means that the multiplications retain all
//               precision (due to their 32-bit inputs), but the adds due not
//               include carrys.
//
//               Since each output is 64 bits, the AFU must generate 8 outputs
//               before writing a cache line to memory (512 bits). The AFU
//               uses output buffering to pack 8 separate 64-bit outputs into
//               a single 512-bit buffer that is then written to memory.
//
//               Although the AFU could be extended to support any number of
//               inputs and/or outputs, software ensures that the number of
//               inputs is a multiple of 16, so the AFU doesn't have to consider
//               the situation of ending without 8 results in the buffer to
//               write to memory (i.e. an incomplete cache line on the final
//               transfer.

//               The AFU uses MMIO to receive the starting read adress, 
//               starting write address, input_size (# of input cache lines), 
//               and a go signal. The AFU asserts a MMIO done signal to tell 
//               software that the DMA that all results have been written to
//               memory.
//
//               This example assumes the user is familiar with the
//               dma_loopback and dma_loop_uclk training modules.

//===================================================================
// Interface Description
// clk  : Clock input
// rst  : Reset input (active high)
// mmio : Memory-mapped I/O interface. See mmio_if.vh and description above.
// dma  : DMA interface. See dma_if.vh and description above.
//===================================================================

`include "cci_mpf_if.vh"

module afu 
  (
   input clk,
   input rst,
	 mmio_if.user mmio,
	 dma_if.peripheral dma
   );

   localparam int CL_ADDR_WIDTH = $size(t_ccip_clAddr);
   localparam int CL_DATA_WIDTH = $size(t_ccip_clData);	// 512
   localparam int INPUT_WIDTH = 64;   
   localparam int RESULT_WIDTH = 64;
   localparam int INPUTS_PER_CL = CL_DATA_WIDTH / INPUT_WIDTH;   // 8
   localparam int RESULTS_PER_CL = CL_DATA_WIDTH / RESULT_WIDTH; // 8
   
   localparam int PIPE_SIZE = 8; // max 32; currently equals ELEMENT_SIZE

   // Normally I would make this a function of the number of inputs, but since
   // the pipeline is hardcoded for a specific number of inputs in this example,
   // this will suffice.
//   localparam int PIPELINE_LATENCY = 5;
   
   // 512 is the shallowest a block RAM can be in the Arria 10, so there's no 
   // point in making it smaller unless using MLABs instead.
   localparam int FIFO_DEPTH = 512;
            
   // I want to just use dma.count_t, but apparently
   // either SV or Modelsim doesn't support that. Similarly, I can't
   // just do dma.SIZE_WIDTH without getting errors or warnings about
   // "constant expression cannot contain a hierarchical identifier" in
   // some tools. Declaring a function within the interface works just fine in
   // some tools, but in Quartus I get an error about too many ports in the
   // module instantiation.
   typedef logic [CL_ADDR_WIDTH:0] count_t;   
   count_t 	input_size;
   count_t      output_size;
   logic 	go;
   logic 	done;

   // Software provides 64-bit virtual byte addresses.
   // Again, this constant would ideally get read from the DMA interface if
   // there was widespread tool support.
   localparam int VIRTUAL_BYTE_ADDR_WIDTH = 64;
   logic [VIRTUAL_BYTE_ADDR_WIDTH-1:0] rd_addr, wr_addr;

   // Instantiate the memory map, which provides the starting read/write
   // 64-bit virtual byte addresses, an input size (in cache lines), and a
   // go signal. It also sends a done signal back to software.
   memory_map
     #(
       .ADDR_WIDTH(VIRTUAL_BYTE_ADDR_WIDTH),
       .SIZE_WIDTH(CL_ADDR_WIDTH+1)
       )
     memory_map (.*);


//################### DATA PIPELINE ###############################################//

   logic [INPUT_WIDTH-1:0] shrink2ib_data, ib2shim_data, shim2pipe_kernel, shim2pipe_data, pipe2ob_data, ob2expand_data;
   logic dma2shrink_en, shrink2ib_en, ib2shim_en, shim2pipe_k_vld, shim2pipe_d_vld, pipe2ob_en, ob2expand_en, expand2dma_en;
   logic shrink_full, shrink_empty, ib_full, ib_empty, pipe_out_vld, ob_full, ob_empty, expand_full, expand_empty;
   logic input_done, pipe_done, pipe_go;

   assign dma2shrink_en = (!dma.empty && shrink_empty);
   assign dma.rd_en = dma2shrink_en;

   //// Instantiate width_change_fifo.vhd (shrinker 512->64)
   width_change_fifo 
     #(
        .input_width(512),
        .tag_width(),	// don't need this
        .output_width(INPUT_WIDTH),
        .buffer_input(1'b0) // false: don't buffer the input
      )
   shrink_input 
      (
        .clk(clk), 
        .rst(rst), 
        .rd(shrink2ib_en), 
        .wr(dma2shrink_en), 
        .full(shrink_full), 
        .almost_full(), //    : out std_logic;
        .empty(shrink_empty), 
        .empty_internal(), // : out std_logic;
        .tag_in(), 		// don't need
        .tag_out(), 		// don't need
        .data_in(dma.rd_data), 	//          : in  std_logic_vector(input_width-1 downto 0);
        .data_out(shrink2ib_data)  //         : out std_logic_vector(output_width-1 downto 0)
      );
   //// end width_change_fifo;

   assign shrink2ib_en = (!shrink_empty && !ib_full);

   //// Instantiate fifo.sv to buffer inputs to pipeline
   fifo
     #(
       .WIDTH(INPUT_WIDTH),
       .DEPTH(FIFO_DEPTH),       
       .ALMOST_FULL_COUNT(FIFO_DEPTH-8)
       )
   input_buffer
     (
      .clk(clk),
      .rst(rst),
      .rd_en(ib2shim_en),		// when !empty & !stall 
      .wr_en(shrink2ib_en),		// when shrink_input .rd (!empty) 
      .empty(ib_empty),
      .full(ib_full), 
      .almost_full(),
      .count(),
      .space(),
      .wr_data(shrink2ib_data),
      .rd_data(ib2shim_data)
      );
   //// end input_buffer

   assign ib2shim_en = (!ib_empty && !ob_full);

   //// Instantiate input shim to split kernel and data
   cmt_input_shim
     #(
       .width(INPUT_WIDTH),
       .N(PIPE_SIZE)		// max 32
      )
   cmt_input_shim
     (
       .clk(clk),
       .rst(rst),
       .data_in(ib2shim_data),		// from input buffer 
       .input_vld(ib2shim_en),		// when buffer rd_en
       .stall(ob_full),			// stall when output_buffer is full
       .data_out(shim2pipe_data),	// ternix data
       .data_vld(shim2pipe_d_vld),
       .kernel_out(shim2pipe_kernel),	// kernel data
       .kernel_vld(shim2pipe_k_vld),
       .done(input_done) 		// all kernel and input data passed to pipe
     );
   //// end input shim


   //// Instantiate cmt_mm_3dir.vhd (3-way matrix multiply pipeline) 
   cmt_mm_3dir 
     #(
       .width(INPUT_WIDTH),
       .N(PIPE_SIZE)            // max 32
       )
   cmt_pipeline
     (
      .clk(clk),         
      .a_rst(rst),      
      .go(go),
      .data_in(shim2pipe_data),       
      .d_in_vld(shim2pipe_d_vld),  
      .kernel_in(shim2pipe_kernel),     
      .k_in_vld(shim2pipe_k_vld),      
      .stall(ob_full),          	// stall pipe when output_buffer is full
      .data_out(pipe2ob_data),       
      .d_out_vld(pipe_out_vld),      // : out   std_logic;
      .done(pipe_done)            // : out   std_logic
      );
   ////end entity cmt_mm_3dir;

   assign pipe2ob_en = (pipe_out_vld && !ob_full);

   //// Instantiate fifo.sv to buffer outputs from pipeline
   fifo
     #(
       .WIDTH(INPUT_WIDTH),
       .DEPTH(FIFO_DEPTH),
       .ALMOST_FULL_COUNT(FIFO_DEPTH-8)
       )
   output_buffer
     (
      .clk(clk),
      .rst(rst),
      .rd_en(ob2expand_en),
      .wr_en(pipe2ob_en),
      .empty(ob_empty),
      .full(ob_full), 
      .almost_full(),
      .count(),
      .space(),
      .wr_data(pipe2ob_data),
      .rd_data(ob2expand_data)
      );
   //// end out buffer

   assign ob2expand_en = (!ob_empty && !expand_full);	// TO DO?: handle num_out % 8 != 0

   //// Instantiate width_change_fifo.vhd (expand 64->512)
   width_change_fifo 
     #(
        .input_width(INPUT_WIDTH),
        .tag_width(),   // don't need this
        .output_width(512),
        .buffer_input(1'b0) // false
      )
   expand_output 
      ( 
        .clk(clk), 
        .rst(rst), 
        .rd(expand2dma_en), 
        .wr(ob2expand_en), 
        .full(expand_full), 
        .almost_full(), //    : out std_logic;
        .empty(expand_empty), 
        .empty_internal(), // : out std_logic;
        .tag_in(), 		//  don't need
        .tag_out(), 		// don't need
        .data_in(ob2expand_data), // 64-bit results
        .data_out(dma.wr_data)    // 8 results in 512-bit cache line   
      );
   //// end width_change_fifo;

   assign expand2dma_en = !dma.full && (!expand_empty || (ob_empty && pipe_done && !dma.wr_done) );  // TEST: handle partial CL 
   assign dma.wr_en = expand2dma_en;

//################## END OF PIPELINE ################################################//   

   // Assign the starting addresses from the memory map.
   assign dma.rd_addr = rd_addr;
   assign dma.wr_addr = wr_addr;
   

   // Input_size from software will be N (element_size) 
   // Total inputs = N*N (kernel) + N*N*N (data) 64-bit numbers
   // Input cache lines = total inputs/8  (512/64 = 8) 
   //int N, input_cl;
   //assign N = input_size;	// set by SW thru MMIO; currently must = PIPE_SIZE
   //assign input_cl = ((N*N + N*N*N) >> 3) + 1;
   assign dma.rd_size = input_size; //[CL_ADDR_WIDTH:0];

   // Total outputs = N*N*N (data) * 3 (dr, ds, dt) 
   // Output cache lines = total outputs/8 
   //int output_cl;
   //assign output_cl = ((3*N*N*N) >> 3) + 1;
   assign dma.wr_size = output_size; //[CL_ADDR_WIDTH:0];


   // Start both the read and write channels when the MMIO go is received.
   // Note that writes don't actually occur until dma.wr_en is asserted.
   assign dma.rd_go = go;
   assign dma.wr_go = go;

   // The AFU is done when the DMA is done writing all results.
   assign done = dma.wr_done;
            
endmodule

