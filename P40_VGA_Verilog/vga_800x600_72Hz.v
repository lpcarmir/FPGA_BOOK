`timescale 1ns / 1ps

module vga_800x600_72Hz(
    input            clk,
    output reg [4:0] Red,
    output reg [5:0] Green,
    output reg [4:0] Blue,
    output reg       HSync,
    output reg       VSync
    );

reg [10:0] hcnt;//max=1040
reg [9:0]  vcnt;//max=666;

wire [7:0]  data;
reg  [9:0]  sdata;
wire  [6:0]  x;
wire  [5:0]  y;

reg  [15:0] din;
reg  [13:0] addri;
wire [15:0] dout;
reg  [13:0] addro;

reg  [6:0]  row;
reg  [5:0]  col;
reg  [3:0]  row_cnt;
reg  [3:0]  col_cnt;

localparam send_addr=0;
localparam read_dout=1;
localparam wait_state=2;
localparam wait_wr_en0=3;
localparam add_state=4;
localparam mul_state=5;
localparam update_addr_state=6;
localparam wr_en_state=7;
reg  [2:0]  state;

reg [6:0]  sum_sel_x;
reg [6:0]  sum_y_i;
reg [13:0]  sum_y_i_8;

wire  wr_en;
reg   wr_en2;
reg   sig_busy;

reg [9:0]  addr_rom;
wire [7:0]  dout_rom;
reg [2:0]  sel;
reg [2:0]  i;

wire [35:0] CONTROL0;
wire [35:0] CONTROL1;
wire [29:0] ASYNC_OUT;
wire [39:0] ila_din;

assign data=ASYNC_OUT[7:0];
assign x=ASYNC_OUT[14:8];
assign y=ASYNC_OUT[20:15];
assign wr_en=ASYNC_OUT[21];

ram1 u1 (
  .clka(clk), // input clka
  .wea(wr_en2), // input [0 : 0] wea
  .addra(addri), // input [13 : 0] addra
  .dina(din), // input [15 : 0] dina
  .clkb(clk), // input clkb
  .addrb(addro), // input [13 : 0] addrb
  .doutb(dout) // output [15 : 0] doutb
);

icon1 u2 (
    .CONTROL0(CONTROL0), // INOUT BUS [35:0]
    .CONTROL1(CONTROL1) // INOUT BUS [35:0]
);

vio1 u3 (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .ASYNC_OUT(ASYNC_OUT) // OUT BUS [29:0]
);

rom1 u4 (
  .clka(clk), // input clka
  .addra(addr_rom), // input [9 : 0] addra
  .douta(dout_rom) // output [7 : 0] douta
);

ila1 u5 (
    .CONTROL(CONTROL1), // INOUT BUS [35:0]
    .CLK(clk), // IN
    .TRIG0(ila_din) // IN BUS [39:0]
);

initial begin
	hcnt=0;
	vcnt=0;
	Red=0;
	Green=0;
	Blue=0;
end

assign ila_din={1'b0,wr_en,wr_en2,sig_busy,dout_rom,din[7:0],addri,i,sel};

always @(posedge clk) begin
	if(wr_en==1 & sig_busy==0)begin
		sig_busy<=1'b1;
		sel<=0;
		i<=0;
		sdata<=data*3'h6;
		state<=send_addr;
	end
	
	if(sig_busy==1'b1)begin
		case (state)
			send_addr:begin
				addr_rom<=sdata+sel;
				state<=read_dout;
			end
			
			read_dout:begin
				state<=add_state;	
			end
			
			add_state:begin
				sum_sel_x<=sel+x;
				sum_y_i<=y+i;
				state<=mul_state;
			end
			
			mul_state:begin
				sum_y_i_8<=sum_y_i*80;
				state<=update_addr_state;
			end
			
			update_addr_state:begin
				addri<=sum_y_i_8+sum_sel_x;
				if(dout_rom[i]==0)
					din<=0;
				else
					din<=16'hFFFF;
				state<=wr_en_state;
			end
			
			wr_en_state:begin
				wr_en2<=1'b1;
				state<=wait_state;
			end
				
			wait_state:begin
				wr_en2<=1'b0;
				i<=i+1'b1;
				if(i==7)begin
					i<=0;
					sel<=sel+1'b1;
					if(sel==5)begin
						sel<=0;
						wr_en2<=1'b0;
						
						if(wr_en==1)
							state<=wait_wr_en0;
						else
							sig_busy<=0;
					end
					else
						state<=send_addr;
				end
				else
					state<=read_dout;
			end
			
			wait_wr_en0:begin
				if(wr_en==0)begin
					state<=send_addr;
					sig_busy<=0;
				end
			end
		endcase
	end
end

always @(posedge clk) begin
	hcnt<=hcnt+1'b1;
	if(hcnt>=1040)begin
		hcnt<=0;
		vcnt<=vcnt+1'b1;
		if(vcnt>=666)begin
			vcnt<=0;
		end
		if(vcnt<600)begin
			col_cnt<=col_cnt+1'b1;
			if(col_cnt==9)begin
				col_cnt<=0;
				col<=col+1'b1;
			end
		end
		else begin
			col_cnt<=0;
			col<=0;
		end
	end
	
	if(hcnt<800)begin
		row_cnt<=row_cnt+1'b1;
		if(row_cnt==9)begin
			row_cnt<=0;
			row<=row+1'b1;
		end
	end
	else begin
		row_cnt<=0;
		row<=0;
	end
	
	addro<=row+col*80;
end

always @(posedge clk) begin
	if(hcnt<800 & vcnt<600)begin
		Red<=dout[15:11];
		Green<=dout[10:5];
		Blue<=dout[4:0];
	end
	else begin
		Red<=5'b0;
		Green<=6'b0;
		Blue<=5'b0;
	end

	/*if(vcnt>600)begin
		addr<=0;
	end*/
end

always @(posedge clk) begin
	if(hcnt>856 & hcnt<976)	
		HSync<=1'b1;
	else
		HSync<=1'b0;
	
	if(vcnt>637 & vcnt<643)	
		VSync<=1'b1;
	else
		VSync<=1'b0;
end

endmodule
