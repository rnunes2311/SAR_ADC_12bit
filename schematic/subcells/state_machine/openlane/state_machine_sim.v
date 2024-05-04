module state_machine_sim;

	reg clk;
	reg rst_z;
	reg start;
	reg single_ended;
	reg en_offset_cal;
	reg comp_p;
	reg comp_n;
	reg vin_p_sw_on;
	reg vin_n_sw_on;
	reg [3:0] debug_mux;
	
	wire [5:0] data;
	wire clk_data;
	wire sample_o;
	wire [10:0] vcm;
	wire [10:0] vref_z_p;
	wire [10:0] vref_z_n;
	wire [10:0] vss_p;
	wire [10:0] vss_n;
	wire vcm_dummy; 
	wire en_vcm_sw;
	wire en_comp;
	wire offset_cal_cycle;
	wire en_offset_cal_o;
	wire debug_out;
	
	wire en_vcm_sw_i;
	wire [10:0] vcm_i;
	
	state_machine dut(
		.clk(clk),
		.rst_z(rst_z),
		.start(start),
		.single_ended(single_ended),
		.en_offset_cal(en_offset_cal),
		.comp_p(comp_p),
		.comp_n(comp_n),
		.vin_p_sw_on(vin_p_sw_on),
		.vin_n_sw_on(vin_n_sw_on),
		.debug_mux(debug_mux),
		.en_vcm_sw_o_i(en_vcm_sw_i),
		.vcm_o_i(vcm_i),
		.data(data),
		.clk_data(clk_data),
		.sample_o(sample_o),
		.vcm_o(vcm),
		.vref_z_p_o(vref_z_p),
		.vref_z_n_o(vref_z_n),
		.vss_p_o(vss_p),
		.vss_n_o(vss_n),
		.vcm_dummy_o(vcm_dummy),
		.en_vcm_sw_o(en_vcm_sw),
		.en_comp(en_comp),
		.offset_cal_cycle(offset_cal_cycle),
		.en_offset_cal_o(en_offset_cal_o),
		.debug_out(debug_out));

	assign en_vcm_sw_i = en_vcm_sw;
	assign vcm_i = vcm;

	initial begin
		$dumpfile("state_machine.vcd");
		$dumpvars(0,state_machine_sim);
		clk = 0;
		rst_z = 0;
		start = 0;
		single_ended = 0;
		en_offset_cal = 1;
		comp_p = 0;
		comp_n = 0;
		vin_p_sw_on = 0;
		vin_n_sw_on = 0;
		debug_mux = 'd0;
		
		#100
		rst_z = 1;
		#100
		start = 1;
		#100
		start = 0;
		#1000
		single_ended = 1;
		#100
		start = 1;
		#100
		start = 0;
		#500
		$finish();
	
	
	end



	always #10 clk = ~clk;


endmodule