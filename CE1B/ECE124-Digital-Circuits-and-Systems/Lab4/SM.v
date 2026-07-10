module SM ( 
	input clock,
	input reset,
	input sm_clken,
  // Inputs for programming logic
  input motion,
  input x_gt, input x_lt, input x_eq,
  input y_gt, input y_lt, input y_eq,
  input extended,
  // Outputs
  output reg x_cnt_en,
  output reg x_cnt_up1_dwn0,
  output reg y_cnt_en, 
  output reg y_cnt_up1_dwn0,
  output reg posc_err,
  output reg extender_enbl,
  output reg capture_enable 
);

// REGISTER SECTION

parameter     STATE_TAKING_TARGET_INPUT         = 2'b01,
              STATE_IN_MOTION                   = 2'b10,
              STATE_AWAIT_EXTENDER_RETRACTION   = 2'b11,
              STATE_AT_REF                      = 2'b00;

reg [1:0] current_state, next_state;

// RESET OF STATE MACHINE
//
// My understanding is that "reset" stops the robot arm. Therefore, we trick
// the system that we are already at reference even if we are not.
// 
// The next time the motion button is released, the arm will resume moving
// towards the setpoint.


always@(posedge clock)
begin 
  if (reset)
    current_state <= STATE_AT_REF;
  else if (sm_clken)
    current_state <= next_state;
end 

// TRANSITION LOGIC & DECODER SECTION
//
// This is a Mealy State Machine. But the output is only dependent to the the
// input during STATE_IN_MOTION 


always@(*)
begin 

case (current_state)
  // STATE: STATE_TAKING_TARGET_INPUT
  // MOTION button is pressed, the robot is taking target input.
  // 
  // NEXT STATE: 
  // - When the MOTION button is released, start moving. 
  // - However, if we are already at target, ignore this command.
  // - Besides, if extender is not retracted, System Fault is trigerred. 
  //
  // OUTPUTS:
  // - X and Y counters are DISABLED.
  // - System Fault Indicator is OFF.
  // - Extender is ALLOWED to move. 
  // - Capturing is ENABLED. 
  STATE_TAKING_TARGET_INPUT:
  begin
    if        (motion)
      next_state      = STATE_TAKING_TARGET_INPUT;
    else if   (x_eq & y_eq)
      next_state      = STATE_AT_REF;
    else if   (extended)
      next_state      = STATE_AWAIT_EXTENDER_RETRACTION; 
    else 
      next_state      = STATE_IN_MOTION;

    x_cnt_en          = 1'b0;
    x_cnt_up1_dwn0    = 1'b0;
    y_cnt_en          = 1'b0;
    y_cnt_up1_dwn0    = 1'b0;
    posc_err          = 1'b0;
    extender_enbl     = 1'b1;
    capture_enable    = 1'b1;
  end 

  // STATE: STATE_AWAIT_EXTENDER_RETRACTION
  // MOTION button is released, the robot goes back to listening for commands. 
  // However, the extender is not retracted and the robot is not allowed to move. 
  // 
  // NEXT STATE: 
  // - When the extender is retracted, error is cleared. 
  //
  // OUTPUTS:
  // - X and Y counters are DISABLED.
  // - System Fault Indicator is ON.
  // - Extender is ALLOWED to move. 
  // - Capturing is DISABLED. 
  STATE_AWAIT_EXTENDER_RETRACTION:
  begin 
    if (extended)
      next_state      = STATE_AWAIT_EXTENDER_RETRACTION;
    else 
      next_state      = STATE_AT_REF;
    
    x_cnt_en          = 1'b0;
    x_cnt_up1_dwn0    = 1'b0;
    y_cnt_en          = 1'b0;
    y_cnt_up1_dwn0    = 1'b0;
    posc_err          = 1'b1;
    extender_enbl     = 1'b1;
    capture_enable    = 1'b0;
  end 


  // STATE: STATE_IN_MOTION
  // The robot is actively moving toward the target position. 
  // 
  // NEXT STATE: 
  // - When the robot reached the target position, it goes to idle state
  // (AT_REF)
  //
  // OUTPUTS:
  // - X and Y counters count in the direction towards target.
  // - System Fault Indicator is OFF.
  // - Extender is NOT ALLOWED to move. 
  // - Capturing is DISABLED. 
  STATE_IN_MOTION:
  begin 
    if (x_eq & y_eq)
      next_state      = STATE_AT_REF;
    else 
      next_state      = STATE_IN_MOTION;

    x_cnt_en          = ~x_eq;
    x_cnt_up1_dwn0    = x_lt;
    y_cnt_en          = ~y_eq;
    y_cnt_up1_dwn0    = y_lt;
    posc_err          = 1'b0;
    extender_enbl     = 1'b0;
    capture_enable    = 1'b0;
  end 


  // STATE: STATE_AT_REF
  // The robot have reached the target position and is sitting idle. 
  // 
  // NEXT STATE: 
  // - When the MOTION is pressed, the robot will start capturing input. 
  //
  // OUTPUTS:
  // - X and Y counters are STOPPED.
  // - System Fault Indicator is OFF.
  // - Extender is ALLOWED to move. 
  // - Capturing is DISABLED. 
  STATE_AT_REF:
  begin 
    if (motion)
      next_state      = STATE_TAKING_TARGET_INPUT;
    else 
      next_state      = STATE_AT_REF;
      
    x_cnt_en          = 1'b0;
    x_cnt_up1_dwn0    = 1'b0;
    y_cnt_en          = 1'b0;
    y_cnt_up1_dwn0    = 1'b0;
    posc_err          = 1'b0;
    extender_enbl     = 1'b1;
    capture_enable    = 1'b0;
  end 

  // DEFAULT: will never get executed, included so no inferred latch generated
  default:
  begin 
    next_state        = STATE_AT_REF; 
    x_cnt_en          = 1'b0;
    x_cnt_up1_dwn0    = 1'b0;
    y_cnt_en          = 1'b0;
    y_cnt_up1_dwn0    = 1'b0;
    posc_err          = 1'b0;
    extender_enbl     = 1'b0;
    capture_enable    = 1'b0;
  end
endcase 
end 

endmodule
