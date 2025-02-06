LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY I2C_Master_advanced_tb IS
END I2C_Master_advanced_tb;
 
ARCHITECTURE behavior OF I2C_Master_advanced_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT I2C_Master
    Port ( clk 			: in  	STD_LOGIC;
           SDA 			: inout  STD_LOGIC;
           SCL 			: inout  STD_LOGIC;
           din 			: in  	STD_LOGIC_VECTOR (7 downto 0);
           dout 			: out  	STD_LOGIC_VECTOR (7 downto 0);
           start_en 		: in  	STD_LOGIC;
           stop 			: in  	STD_LOGIC;
           busy 			: buffer	STD_LOGIC;
           finish 		: out  	STD_LOGIC;
           ack_in 		: in  	STD_LOGIC;
           ack_out 		: out  	STD_LOGIC;
           slave_addr 	: in  	STD_LOGIC_VECTOR (6 downto 0);
           rw 				: in  	STD_LOGIC);
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal din : std_logic_vector(7 downto 0) := (others => '0');
   signal start_en : std_logic := '0';
   signal stop : std_logic := '0';
   signal ack_in : std_logic := '0';
   signal slave_addr : std_logic_vector(6 downto 0) := (others => '0');
   signal rw : std_logic := '0';

	--BiDirs
   signal SDA : std_logic:='Z';
   signal SCL : std_logic:='Z';

 	--Outputs
   signal dout : std_logic_vector(7 downto 0);
   signal busy : std_logic;
   signal finish : std_logic;
   signal ack_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	
	type state_type is (idle,chk_sla,wr,rd,stp);
	signal state:state_type;
	
	signal last_scl,last_sda:std_logic:='0';
	signal slave_rw:std_logic:='0';
	signal slave_ack:std_logic:='0';
	signal i:integer range 0 to 8;
	constant data_slave : std_logic_vector(7 downto 0):=x"AA";
	signal buff_slave : std_logic_vector(7 downto 0):=x"00";
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: I2C_Master PORT MAP (
          clk => clk,
          SDA => SDA,
          SCL => SCL,
          din => din,
          dout => dout,
          start_en => start_en,
          stop => stop,
          busy => busy,
          finish => finish,
          ack_in => ack_in,
          ack_out => ack_out,
          slave_addr => slave_addr,
          rw => rw
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		SDA<='Z';
		SCL<='Z';
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		
      -- insert stimulus here
		
--		rw<='0';--write
--		slave_addr<="1101000";--ds1307 addr
--		wait for 20 ns;
--		start_en<='1';
--		wait for 20 ns;
--		start_en<='0';
--		wait for 20 ns;
--		wait until busy='0';
--		
--		wait for 1 us;
--		din<=x"55";
--		wait for 20 ns;
--		start_en<='1';
--		wait for 20 ns;
--		start_en<='0';
--		wait for 20 ns;
--		wait until busy='0';
--		
--		
--		
		rw<='1';--read
		slave_addr<="1101000";--ds1307 addr
		wait for 20 ns;
		start_en<='1';
		wait for 20 ns;
		start_en<='0';
		wait for 20 ns;
		wait until busy='0';
		wait for 1 us;
		
		wait for 1 us;
		ack_in<='0';--ack
		wait for 20 ns;
		start_en<='1';
		wait for 20 ns;
		start_en<='0';
		wait for 20 ns;
		wait until busy='0';
		wait for 1 us;
		
		wait for 1 us;
		ack_in<='0';--ack
		wait for 20 ns;
		start_en<='1';
		wait for 20 ns;
		start_en<='0';
		wait for 20 ns;
		wait until busy='0';
		wait for 1 us;
		
		wait for 1 us;
		ack_in<='1';--nack
		wait for 20 ns;
		start_en<='1';
		wait for 20 ns;
		start_en<='0';
		wait for 20 ns;
		wait until busy='0';
		wait for 1 us;

      wait;
   end process;

	process(clk)
	begin
		if(rising_edge(clk))then
			last_scl<=SCL;
			last_sda<=SDA;
			case state is
				when idle=>
					if(last_sda='Z' and SDA='0' and SCL='Z')then
						state<=chk_sla;
						i<=0;
						slave_ack<='1';
					end if;
					
				when chk_sla=>
					if(last_scl='1' and SCL='0')then--falling
						buff_slave<=buff_slave(6 downto 0) & SDA;
						i<=i+1;
						if(i=7)then
							if(buff_slave(6 downto 0)="1101000")then
								SDA<='0';
								slave_ack<='0';
							end if;
						end if;
						if(i=8)then
							i<=0;
							if(slave_ack='0')then
								if(buff_slave(0)='1')then
									state<=rd;
								else
									state<=wr;
									SDA<='Z';
								end if;
							end if;
						end if;
					end if;
					
				when wr=>
					if(last_scl='1' and SCL='0')then--falling
						buff_slave<=buff_slave(6 downto 0) & SDA;
						i<=i+1;
						if(i=7)then
							SDA<='0';
						end if;
						if(i=8)then
							i<=0;
							SDA<='Z';
						end if;
					end if;
					
				when rd=>
					if(i<8)then
						SDA<=data_slave(7-i);
					else
						SDA<='Z';
					end if;
					
					if(last_scl='1' and SCL='0')then--falling
						buff_slave<=buff_slave(6 downto 0) & SDA;
						i<=i+1;
						if(i=7)then
							SDA<='Z';
						end if;
						if(i=8)then
							i<=0;
						end if;
					end if;
					
				when stp=>
			end case;
		end if;
	end process;

END;

