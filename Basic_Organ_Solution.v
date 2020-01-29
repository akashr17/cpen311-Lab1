`default_nettype none
module Basic_Organ_Solution(

    //////////// CLOCK //////////
    CLOCK_50,

    //////////// LED //////////
    LEDR,

    //////////// KEY //////////
    KEY,

    //////////// SW //////////
    SW,

    //////////// SEG7 //////////
    HEX0,
    HEX1,
    HEX2,
    HEX3,
    HEX4,
    HEX5,

    //////////// Audio //////////
    AUD_ADCDAT,
    AUD_ADCLRCK,
    AUD_BCLK,
    AUD_DACDAT,
    AUD_DACLRCK,
    AUD_XCK,

    //////////// I2C for Audio  //////////
    FPGA_I2C_SCLK,
    FPGA_I2C_SDAT,
    
    //////// GPIO //////////
    GPIO_0,
    GPIO_1,
    
);

//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input                       CLOCK_50;

//////////// LED //////////
output           [9:0]      LEDR;

//////////// KEY //////////
input            [3:0]      KEY;

//////////// SW //////////
input            [9:0]      SW;

//////////// SEG7 //////////
output           [6:0]      HEX0;
output           [6:0]      HEX1;
output           [6:0]      HEX2;
output           [6:0]      HEX3;
output           [6:0]      HEX4;
output           [6:0]      HEX5;

//////////// Audio //////////
input                       AUD_ADCDAT;
inout                       AUD_ADCLRCK;
inout                       AUD_BCLK;
output                      AUD_DACDAT;
inout                       AUD_DACLRCK;
output                      AUD_XCK;

//////////// I2C for Audio  //////////
output                      FPGA_I2C_SCLK;
inout                       FPGA_I2C_SDAT;

//////////// GPIO //////////
inout           [35:0]      GPIO_0;
inout           [35:0]      GPIO_1;                             


//=======================================================
//  REG/WIRE declarations
//=======================================================
// Input and output declarations
logic CLK_50M;
logic  [7:0] LED;
assign CLK_50M =  CLOCK_50;
assign LEDR[7:0] = LED[7:0];


wire            [7:0]      LCD_DATA;
wire                       LCD_EN;
wire                       LCD_ON;
wire                       LCD_RS;
wire                       LCD_RW;

assign GPIO_0[7:0] = LCD_DATA;
assign GPIO_0[8] = LCD_EN;
assign GPIO_0[9] = LCD_ON;
assign GPIO_0[10] = LCD_RS;
assign GPIO_0[11] = LCD_RS;
assign GPIO_0[12] = LCD_RW;


//Character definitions

//numbers
parameter character_0 =8'h30;
parameter character_1 =8'h31;
parameter character_2 =8'h32;
parameter character_3 =8'h33;
parameter character_4 =8'h34;
parameter character_5 =8'h35;
parameter character_6 =8'h36;
parameter character_7 =8'h37;
parameter character_8 =8'h38;
parameter character_9 =8'h39;


//Uppercase Letters
parameter character_A =8'h41;
parameter character_B =8'h42;
parameter character_C =8'h43;
parameter character_D =8'h44;
parameter character_E =8'h45;
parameter character_F =8'h46;
parameter character_G =8'h47;
parameter character_H =8'h48;
parameter character_I =8'h49;
parameter character_J =8'h4A;
parameter character_K =8'h4B;
parameter character_L =8'h4C;
parameter character_M =8'h4D;
parameter character_N =8'h4E;
parameter character_O =8'h4F;
parameter character_P =8'h50;
parameter character_Q =8'h51;
parameter character_R =8'h52;
parameter character_S =8'h53;
parameter character_T =8'h54;
parameter character_U =8'h55;
parameter character_V =8'h56;
parameter character_W =8'h57;
parameter character_X =8'h58;
parameter character_Y =8'h59;
parameter character_Z =8'h5A;

//Lowercase Letters
parameter character_lowercase_a= 8'h61;
parameter character_lowercase_b= 8'h62;
parameter character_lowercase_c= 8'h63;
parameter character_lowercase_d= 8'h64;
parameter character_lowercase_e= 8'h65;
parameter character_lowercase_f= 8'h66;
parameter character_lowercase_g= 8'h67;
parameter character_lowercase_h= 8'h68;
parameter character_lowercase_i= 8'h69;
parameter character_lowercase_j= 8'h6A;
parameter character_lowercase_k= 8'h6B;
parameter character_lowercase_l= 8'h6C;
parameter character_lowercase_m= 8'h6D;
parameter character_lowercase_n= 8'h6E;
parameter character_lowercase_o= 8'h6F;
parameter character_lowercase_p= 8'h70;
parameter character_lowercase_q= 8'h71;
parameter character_lowercase_r= 8'h72;
parameter character_lowercase_s= 8'h73;
parameter character_lowercase_t= 8'h74;
parameter character_lowercase_u= 8'h75;
parameter character_lowercase_v= 8'h76;
parameter character_lowercase_w= 8'h77;
parameter character_lowercase_x= 8'h78;
parameter character_lowercase_y= 8'h79;
parameter character_lowercase_z= 8'h7A;

//Other Characters
parameter character_colon = 8'h3A;          //':'
parameter character_stop = 8'h2E;           //'.'
parameter character_semi_colon = 8'h3B;   //';'
parameter character_minus = 8'h2D;         //'-'
parameter character_divide = 8'h2F;         //'/'
parameter character_plus = 8'h2B;          //'+'
parameter character_comma = 8'h2C;          // ','
parameter character_less_than = 8'h3C;    //'<'
parameter character_greater_than = 8'h3E; //'>'
parameter character_equals = 8'h3D;         //'='
parameter character_question = 8'h3F;      //'?'
parameter character_dollar = 8'h24;         //'$'
parameter character_space=8'h20;           //' '     
parameter character_exclaim=8'h21;          //'!'

`define DO {character_exclaim,character_D,character_O,character_exclaim} //this writes !DO! 
`define RE {character_exclaim,character_R,character_E,character_exclaim} //this writes !RE!
`define MI {character_exclaim,character_M,character_I,character_exclaim} //this writes !MI!
`define FA {character_exclaim,character_F,character_A,character_exclaim} //this writes !FA!
`define SO {character_exclaim,character_S,character_O,character_exclaim} //this writes !SO!
`define LA {character_exclaim,character_L,character_A,character_exclaim} //this writes !LA!
`define SI {character_exclaim,character_S,character_I,character_exclaim} //this writes !SI!
`define DO2 {character_D,character_O,character_2,character_space}        //this writes  DO2

`define DOfreq  16'h20B//these numbers represent the frequncy in terms of hexadecimals
`define REfreq  16'h24B
`define MIfreq  16'h293
`define FAfreq  16'h2BA
`define SOfreq  16'h30F
`define LAfreq  16'h3DB
`define SIfreq  16'h370
`define DO2freq 16'h416

wire Clock_1KHz, Clock_1Hz;
wire Sample_Clk_Signal;
wire output_audio_signal;
reg [31:0] diviser;
reg [31:0] info_name;

//=======================================================================================================================
//
// Insert your code for Lab1 here!
//
//

//////////
//Part A//
//////////

//CASE statement to find the value of the diviser, which will be used in the clock divider module
always@(*) begin
	case(SW[3:1])
	3'b000 : diviser = 32'd47801;//these numbers represent half the 50M clock cycles divided by the frequency
	3'b001 : diviser = 32'd42589;// which represents when the sound is "high" and "low"
	3'b010 : diviser = 32'd37936;
	3'b011 : diviser = 32'd35816;
	3'b100 : diviser = 32'd31928;
	3'b101 : diviser = 32'd28409;
	3'b110 : diviser = 32'd25329;
	3'b111 : diviser = 32'd23900;
	default: diviser = 32'bx;
	endcase
end

//module instatation to link to the clock divider module which figures out when the output is 1 or 0
my_clock_divider Clock_Divider(.inclk(CLK_50M), .outclk(output_audio_signal), .clk_count_to(diviser));


/////////
//PartB//
/////////

//tristate buffer to give the sameple signal the value of the output 
//from above module or 0 depending on the switch 0

assign Sample_Clk_Signal = SW[0]? output_audio_signal: 0;

//assign Sample_Clk_Signal = Clock_1KHz;

//Audio Generation Signal
//Note that the audio needs signed data - so convert 1 bit to 8 bits signed
wire [7:0] audio_data = {(~Sample_Clk_Signal),{7{Sample_Clk_Signal}}}; //generate signed sample audio signal

//////////
//Part C//
//////////

//case statment to decide which the display in the info section should be
// the infoname is given the predefined variables which are defined at the start  of the document

always @(*) begin
	case(SW[3:1])
	3'b000 : info_name = `DO;
	3'b001 : info_name = `RE;
	3'b010 : info_name = `MI;
	3'b011 : info_name = `FA;
	3'b100 : info_name = `SO;
	3'b101 : info_name = `LA;
	3'b110 : info_name = `SI;
	3'b111 : info_name = `DO2;
	default: info_name = 4'bx;
	endcase
end

///////
//Part D
///////


wire [7:0] switchd1,switchd2,switchd3,switchd4, switchd5; //each wire holds the value for 2 switches
assign switchd1={{4{SW[0]}},{4{SW[1]}}};  //each switch is multiplied by 4 to display "F" BECAUSE "1" IS BASIC if it is on and "0" if off
assign switchd2={{4{SW[2]}},{4{SW[3]}}};
assign switchd3={{4{SW[4]}},{4{SW[5]}}};
assign switchd4={{4{SW[6]}},{4{SW[7]}}};
assign switchd5={{4{SW[8]}},{4{SW[9]}}};

reg[15:0] freq;
//the case statement below decides which frequncy is being outputed depending on which switches are on.
always @(*) begin
	case(SW[3:1])
	3'b000 : freq = `DOfreq; // gives freq the value of DO frequency
	3'b001 : freq = `REfreq; // gives freq the value of RE frequency
	3'b010 : freq = `MIfreq; // gives freq the value of MI frequency
	3'b011 : freq = `FAfreq; // gives freq the value of FA frequency
	3'b100 : freq = `SOfreq; // gives freq the value of SO frequency
	3'b101 : freq = `LAfreq; // gives freq the value of LA frequency
	3'b110 : freq = `SIfreq; // gives freq the value of SI frequency
	3'b111 : freq = `DO2freq;// gives freq the value of DO2 frequency
	default: freq = 16'hxx;
	endcase
end




//////////
//Part E//
//////////

wire [31:0]count_1hz;  //wires used for part E
reg led_output;
reg led_flag;
assign count_1hz = 32'h17D7840;  //the value of 25M to give us a 1Hz clock

my_clock_divider led_clock(.inclk(CLK_50M), .outclk(led_output), .clk_count_to(count_1hz)); //send in the new count to value and led output flag

always @(posedge led_output) begin  //whenever we have a positive led output, so every 1 second, we go through

	if(LED == 8'b00000000) begin  //intially led are off so this will assign it to first one on
	LED = 8'b00000001;
	led_flag=0;  //led_flag is used for reverse, so at the start we want forward so flag is 0
	end

	else begin
	if(LED != 8'b10000000&&(!led_flag))   //if the cycle isnt at the last led, and it is not reverse sequence,
	LED=LED<<1;     // shift left 1 bit, which turns on the next led and turns off current

	else if (LED==8'b10000000) begin //if the cycle is at the last led,
	LED=LED>>1;                      // make the led right shift by 1 to turn on the prevous led and also
	led_flag = 1;                    // turn on the reverse flag, so that the prevous if returns false
	end

	else if(LED !=8'b00000001 && (led_flag)) //if you are not at the first led and are running in reverse,
	LED=LED>>1;                              //right shift the led so that the leds have reverse sequence

	else if(LED == 8'b00000001) begin   //if you are back to led 1 on, make the leds go forward and turn reverse flag off
	LED=LED<<1;
	led_flag=0;
	end

	else
	LED=8'bx;
	end
	
	


end


//=====================================================================================
//
// LCD Scope Acquisition Circuitry Wire Definitions                 
//
//=====================================================================================

wire allow_run_LCD_scope;
wire [15:0] scope_channelA, scope_channelB;
(* keep = 1, preserve = 1 *) wire scope_clk;
reg user_scope_enable_trigger;
wire user_scope_enable;
wire user_scope_enable_trigger_path0, user_scope_enable_trigger_path1;
wire scope_enable_source = SW[8];
wire choose_LCD_or_SCOPE =  SW[9];


doublesync user_scope_enable_sync1(.indata(scope_enable_source),
                  .outdata(user_scope_enable),
                  .clk(CLK_50M),
                  .reset(1'b1)); 

//Generate the oscilloscope clock
Generate_Arbitrary_Divided_Clk32 
Generate_LCD_scope_Clk(
.inclk(CLK_50M),
.outclk(scope_clk),
.outclk_Not(),
.div_clk_count(scope_sampling_clock_count),
.Reset(1'h1));

//Scope capture channels

(* keep = 1, preserve = 1 *) logic ScopeChannelASignal;
(* keep = 1, preserve = 1 *) logic ScopeChannelBSignal;

assign ScopeChannelASignal = Sample_Clk_Signal;
assign ScopeChannelBSignal = SW[1];

scope_capture LCD_scope_channelA(
.clk(scope_clk),
.the_signal(ScopeChannelASignal),
.capture_enable(allow_run_LCD_scope & user_scope_enable), 
.captured_data(scope_channelA),
.reset(1'b1));

scope_capture LCD_scope_channelB
(
.clk(scope_clk),
.the_signal(ScopeChannelBSignal),
.capture_enable(allow_run_LCD_scope & user_scope_enable), 
.captured_data(scope_channelB),
.reset(1'b1));

assign LCD_ON   = 1'b1;
//The LCD scope and display
////////////

////////////

//////////


LCD_Scope_Encapsulated_pacoblaze_wrapper LCD_LED_scope(
                        //LCD control signals
                          .lcd_d(LCD_DATA),//don't touch
                    .lcd_rs(LCD_RS), //don't touch
                    .lcd_rw(LCD_RW), //don't touch
                    .lcd_e(LCD_EN), //don't touch
                    .clk(CLK_50M),  //don't touch
                          
                        //LCD Display values
                      .InH(switchd1), //displays switch 0 and 1, F if one and 0 if off
                      .InG(switchd2), //displays switch 2 and 3
                      .InF(switchd3), //displays switch 4 and 5
                      .InE(switchd4), //displays switch 6 and 7
                      .InD(switchd5), //displays switch 8 and 9
                      .InC(8'hFE),    //display FE to show frequency value is next
                      .InB(freq[15:8]),//displays high 8 bits of frequncy value
                     .InA(freq[7:0]), //displays lower 8 bits of frequncy value
                          
                     //LCD display information signals
		    //writes out iPod Coming Soon
                         .InfoH({character_lowercase_i,character_P}),
                          .InfoG({character_lowercase_o,character_lowercase_d}),
                          .InfoF({character_space,character_C}),
                          .InfoE({character_lowercase_o,character_lowercase_m}),
                          .InfoD({character_lowercase_i,character_lowercase_n}),
                          .InfoC({character_lowercase_g,character_space}),
                          .InfoB({character_S,character_lowercase_o}),
                          .InfoA({character_lowercase_o,character_lowercase_n}),
                          
                  //choose to display the values or the oscilloscope
                          .choose_scope_or_LCD(choose_LCD_or_SCOPE),
                          
                  //scope channel declarations
                          .scope_channelA(scope_channelA), //don't touch
                          .scope_channelB(scope_channelB), //don't touch
                          
                  //scope information generation
                          .ScopeInfoA(info_name),  //displays the info name result, which is the sound name
                          .ScopeInfoB({character_S,character_W,character_1,character_space}),
                          
                 //enable_scope is used to freeze the scope just before capturing 
                 //the waveform for display (otherwise the sampling would be unreliable)
                          .enable_scope(allow_run_LCD_scope) //don't touch
                          
    );  
    

//=====================================================================================
//
//  Seven-Segment and speed control
//
//=====================================================================================

wire speed_up_event, speed_down_event;

//Generate 1 KHz Clock
Generate_Arbitrary_Divided_Clk32 
Gen_1KHz_clk
(
.inclk(CLK_50M),
.outclk(Clock_1KHz),
.outclk_Not(),
.div_clk_count(32'h61A6), //change this if necessary to suit your module
.Reset(1'h1)); 

wire speed_up_raw;
wire speed_down_raw;

doublesync 
key0_doublsync
(.indata(!KEY[0]),
.outdata(speed_up_raw),
.clk(Clock_1KHz),
.reset(1'b1));


doublesync 
key1_doublsync
(.indata(!KEY[1]),
.outdata(speed_down_raw),
.clk(Clock_1KHz),
.reset(1'b1));


parameter num_updown_events_per_sec = 10;
parameter num_1KHZ_clocks_between_updown_events = 1000/num_updown_events_per_sec;

reg [15:0] updown_counter = 0;
always @(posedge Clock_1KHz)
begin
      if (updown_counter >= num_1KHZ_clocks_between_updown_events)
      begin
            if (speed_up_raw)
            begin
                  speed_up_event_trigger <= 1;          
            end 
            
            if (speed_down_raw)
            begin
                  speed_down_event_trigger <= 1;            
            end 
            updown_counter <= 0;
      end
      else 
      begin
           updown_counter <= updown_counter + 1;
           speed_up_event_trigger <=0;
           speed_down_event_trigger <= 0;
      end     
end

wire speed_up_event_trigger;
wire speed_down_event_trigger;

async_trap_and_reset_gen_1_pulse 
make_speedup_pulse
(
 .async_sig(speed_up_event_trigger), 
 .outclk(CLK_50M), 
 .out_sync_sig(speed_up_event), 
 .auto_reset(1'b1), 
 .reset(1'b1)
 );
 
async_trap_and_reset_gen_1_pulse 
make_speedown_pulse
(
 .async_sig(speed_down_event_trigger), 
 .outclk(CLK_50M), 
 .out_sync_sig(speed_down_event), 
 .auto_reset(1'b1), 
 .reset(1'b1)
 );


wire speed_reset_event; 

doublesync 
key2_doublsync
(.indata(!KEY[2]),
.outdata(speed_reset_event),
.clk(CLK_50M),
.reset(1'b1));

parameter oscilloscope_speed_step = 100;

wire [15:0] speed_control_val;                      
speed_reg_control 
speed_reg_control_inst
(
.clk(CLK_50M),
.up_event(speed_up_event),
.down_event(speed_down_event),
.reset_event(speed_reset_event),
.speed_control_val(speed_control_val)
);

logic [15:0] scope_sampling_clock_count;
parameter [15:0] default_scope_sampling_clock_count = 12499; //2KHz


always @ (posedge CLK_50M) 
begin
    scope_sampling_clock_count <= default_scope_sampling_clock_count+{{16{speed_control_val[15]}},speed_control_val};
end 

        
        
logic [7:0] Seven_Seg_Val[5:0];
logic [3:0] Seven_Seg_Data[5:0];
    
SevenSegmentDisplayDecoder SevenSegmentDisplayDecoder_inst0(.ssOut(Seven_Seg_Val[0]), .nIn(Seven_Seg_Data[0]));
SevenSegmentDisplayDecoder SevenSegmentDisplayDecoder_inst1(.ssOut(Seven_Seg_Val[1]), .nIn(Seven_Seg_Data[1]));
SevenSegmentDisplayDecoder SevenSegmentDisplayDecoder_inst2(.ssOut(Seven_Seg_Val[2]), .nIn(Seven_Seg_Data[2]));
SevenSegmentDisplayDecoder SevenSegmentDisplayDecoder_inst3(.ssOut(Seven_Seg_Val[3]), .nIn(Seven_Seg_Data[3]));
SevenSegmentDisplayDecoder SevenSegmentDisplayDecoder_inst4(.ssOut(Seven_Seg_Val[4]), .nIn(Seven_Seg_Data[4]));
SevenSegmentDisplayDecoder SevenSegmentDisplayDecoder_inst5(.ssOut(Seven_Seg_Val[5]), .nIn(Seven_Seg_Data[5]));

assign HEX0 = Seven_Seg_Val[0];
assign HEX1 = Seven_Seg_Val[1];
assign HEX2 = Seven_Seg_Val[2];
assign HEX3 = Seven_Seg_Val[3];
assign HEX4 = Seven_Seg_Val[4];
assign HEX5 = Seven_Seg_Val[5];

            
wire Clock_2Hz;
            
Generate_Arbitrary_Divided_Clk32 
Gen_2Hz_clk
(.inclk(CLK_50M),
.outclk(Clock_2Hz),
.outclk_Not(),
.div_clk_count(32'h17D7840 >> 1),
.Reset(1'h1)
); 
        
logic [23:0] actual_7seg_output;
reg [23:0] regd_actual_7seg_output;

always @(posedge Clock_2Hz)
begin
    regd_actual_7seg_output <= actual_7seg_output;
    Clock_1Hz <= ~Clock_1Hz;
end


assign Seven_Seg_Data[0] = regd_actual_7seg_output[3:0];
assign Seven_Seg_Data[1] = regd_actual_7seg_output[7:4];
assign Seven_Seg_Data[2] = regd_actual_7seg_output[11:8];
assign Seven_Seg_Data[3] = regd_actual_7seg_output[15:12];
assign Seven_Seg_Data[4] = regd_actual_7seg_output[19:16];
assign Seven_Seg_Data[5] = regd_actual_7seg_output[23:20];

    
assign actual_7seg_output =  scope_sampling_clock_count;




//=======================================================================================================================
//
//   Audio controller code - do not touch
//
//========================================================================================================================
wire [$size(audio_data)-1:0] actual_audio_data_left, actual_audio_data_right;
wire audio_left_clock, audio_right_clock;

to_slow_clk_interface 
interface_actual_audio_data_right
 (.indata(audio_data),
  .outdata(actual_audio_data_right),
  .inclk(CLK_50M),
  .outclk(audio_right_clock));
   
   
to_slow_clk_interface 
interface_actual_audio_data_left
 (.indata(audio_data),
  .outdata(actual_audio_data_left),
  .inclk(CLK_50M),
  .outclk(audio_left_clock));
   

audio_controller 
audio_control(
  // Clock Input (50 MHz)
  .iCLK_50(CLK_50M), // 50 MHz
  .iCLK_28(), // 27 MHz
  //  7-SEG Displays
  // I2C
  .I2C_SDAT(FPGA_I2C_SDAT), // I2C Data
  .oI2C_SCLK(FPGA_I2C_SCLK), // I2C Clock
  // Audio CODEC
  .AUD_ADCLRCK(AUD_ADCLRCK),                    //  Audio CODEC ADC LR Clock
  .iAUD_ADCDAT(AUD_ADCDAT),                 //  Audio CODEC ADC Data
  .AUD_DACLRCK(AUD_DACLRCK),                    //  Audio CODEC DAC LR Clock
  .oAUD_DACDAT(AUD_DACDAT),                 //  Audio CODEC DAC Data
  .AUD_BCLK(AUD_BCLK),                      //  Audio CODEC Bit-Stream Clock
  .oAUD_XCK(AUD_XCK),                       //  Audio CODEC Chip Clock
  .audio_outL({actual_audio_data_left,8'b1}), 
  .audio_outR({actual_audio_data_right,8'b1}),
  .audio_right_clock(audio_right_clock), 
  .audio_left_clock(audio_left_clock)
);


//=======================================================================================================================
//
//   End Audio controller code
//
//========================================================================================================================
                    
            
endmodule
