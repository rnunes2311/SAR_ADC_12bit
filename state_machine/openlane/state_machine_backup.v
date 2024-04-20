module state_machine(
	input clk,
	input rst_z,
	input start,
	input en_offset_cal,
	input comp_p, comp_n,
	input vin_p_sw_on, vin_n_sw_on,
	input [3:0] debug_mux,
	input en_vcm_sw_o_i,
	input [10:0] vcm_o_i,
	
	output [5:0] data,
	output clk_data,
	output sample_o,
	output [10:0] vcm_o,
	output [10:0] vref_z_p_o,
	output [10:0] vref_z_n_o,
	output [10:0] vss_p_o,
	output [10:0] vss_n_o,
	output vcm_dummy_o, en_vcm_sw_o,
	output en_comp,
	output offset_cal_cycle,
	output en_offset_cal_o,
	output reg debug_out);

reg [1:0] state;
reg [11:0] result;
parameter idle = 0, sample = 1, convert = 2;



always @(posedge clk or negedge rst_z)
begin
	if (!rst_z)
		state <= idle;
	else
		case (state)
			idle:
				if (start)
					state <= sample;
				else
					state <= idle;
			sample:
				if (counter_sample)
					state <= convert;
				else
					state <= sample;
			convert:
				if (counter == 'b111111111111)
					state <= idle;
				else
					state <= convert;
			default:
				state <= idle;
		endcase
end



reg counter_sample;
always @ (posedge clk or negedge rst_z)
begin
	if (!rst_z)
		counter_sample <= 0;
	else if (state != sample)
		counter_sample <= 0;
	else
		counter_sample <= ~ counter_sample;


end

reg [11:0] counter;

always @ (posedge clk or negedge rst_z)
begin
	if (!rst_z)
		counter <= 'b000000000000;
	else if (state == idle || state  == sample)
		counter <= 'b000000000000;
	else if (state == convert) begin
		counter <= counter >> 1;
		counter[11] <= 1;
	end
end

integer i;

wire [11:0] en_dac_out;
assign en_dac_out = (~ counter) & ('b100000000000 + (counter >> 1));


always @(posedge clk or negedge rst_z)
begin
	if (!rst_z) begin
		result <= 'd0;
	end else if (clk) begin
		if (state == sample)
			result <= 'd0;
		else if (state == convert) begin
			for (i = 0; i < 12; i = i + 1) begin
				result[i] <= en_dac_out[i] ? comp_p : result[i];
			end
		end
	end
end

assign en_comp = ~clk & (state == convert) & ~(~ en_offset_cal & counter[0]);


wire allow_vcm_sw;
wire [10:0] allow_vref_sw;

assign offset_cal_cycle = counter[0] & en_offset_cal;
assign en_offset_cal_o = rst_z & en_offset_cal;
assign allow_vcm_sw = ~(vin_p_sw_on | vin_n_sw_on);
assign vcm_o = ~(counter[11:1] | {11 {~((state == convert) & allow_vcm_sw)}});
assign vcm_dummy_o = (state == convert) & allow_vcm_sw;
assign allow_vref_sw = (~ vcm_o_i) & counter[11:1];
assign vref_z_p_o = result[11:1] | (~ allow_vref_sw);
assign vref_z_n_o = (~result[11:1]) | (~ allow_vref_sw);
assign vss_p_o = result[11:1] & allow_vref_sw;
assign vss_n_o = (~result[11:1]) & allow_vref_sw;
assign en_vcm_sw_o = (counter[0] & (state == convert)) | (state == sample);
assign sample_o = ((state == sample) | en_vcm_sw_o_i) & ~counter[11] & (state != idle);

	
always @(*)
begin
	case (debug_mux)
		'd0: debug_out = (state == idle);
		'd1: debug_out = (state == sample);
		'd2: debug_out = (state == convert);
		'd3: debug_out = en_comp;
		'd4: debug_out = comp_p | comp_n;
		'd5: debug_out = comp_p;
		'd6: debug_out = comp_n;
		'd7: debug_out = counter[11];
		'd8: debug_out = counter[10];
		'd9: debug_out = counter[9];
		'd10: debug_out = counter[8];
		'd11: debug_out = counter[7];
		'd12: debug_out = counter[6];
		'd13: debug_out = counter[4];
		'd14: debug_out = counter[2];
		'd15: debug_out = counter[0];
	endcase
end

assign clk_data = counter[5] & (state == convert);
assign data = (counter[4] & (state == convert)) ? ~result[5:0] : ~result[11:6];

endmodule

