`timescale 1ns / 1ps

module i2c_master(
    input en,
    input [7:0] din,
    output reg [7:0] dout,
    output reg valid,
    input clk,
    output reg busy,
    output reg ack,
    input stop,
    inout sda,
    inout scl
    );

reg [3:0] state;
localparam idle=0;
localparam start1=1;
localparam start2=2;
localparam data1=3;
localparam data2=4;
localparam send_data=5;
localparam get_data1=6;
localparam get_data2=7;
localparam get_data3=8;
localparam stop_state1=9;
localparam stop_state2=10;

reg ssda,sscl,sda_dir,scl_dir;

reg [8:0] cnt_10us;

reg [7:0] buff;

reg [2:0] i;

reg master_type;

reg f1,f2,f3;

reg [2:0] temp;

reg stop_flag;

always @ (posedge clk) begin
	valid<=0;
	case (state)
		idle:begin
			sda_dir<=0;
			scl_dir<=0;
			busy<=0;
			if(en==1)begin
				state<=start1;
				cnt_10us<=0;
				busy<=1;
			end
		end
		
		start1:begin
			sda_dir<=1;
			ssda<=0;
			cnt_10us<=cnt_10us+1;
			if(cnt_10us==499)begin
				cnt_10us<=0;
				scl_dir<=1;
				sscl<=0;
				state<=start2;
			end
		end
		
		start2:begin
			
			if(cnt_10us<499)begin
				cnt_10us<=cnt_10us+1;
			end
			
			else begin
				busy<=0;
				if(en==1)begin
					cnt_10us<=0;
					state<=data1;
					buff<=din;
					busy<=1;
					if(din[0]==1)master_type=1;//read
					else master_type=0;//write
				end
			end
		end
		
		data1:begin
			ssda<=buff[7];
			cnt_10us<=cnt_10us+1;
			if(cnt_10us>173 && cnt_10us<325)
				sscl<=1;
			else
				sscl<=0;
			
			if(cnt_10us==499)begin
				cnt_10us<=0;
				i<=i+1;
				if(i==7)begin
					i<=0;
					state<=data2;
				end
				buff<={buff[6:0],1'b0};
			end
		end
		
		data2:begin
			sda_dir<=0;
			cnt_10us<=cnt_10us+1;
			if(cnt_10us>173 && cnt_10us<325)
				sscl<=1;
			else
				sscl<=0;
			
			if(cnt_10us==249)f1<=sda;
			if(cnt_10us==250)f2<=sda;
			if(cnt_10us==251)f3<=sda;
			
			if(cnt_10us==499)begin
				cnt_10us<=0;
				
				if((f1+f2+f3)<2)ack<=0;
				else ack<=1;
				
				if(master_type==0)state<=send_data;
				else state<=get_data1;
				
				i<=0;
				
				busy<=0;
			end
		end
		
		send_data:begin
			busy<=0;
			if(en==1)begin
				cnt_10us<=0;
				state<=data1;
				buff<=din;
				busy<=1;
			end
			
			if(stop==1)begin
				state<=stop_state1;
			end
		end
		
		get_data1:begin
			if(en==1)begin
				busy<=1;
				state<=get_data2;
				stop_flag<=0;
			end
			
			if(stop==1)begin
				busy<=1;
				state<=get_data2;
				stop_flag<=1;
			end
		end
		
		get_data2:begin
			sda_dir<=0;
			
			cnt_10us<=cnt_10us+1;
			if(cnt_10us>173 && cnt_10us<325)
				sscl<=1;
			else
				sscl<=0;
			
			if(cnt_10us==249)f1<=sda;
			if(cnt_10us==250)f2<=sda;
			if(cnt_10us==251)f3<=sda;
			
			if(cnt_10us==498)
				temp<=f1+f2+f3;
			if(cnt_10us==499)begin
				cnt_10us<=0;
				
				if(temp<2)buff<={buff[6:0],1'b0};
				else buff<={buff[6:0],1'b1};
				
				i<=i+1;
				if(i==7)begin
					i<=0;
					state<=get_data3;
				end
			end
		end
		
		get_data3:begin
			sda_dir<=1;
			if(stop_flag) ssda<=1;
			else  ssda<=0;
			
			cnt_10us<=cnt_10us+1;
			if(cnt_10us>173 && cnt_10us<325)
				sscl<=1;
			else
				sscl<=0;
			
			if(cnt_10us==499)begin
				valid<=1;
				dout<=buff;
				cnt_10us<=0;
				if(stop_flag)state<=stop_state1;
				else state<=get_data1;
			end
		end
		
		stop_state1:begin
			scl_dir<=0;
			
			cnt_10us<=cnt_10us+1;

			if(cnt_10us==499)begin
				cnt_10us<=0;
				state<=stop_state2;
			end
		end
		
		stop_state2:begin
			sda_dir<=0;
			
			cnt_10us<=cnt_10us+1;

			if(cnt_10us==499)begin
				cnt_10us<=0;
				state<=idle;
			end
		end
		
	endcase
end

assign sda=(sda_dir==1)?(ssda):1'bZ;
assign scl=(scl_dir==1)?(sscl):1'bZ;

endmodule
