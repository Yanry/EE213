** SRAM module

** Include SRAM netlist
.INCLUDE "SRAM.sp"

***********************************
* Set period time here 
***********************************
.PARAM
+ period = 10n
***********************************
*  Set prc low duration here
***********************************
.PARAM 
+ SRAM_PRC_LOW_DURATION = 'period/5'

** Instantiate your SRAM module here
*   The SRAM module is used to store the weight of the neural network.
*	The following content describes the pins needed in SRAM module and the corresponding internal signals they should be connected to
*	Format:
*		<module_pin_name> -> <testbench_signal_name> : <description>
*		"->" means connect to
*
*	Your SRAM module should have the following pins
*	Output:
*       READ_DATA<191:0> -> data_read<191:0>: The data read from SRAM
*	Inputs:
*       PRC -> prc: SRAM precharge signal
*       ADDR<4:0> -> addr<4:0>: SRAM read/write address
*       REN -> sram_ren: SRAM read enable signal
*       WEN -> sram_wen: SRAM write enable signal
*       WRITE_DATA<191:0> -> data<191:0>: SRAM write data

** Here is an example of the instance. The order of signals may vary with your design.
** Please connect the signals correctly. (Do not modify the instance name when you instantiate your module)
xsram 
+addr<4> addr<3> addr<2> addr<1> addr<0>
+prc 
+data_read<191> data_read<190> data_read<189> data_read<188> data_read<187> data_read<186> data_read<185> data_read<184> data_read<183> data_read<182> data_read<181> data_read<180> data_read<179> data_read<178> data_read<177> data_read<176> data_read<175> data_read<174> data_read<173> data_read<172> data_read<171> data_read<170> data_read<169> data_read<168> data_read<167> data_read<166> data_read<165> data_read<164> data_read<163> data_read<162> data_read<161> data_read<160> data_read<159> data_read<158> data_read<157> data_read<156> data_read<155> data_read<154> data_read<153> data_read<152> data_read<151> data_read<150> data_read<149> data_read<148> data_read<147> data_read<146> data_read<145> data_read<144> data_read<143> data_read<142> data_read<141> data_read<140> data_read<139> data_read<138> data_read<137> data_read<136> data_read<135> data_read<134> data_read<133> data_read<132> data_read<131> data_read<130> data_read<129> data_read<128> data_read<127>
+data_read<126> data_read<125> data_read<124> data_read<123> data_read<122> data_read<121> data_read<120> data_read<119> data_read<118> data_read<117> data_read<116> data_read<115> data_read<114> data_read<113> data_read<112> data_read<111> data_read<110> data_read<109> data_read<108> data_read<107> data_read<106> data_read<105> data_read<104> data_read<103> data_read<102> data_read<101> data_read<100> data_read<99> data_read<98> data_read<97> data_read<96> data_read<95> data_read<94> data_read<93> data_read<92> data_read<91> data_read<90> data_read<89> data_read<88> data_read<87> data_read<86> data_read<85> data_read<84> data_read<83> data_read<82> data_read<81> data_read<80> data_read<79> data_read<78> data_read<77> data_read<76> data_read<75> data_read<74> data_read<73> data_read<72> data_read<71> data_read<70> data_read<69> data_read<68> data_read<67> data_read<66> data_read<65> data_read<64> data_read<63> data_read<62> data_read<61> data_read<60> data_read<59> data_read<58> data_read<57> data_read<56>
+data_read<55> data_read<54> data_read<53> data_read<52> data_read<51> data_read<50> data_read<49> data_read<48> data_read<47> data_read<46> data_read<45> data_read<44> data_read<43> data_read<42> data_read<41> data_read<40> data_read<39> data_read<38> data_read<37> data_read<36> data_read<35> data_read<34> data_read<33> data_read<32> data_read<31> data_read<30> data_read<29> data_read<28> data_read<27> data_read<26> data_read<25> data_read<24> data_read<23> data_read<22> data_read<21> data_read<20> data_read<19> data_read<18> data_read<17> data_read<16> data_read<15> data_read<14> data_read<13> data_read<12> data_read<11> data_read<10> data_read<9> data_read<8> data_read<7> data_read<6> data_read<5> data_read<4> data_read<3> data_read<2> data_read<1> data_read<0>
+sram_ren sram_wen 
+data<191> data<190> data<189> data<188> data<187> data<186> data<185> data<184> data<183> data<182> data<181> data<180> data<179> data<178> data<177> data<176> data<175> data<174> data<173> data<172> data<171> data<170> data<169> data<168> data<167> data<166> data<165> data<164> data<163> data<162> data<161> data<160> data<159> data<158> data<157> data<156> data<155> data<154> data<153> data<152> data<151> data<150> data<149> data<148> data<147> data<146> data<145> data<144> data<143> data<142> data<141> data<140> data<139> data<138> data<137> data<136> data<135> data<134> data<133> data<132> data<131> data<130> data<129> data<128> data<127> data<126> data<125> data<124> data<123> data<122> data<121> data<120> data<119> data<118> data<117> data<116> data<115> data<114> data<113> data<112> data<111> data<110> data<109> data<108> data<107> data<106> data<105> data<104> data<103> data<102> data<101> data<100> data<99> data<98> data<97> data<96>
+data<95> data<94> data<93> data<92> data<91> data<90> data<89> data<88> data<87> data<86> data<85> data<84> data<83> data<82> data<81> data<80> data<79> data<78> data<77> data<76> data<75> data<74> data<73> data<72> data<71> data<70> data<69> data<68> data<67> data<66> data<65> data<64> data<63> data<62> data<61> data<60> data<59> data<58> data<57> data<56> data<55> data<54> data<53> data<52> data<51> data<50> data<49> data<48> data<47> data<46> data<45> data<44> data<43> data<42> data<41> data<40> data<39> data<38> data<37> data<36> data<35> data<34> data<33> data<32> data<31> data<30> data<29> data<28> data<27> data<26> data<25> data<24> data<23> data<22> data<21> data<20> data<19> data<18> data<17> data<16> data<15> data<14> data<13> data<12> data<11> data<10> data<9> data<8> data<7> data<6> data<5> data<4> data<3> data<2> data<1> data<0> SRAM_192bit_32
