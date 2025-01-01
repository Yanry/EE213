** Combined module consists of your SRAM and your MAC module

** Include Combined module netlist
.INCLUDE "Combined.sp"

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

** Please instantiate your TOP module here
*	The following content describes the pins needed in TOP module and the corresponding internal signals they should be connected to
*	Format:
*		<module_pin_name> -> <testbench_signal_name> : <description>
*		"->" means connect to
*
*	Your top module should have the following pins
*	Output:
*       OUT<11:0> -> mac_out<11:0>: The output result of MAC module
*	Inputs:
*       PRC -> prc: SRAM precharge signal
*       ADDR<4:0> -> weight_addr<4:0>: SRAM read/write address
*       REN -> sram_ren: SRAM read enable signal
*       WEN -> sram_wen: SRAM write enable signal
*       DATA<191:0> -> weight<191:0>: SRAM write data
*       MULTIPLICAND<255:0> -> result<255:0>: MAC 64*4bit multiplicand

** Here is an example of the instance. The order of signals may vary with your design.
** Please connect the signals correctly. (Do not modify the instance name when you instantiate your module)
xsram_mac weight_addr<4> weight_addr<3> weight_addr<2> weight_addr<1> weight_addr<0> result<255> result<254> result<253> result<252> result<251> result<250> result<249> result<248> result<247> result<246> result<245> result<244> result<243> result<242> result<241> result<240> result<239> result<238> result<237> result<236> result<235> result<234> result<233> result<232> result<231> result<230> result<229> result<228> result<227> result<226> result<225> result<224> result<223> result<222> result<221> result<220> result<219> result<218> result<217> result<216> result<215> result<214> result<213> result<212> result<211> result<210> result<209> result<208> result<207> result<206> result<205> result<204> result<203> result<202> result<201> result<200> result<199> result<198> result<197> result<196> result<195> result<194> result<193> result<192> result<191> result<190> result<189> result<188> result<187> result<186> result<185> result<184> result<183> result<182> result<181> result<180> result<179> result<178> result<177> result<176> result<175> result<174> result<173> result<172> result<171> result<170> result<169> result<168> result<167> result<166> result<165> result<164> result<163> result<162> result<161> result<160> result<159> result<158> result<157> result<156> result<155> result<154> result<153> result<152> result<151> result<150> result<149> result<148> result<147> result<146> result<145> result<144> result<143> result<142> result<141> result<140> result<139> result<138> result<137> result<136> result<135> result<134>
+result<133> result<132> result<131> result<130> result<129> result<128> result<127> result<126> result<125> result<124> result<123> result<122> result<121> result<120> result<119> result<118> result<117> result<116> result<115> result<114> result<113> result<112> result<111> result<110> result<109> result<108> result<107> result<106> result<105> result<104> result<103> result<102> result<101> result<100> result<99> result<98> result<97> result<96> result<95> result<94> result<93> result<92> result<91> result<90> result<89> result<88> result<87> result<86> result<85> result<84> result<83> result<82> result<81> result<80> result<79> result<78> result<77> result<76> result<75> result<74> result<73> result<72> result<71> result<70> result<69> result<68> result<67> result<66> result<65> result<64> result<63> result<62> result<61> result<60> result<59> result<58> result<57> result<56> result<55> result<54> result<53> result<52> result<51> result<50> result<49> result<48> result<47> result<46> result<45> result<44> result<43> result<42> result<41> result<40> result<39> result<38> result<37> result<36> result<35> result<34> result<33> result<32> result<31> result<30> result<29> result<28> result<27> result<26> result<25> result<24> result<23> result<22> result<21> result<20> result<19> result<18> result<17> result<16> result<15> result<14> result<13> result<12> result<11> result<10> result<9> result<8> result<7> result<6> result<5> result<4> result<3> result<2> result<1> result<0> prc sram_ren mac_out<11> mac_out<10> mac_out<9> mac_out<8> mac_out<7> mac_out<6> mac_out<5>
+mac_out<4> mac_out<3> mac_out<2> mac_out<1> mac_out<0> sram_wen weight<191> weight<190> weight<189> weight<188> weight<187> weight<186> weight<185> weight<184> weight<183> weight<182> weight<181> weight<180> weight<179> weight<178> weight<177> weight<176> weight<175> weight<174> weight<173> weight<172> weight<171> weight<170> weight<169> weight<168> weight<167> weight<166> weight<165> weight<164> weight<163> weight<162> weight<161> weight<160> weight<159> weight<158> weight<157> weight<156> weight<155> weight<154> weight<153> weight<152> weight<151> weight<150> weight<149> weight<148> weight<147> weight<146> weight<145> weight<144> weight<143> weight<142> weight<141> weight<140> weight<139> weight<138> weight<137> weight<136> weight<135> weight<134> weight<133> weight<132> weight<131> weight<130> weight<129> weight<128> weight<127> weight<126> weight<125> weight<124> weight<123> weight<122> weight<121> weight<120> weight<119> weight<118> weight<117> weight<116> weight<115> weight<114> weight<113> weight<112> weight<111> weight<110> weight<109> weight<108> weight<107> weight<106> weight<105> weight<104> weight<103> weight<102> weight<101> weight<100> weight<99> weight<98> weight<97> weight<96> weight<95> weight<94> weight<93>
+weight<92> weight<91> weight<90> weight<89> weight<88> weight<87> weight<86> weight<85> weight<84> weight<83> weight<82> weight<81> weight<80> weight<79> weight<78> weight<77> weight<76> weight<75> weight<74> weight<73> weight<72> weight<71> weight<70> weight<69> weight<68> weight<67> weight<66> weight<65> weight<64> weight<63> weight<62> weight<61> weight<60> weight<59> weight<58> weight<57> weight<56> weight<55> weight<54> weight<53> weight<52> weight<51> weight<50> weight<49> weight<48> weight<47> weight<46> weight<45> weight<44> weight<43> weight<42> weight<41> weight<40> weight<39> weight<38> weight<37> weight<36> weight<35> weight<34> weight<33> weight<32> weight<31> weight<30> weight<29> weight<28> weight<27> weight<26> weight<25> weight<24> weight<23> weight<22> weight<21> weight<20> weight<19> weight<18> weight<17> weight<16> weight<15> weight<14> weight<13> weight<12> weight<11> weight<10> weight<9> weight<8> weight<7> weight<6> weight<5> weight<4> weight<3> weight<2> weight<1> weight<0> SRAM_192bit_MA