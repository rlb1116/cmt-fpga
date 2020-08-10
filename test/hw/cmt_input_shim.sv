// cmt_input_shim.sv
// Ryan Blanchard
// Use: Takes a single data stream (e.g., from 1 DMA channel) and splits it 
//	into kernel data and input data for the cmt_mm_3dir module. 
//
//	Given element_size = N, the first N^2 numbers are the kernel data,
//	and the last N^3 numbers are the input ternix data. 
//=============================================================================

module cmt_input_shim #(parameter int width,
			parameter int N)
   (
       input logic 			clk,
       input logic			rst,
       input logic [width-1:0]		data_in,            // from input buffer
       input logic 			input_vld,          // when buffer rd_en
       input logic 			stall,                 // stall when output_buffer is full
       output logic [width-1:0]		data_out,       // ternix data
       output logic 			data_vld,
       output logic [width-1:0]         kernel_out,   // kernel data
       output logic 			kernel_vld,
       output logic 			done                // all kernel and input data passed to pipe
   );

   localparam KERNEL_SIZE = N*N;
   localparam TERNIX_SIZE = N*N*N;

   logic [$clog2(KERNEL_SIZE):0]	k_count, next_k_count;
   logic [$clog2(TERNIX_SIZE):0]	t_count, next_t_count;
   logic 				kernel_done, ternix_done;
   
   assign kernel_done = (k_count == KERNEL_SIZE) ? 1'b1 : 1'b0;
   assign ternix_done = (t_count == TERNIX_SIZE) ? 1'b1 : 1'b0;
   assign done = kernel_done && ternix_done;


   always_ff @ (posedge clk or posedge rst) begin
      if (rst) begin 
         k_count 	<= '0;
         t_count 	<= '0;
      end 
      else begin
         k_count 	<= next_k_count;
         t_count 	<= next_t_count;
      end
   end // always_ff


   always_comb begin
      next_k_count 	= k_count;
      next_t_count	= t_count;

      if (!kernel_done) begin
         kernel_out 	<= data_in;
         kernel_vld	<= input_vld;
         data_out	<= '0;
         data_vld	<= '0;
         if (input_vld == 1'b1) 
            next_k_count++;
      end
      else if (kernel_done && !ternix_done) begin
         kernel_out     <= '0;
         kernel_vld     <= '0;
         data_out       <= data_in;
         data_vld       <= input_vld;
         if (input_vld == 1'b1)
            next_t_count++;
      end
      else begin
         kernel_out     <= '0;
         kernel_vld     <= '0;
         data_out       <= '0;
         data_vld       <= '0;
      end
   end // always_comb

endmodule
