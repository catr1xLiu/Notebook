module Energy_Monitor_Control ( 	
   input door_open, window_open, mc_testmode, vac_mode,
   input i1eqi2,i1gti2,i1lti2,

	output blower_on, ac_on, furnace_on, at_temp,
	output HVAC_run, HVAC_increase, HVAC_decrease,
	output Vacation_led, door_open_led, window_open_led
); 

assign HVAC_decrease = i1lti2;
assign ac_on = i1lti2;

assign HVAC_increase = i1gti2;
assign furnace_on = i1gti2;

assign at_temp = i1eqi2;
assign door_open_led = door_open;
assign window_open_led = window_open;
assign Vacation_led = vac_mode;

wire force_HVAC_off;
assign force_HVAC_off = mc_testmode | door_open | window_open;

assign HVAC_run = force_HVAC_off == 1'b1 ? 1'b0 : ~(i1eqi2);
assign blower_on = HVAC_run;
endmodule
