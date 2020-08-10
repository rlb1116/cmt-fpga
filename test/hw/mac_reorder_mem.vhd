-- MAC reorder wrapper
-- Ryan Blanchard

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.user_pkg.all;

entity mac_reorder_mem is
	generic (
		width 		: positive := 64;
		N		: positive := 25
	);
	port (
		clk		: in	std_logic;
		a_rst		: in	std_logic;
		go		: in	std_logic;
		data_in		: in	std_logic_vector(width-1 downto 0);
		d_in_vld 	: in	std_logic;
		pipe_in		: out std_logic_vector(width-1 downto 0);
		p_in_vld 	: out std_logic;
		pipe_out	: in	std_logic_vector(width-1 downto 0);
		p_out_vld 	: in	std_logic;
		stall		: in	std_logic;
		data_out	: out std_logic_vector(width-1 downto 0);
		d_out_vld 	: out std_logic;
		done		: out std_logic
	);
end entity mac_reorder_mem;

architecture streamwise of mac_reorder_mem is
signal inmem_waddr, inmem_raddr, outmem_waddr, outmem_raddr : std_logic_vector(C_ADDR_WIDTH-1 downto 0);
signal inmem_wdata, inmem_rdata, outmem_wdata, outmem_rdata : std_logic_vector(width-1 downto 0);
signal inmem_wen, outmem_wen : std_logic;
signal im_wi, im_wj, im_wk, im_ri, im_rj, im_rk : std_logic_vector(C_ROOTN-1 downto 0);
signal om_wi, om_wj, om_wk, om_ri, om_rj, om_rk : std_logic_vector(C_ROOTN-1 downto 0);
signal inc_im_wi, inc_im_wj, inc_im_wk, inc_im_ri, inc_im_rj, inc_im_rk : std_logic;
signal inc_om_wi, inc_om_wj, inc_om_wk, inc_om_ri, inc_om_rj, inc_om_rk : std_logic;
signal im_vld, im_vld_dly, om_vld, om_vld_dly : std_logic;

type STATE_TYPE is (S_DT, S_DS, S_DR, S_DONE);
signal istate, owstate, orstate : STATE_TYPE; 
signal next_istate, next_owstate, next_orstate : STATE_TYPE; 

begin

	IN_MEM : entity work.ram(SYNC_READ_DURING_WRITE) 
		generic map (
			num_words	=> C_MEM_SIZE,
			word_width	=> width,
			addr_width	=> C_ADDR_WIDTH
		)
		port map (
			clk		=> clk,
			wen		=> inmem_wen,
			waddr		=> inmem_waddr,
			wdata		=> inmem_wdata,
			raddr		=> inmem_raddr,
			rdata		=> inmem_rdata
		);

	OUT_MEM : entity work.ram(SYNC_READ_DURING_WRITE) 
		generic map (
			num_words	=> C_MEM_SIZE,
			word_width	=> width,
			addr_width	=> C_ADDR_WIDTH
		)
		port map (
			clk		=> clk,
			wen		=> outmem_wen,
			waddr		=> outmem_waddr,
			wdata		=> outmem_wdata,
			raddr		=> outmem_raddr,
			rdata		=> outmem_rdata
		);
		
	CNT_IM_WI : entity work.counter 
		generic map (
			width		=> C_ROOTN,
			max		=> N-1
		)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> inc_im_wi,
			clr		=> a_rst,
			count		=> im_wi
		);
		
	CNT_IM_WJ : entity work.counter 
		generic map (
			width		=> C_ROOTN,
			max		=> N-1
		)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> inc_im_wj,
			clr		=> a_rst,
			count		=> im_wj
		);
		
	CNT_IM_WK : entity work.counter 
		generic map (
			width		=> C_ROOTN,
			max		=> N-1
		)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> inc_im_wk,
			clr		=> a_rst,
			count		=> im_wk
		);
		
	CNT_IM_RI : entity work.counter 
		generic map (
			width		=> C_ROOTN,
			max		=> N-1
		)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> inc_im_ri,
			clr		=> a_rst,
			count		=> im_ri
		);
		
	CNT_IM_RJ : entity work.counter 
		generic map (
			width		=> C_ROOTN,
			max		=> N-1
		)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> inc_im_rj,
			clr		=> a_rst,
			count		=> im_rj
		);
		
	CNT_IM_RK : entity work.counter 
		generic map (
			width		=> C_ROOTN,
			max		=> N-1
		)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> inc_im_rk,
			clr		=> a_rst,
			count		=> im_rk
		);
		
	CNT_OM_WI : entity work.counter 
		generic map (
			width		=> C_ROOTN,
			max		=> N-1
		)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> inc_om_wi,
			clr		=> a_rst,
			count		=> om_wi
		);
		
	CNT_OM_WJ : entity work.counter 
		generic map (
			width		=> C_ROOTN,
			max		=> N-1
		)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> inc_om_wj,
			clr		=> a_rst,
			count		=> om_wj
		);
		
	CNT_OM_WK : entity work.counter 
		generic map (
			width		=> C_ROOTN,
			max		=> N-1
		)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> inc_om_wk,
			clr		=> a_rst,
			count		=> om_wk
		);
		
	CNT_OM_RI : entity work.counter 
		generic map (
			width		=> C_ROOTN,
			max		=> N-1
		)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> inc_om_ri,
			clr		=> a_rst,
			count		=> om_ri
		);
		
	CNT_OM_RJ : entity work.counter 
		generic map (
			width		=> C_ROOTN,
			max		=> N-1
		)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> inc_om_rj,
			clr		=> a_rst,
			count		=> om_rj
		);
		
	CNT_OM_RK : entity work.counter 
		generic map (
			width		=> C_ROOTN,
			max		=> N-1
		)
		port map (
			clk		=> clk,
			a_rst		=> a_rst,
			inc		=> inc_om_rk,
			clr		=> a_rst,
			count		=> om_rk
		);
		
	DLY_IM_VLD : entity work.reg1
		port map (
			clk 	=> clk,
			a_rst	=> a_rst,
			D		=> im_vld,
			Q		=> im_vld_dly
		);
		
	DLY_OM_VLD : entity work.reg1
		port map (
			clk 	=> clk,
			a_rst	=> a_rst,
			D		=> om_vld,
			Q		=> om_vld_dly
		);
	
	process (clk, a_rst)
	begin 
		if (a_rst = '1') then
			istate <= S_DT;
			owstate <= S_DT;
			orstate <= S_DT;
		elsif (clk'event and clk = '1') then
			istate <= next_istate;
			owstate <= next_owstate;
			orstate <= next_orstate; 
		end if;
	end process; 
	
	process (istate, data_in, d_in_vld, im_wi, im_wj, im_wk, im_ri, im_rj, im_rk, go, inmem_rdata, im_vld_dly, stall) 
	-- Input mem storage
	variable im_vld_var : std_logic;
	begin
		inc_im_wi <= '0';
		inc_im_wj <= '0';
		inc_im_wk <= '0';
		inc_im_ri <= '0';
		inc_im_rj <= '0';
		inc_im_rk <= '0';
		next_istate <= istate;
		
		pipe_in <= (others => '0');
		--p_in_vld <= '0';
		im_vld_var := '0';
		
		case istate is
			when S_DT => 
				-- this first state is when data is streaming in. We need to store it in order. 
				inc_im_wk <= d_in_vld;
				if (to_integer(unsigned(im_wk)) = N-1) then 
					inc_im_wj <= d_in_vld;
				end if;
				if (to_integer(unsigned(im_wj)) = N-1) and (to_integer(unsigned(im_wk)) = N-1) then 
					inc_im_wi <= d_in_vld;
				end if;
				if (to_integer(unsigned(im_wk)) = N-1) and (to_integer(unsigned(im_wj)) = N-1) and (to_integer(unsigned(im_wi)) = N-1) and (d_in_vld = '1') then 
					next_istate <= S_DS;
				end if;
				
				pipe_in <= data_in;
				--p_in_vld <= d_in_vld;
				
			when S_DS =>
				-- we have all the input data stored; now send it to pipe in S order (stride = N)
				if (stall /= '1') then 
					inc_im_rj <= '1';
					if (to_integer(unsigned(im_rj)) = N-1) then 
						inc_im_rk <= '1';
					end if;
					if (to_integer(unsigned(im_rk)) = N-1) and (to_integer(unsigned(im_rj)) = N-1) then 
						inc_im_ri <= '1';
					end if;
					if (to_integer(unsigned(im_rk)) = N-1) and (to_integer(unsigned(im_rj)) = N-1) and (to_integer(unsigned(im_ri)) = N-1) then 
						next_istate <= S_DR;
					end if;
				
					pipe_in <= inmem_rdata;		-- read input ram w/ 1 cycle delay
					im_vld_var := '1';
				end if;
			
			when S_DR =>
				-- now send it to pipe in R order (stride = N*N)
				if (stall /= '1') then 
					inc_im_ri <= '1';
					if (to_integer(unsigned(im_ri)) = N-1) then 
						inc_im_rk <= '1';
					end if;
					if (to_integer(unsigned(im_rk)) = N-1) and (to_integer(unsigned(im_ri)) = N-1) then 
						inc_im_rj <= '1';
					end if;
					if (to_integer(unsigned(im_rk)) = N-1) and (to_integer(unsigned(im_rj)) = N-1) and (to_integer(unsigned(im_ri)) = N-1) then 
						next_istate <= S_DONE;
					end if;
				
					pipe_in <= inmem_rdata;		-- read input ram w/ 1 cycle delay
					im_vld_var := '1';
				end if;
			
			when S_DONE =>
				if (im_vld_var = '1' or im_vld_dly = '1') then
					pipe_in <= inmem_rdata;
				end if;
				if (go = '1') then
					next_istate <= S_DT; 
				end if;
			
			when others => null;
		end case;
		im_vld <= im_vld_var;
	end process;

	process (owstate, orstate, pipe_out, p_out_vld, go, om_wi, om_wj, om_wk, om_ri, om_rj, om_rk, om_vld_dly, outmem_raddr, outmem_waddr, stall)
	-- output mem storage and data out
	variable om_vld_var : std_logic;
	begin
		inc_om_wi <= '0';
		inc_om_wj <= '0';
		inc_om_wk <= '0';
		inc_om_ri <= '0';
		inc_om_rj <= '0';
		inc_om_rk <= '0';
		next_owstate <= owstate;
		next_orstate <= orstate;
		done <= '0';
		om_vld_var := '0';
		
		case owstate is 
			when S_DT => 
				-- this first stream doesn't need to be reordered, but we will put it in the ram for consistency
				inc_om_wk <= p_out_vld;
				if (to_integer(unsigned(om_wk)) = N-1) then 
					inc_om_wj <= p_out_vld;
				end if;
				if (to_integer(unsigned(om_wj)) = N-1) and (to_integer(unsigned(om_wk)) = N-1) then 
					inc_om_wi <= p_out_vld;
				end if;
				if (to_integer(unsigned(om_wk)) = N-1) and (to_integer(unsigned(om_wj)) = N-1) and (to_integer(unsigned(om_wi)) = N-1) and (p_out_vld = '1') then 
					next_owstate <= S_DS;
				end if;
				
			
			when S_DS =>
				-- reorder from S order to natural storage order
				inc_om_wj <= p_out_vld;
				if (to_integer(unsigned(om_wj)) = N-1) then 
					inc_om_wk <= p_out_vld;
				end if;
				if (to_integer(unsigned(om_wk)) = N-1) and (to_integer(unsigned(om_wj)) = N-1) then 
					inc_om_wi <= p_out_vld;
				end if;
				if (to_integer(unsigned(om_wk)) = N-1) and (to_integer(unsigned(om_wj)) = N-1) and (to_integer(unsigned(om_wi)) = N-1) and (p_out_vld = '1') then 
					next_owstate <= S_DR;
				end if;
			
			when S_DR => 
				-- reorder from R order to natural storage order
				inc_om_wi <= p_out_vld;
				if (to_integer(unsigned(om_wi)) = N-1) then 
					inc_om_wk <= p_out_vld;
				end if;
				if (to_integer(unsigned(om_wk)) = N-1) and (to_integer(unsigned(om_wi)) = N-1) then 
					inc_om_wj <= p_out_vld;
				end if;
				if (to_integer(unsigned(om_wk)) = N-1) and (to_integer(unsigned(om_wj)) = N-1) and (to_integer(unsigned(om_wi)) = N-1) and (p_out_vld = '1') then 
					next_owstate <= S_DONE;
				end if;
			
			when S_DONE =>
				if (go = '1') then
					next_owstate <= S_DT;
				end if;
			
			when others => null;
		end case;
						
				
		case orstate is
			when S_DT =>
				if (owstate = S_DS) or (unsigned(outmem_raddr) < unsigned(outmem_waddr)) then
					-- read dt output if its address is less than the currently written address since both occur in k-j-i order
					om_vld_var := not stall; 
				end if;
				if (to_integer(unsigned(om_rk)) = N-1) and (to_integer(unsigned(om_rj)) = N-1) and (to_integer(unsigned(om_ri)) = N-1) and (om_vld_var = '1') then 
					next_orstate <= S_DS;
				end if;
				
			when S_DS =>
				if (owstate = S_DR) or (unsigned(om_ri) < unsigned(om_wi)) or (unsigned(om_rk) < unsigned(om_wk)) then
					-- here outputs accumulate in j-k-i order; must read them in k-j-i order only after they've been written
					om_vld_var := not stall;
				end if;
				if (to_integer(unsigned(om_rk)) = N-1) and (to_integer(unsigned(om_rj)) = N-1) and (to_integer(unsigned(om_ri)) = N-1) and (om_vld_var = '1') then 
					next_orstate <= S_DR;
				end if;
			
			when S_DR =>
				if (owstate = s_DONE) or (unsigned(om_rj) < unsigned(om_wj)) or ((unsigned(om_rj) = unsigned(om_wj)) and (unsigned(om_rk) < unsigned(om_wk))) then
					-- here outputs accumulate in i-k-j order; must read them in k-j-i order only after they've been written 
					om_vld_var := not stall;
				end if;
				if (to_integer(unsigned(om_rk)) = N-1) and (to_integer(unsigned(om_rj)) = N-1) and (to_integer(unsigned(om_ri)) = N-1) and (om_vld_var = '1') then 
					next_orstate <= S_DONE;
				end if;
			
			when S_DONE =>
				if (om_vld_var = '0') and (om_vld_dly = '0') then 
					done <= '1';
				end if;
				if (go = '1') then
					next_orstate <= S_DT;
				end if;
			
			when others => null;
		end case;
		
		-- increment outmem_raddr when a valid output is read
		if (stall /= '1') then 
			inc_om_rk <= om_vld_var;
			if (to_integer(unsigned(om_rk)) = N-1) then 
				inc_om_rj <= om_vld_var;
			end if;
			if (to_integer(unsigned(om_rj)) = N-1) and (to_integer(unsigned(om_rk)) = N-1) then 
				inc_om_ri <= om_vld_var;
			end if;
		end if;
		om_vld <= om_vld_var;
	end process; 
	
	p_in_vld <= d_in_vld or im_vld_dly;
	
	inmem_waddr <= im_wi & im_wj & im_wk;
	inmem_wen <= d_in_vld;
	inmem_wdata <= data_in;
	inmem_raddr <= im_ri & im_rj & im_rk;
	outmem_waddr <= om_wi & om_wj & om_wk;
	outmem_wen <= p_out_vld;
	outmem_wdata <= pipe_out;
	outmem_raddr <= om_ri & om_rj & om_rk;
	
	data_out <= outmem_rdata; 	-- 1 cycle delay from output ram 
	d_out_vld <= om_vld_dly;	-- valid signal produced after current read address has been written; delayed 1 cycle to account for ram delay

end architecture streamwise;







