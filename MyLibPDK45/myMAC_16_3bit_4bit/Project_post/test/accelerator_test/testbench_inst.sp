** 2-Layer MLP ACCELERATOR
** CONFIG TOTAL_WEIGHT_NUM = 31
v20 tot_weight_num<0> 0 DC=vdd_val
v19 tot_weight_num<1> 0 DC=vdd_val
v18 tot_weight_num<2> 0 DC=vdd_val
v17 tot_weight_num<3> 0 DC=vdd_val
v16 tot_weight_num<4> 0 DC=vdd_val

** CONFIG L1_WEIGHT_NUM = 21
v14 l1_weight_num<0> 0 DC=vdd_val
v13 l1_weight_num<1> 0 DC=0
v12 l1_weight_num<2> 0 DC=vdd_val
v11 l1_weight_num<3> 0 DC=0
v10 l1_weight_num<4> 0 DC=vdd_val

** CONFIG L2_SCALE = 1 
v9 l2_scale<0> 0 DC=vdd_val
v8 l2_scale<2> 0 DC=0
v7 l2_scale<1> 0 DC=0

** CONFIG L1_SCALE = 5
v6 l1_scale<0> 0 DC=vdd_val
v5 l1_scale<1> 0 DC=0
v4 l1_scale<2> 0 DC=vdd_val

** POWER SOURCE
v2 vdd! 0 DC=vdd_val

** RESET
v1 reset 0 PULSE 0 vdd_val 0 0 0 period 'period*128'
** CLOCK
v0 clk 0 PULSE 0 vdd_val 'period/8' 0 0 'period/2' period

** PRECHARGE. 
vprc prc 0 PULSE vdd_val 0 'period/8' 0 0 SRAM_PRC_LOW_DURATION period

** START THE MODULE WHEN READY
xstart1 net10 start inverter_param size=1
xstart2 ready net10 inverter_param size=1

** INSTANTIATE WEIGHT ROM
xweight weight_addr<0> weight_addr<1> weight_addr<2> weight_addr<3> weight_addr<4> weight<0> weight<1> weight<2> weight<3> weight<4> weight<5> weight<6> weight<7> weight<8> weight<9> weight<10>
+ weight<11> weight<12> weight<13> weight<14> weight<15> weight<16> weight<17> weight<18> weight<19> weight<20> weight<21> weight<22> weight<23> weight<24> weight<25> weight<26>
+ weight<27> weight<28> weight<29> weight<30> weight<31> weight<32> weight<33> weight<34> weight<35> weight<36> weight<37> weight<38> weight<39> weight<40> weight<41> weight<42>
+ weight<43> weight<44> weight<45> weight<46> weight<47> weight<48> weight<49> weight<50> weight<51> weight<52> weight<53> weight<54> weight<55> weight<56> weight<57> weight<58>
+ weight<59> weight<60> weight<61> weight<62> weight<63> weight<64> weight<65> weight<66> weight<67> weight<68> weight<69> weight<70> weight<71> weight<72> weight<73> weight<74>
+ weight<75> weight<76> weight<77> weight<78> weight<79> weight<80> weight<81> weight<82> weight<83> weight<84> weight<85> weight<86> weight<87> weight<88> weight<89> weight<90>
+ weight<91> weight<92> weight<93> weight<94> weight<95> weight<96> weight<97> weight<98> weight<99> weight<100> weight<101> weight<102> weight<103> weight<104> weight<105> weight<106>
+ weight<107> weight<108> weight<109> weight<110> weight<111> weight<112> weight<113> weight<114> weight<115> weight<116> weight<117> weight<118> weight<119> weight<120> weight<121> weight<122>
+ weight<123> weight<124> weight<125> weight<126> weight<127> weight<128> weight<129> weight<130> weight<131> weight<132> weight<133> weight<134> weight<135> weight<136> weight<137> weight<138>
+ weight<139> weight<140> weight<141> weight<142> weight<143> weight<144> weight<145> weight<146> weight<147> weight<148> weight<149> weight<150> weight<151> weight<152> weight<153> weight<154>
+ weight<155> weight<156> weight<157> weight<158> weight<159> weight<160> weight<161> weight<162> weight<163> weight<164> weight<165> weight<166> weight<167> weight<168> weight<169> weight<170>
+ weight<171> weight<172> weight<173> weight<174> weight<175> weight<176> weight<177> weight<178> weight<179> weight<180> weight<181> weight<182> weight<183> weight<184> weight<185> weight<186>
+ weight<187> weight<188> weight<189> weight<190> weight<191> xrom_weight

** INSTANTIATE INPUT ROM
xinput 0 input<0> input<1> input<2> input<3> input<4> input<5> input<6> input<7> input<8> input<9> input<10> input<11> input<12> input<13> input<14>
+ input<15> input<16> input<17> input<18> input<19> input<20> input<21> input<22> input<23> input<24> input<25> input<26> input<27> input<28> input<29> input<30>
+ input<31> input<32> input<33> input<34> input<35> input<36> input<37> input<38> input<39> input<40> input<41> input<42> input<43> input<44> input<45> input<46>
+ input<47> input<48> input<49> input<50> input<51> input<52> input<53> input<54> input<55> input<56> input<57> input<58> input<59> input<60> input<61> input<62>
+ input<63> input<64> input<65> input<66> input<67> input<68> input<69> input<70> input<71> input<72> input<73> input<74> input<75> input<76> input<77> input<78>
+ input<79> input<80> input<81> input<82> input<83> input<84> input<85> input<86> input<87> input<88> input<89> input<90> input<91> input<92> input<93> input<94>
+ input<95> input<96> input<97> input<98> input<99> input<100> input<101> input<102> input<103> input<104> input<105> input<106> input<107> input<108> input<109> input<110>
+ input<111> input<112> input<113> input<114> input<115> input<116> input<117> input<118> input<119> input<120> input<121> input<122> input<123> input<124> input<125> input<126>
+ input<127> input<128> input<129> input<130> input<131> input<132> input<133> input<134> input<135> input<136> input<137> input<138> input<139> input<140> input<141> input<142>
+ input<143> input<144> input<145> input<146> input<147> input<148> input<149> input<150> input<151> input<152> input<153> input<154> input<155> input<156> input<157> input<158>
+ input<159> input<160> input<161> input<162> input<163> input<164> input<165> input<166> input<167> input<168> input<169> input<170> input<171> input<172> input<173> input<174>
+ input<175> input<176> input<177> input<178> input<179> input<180> input<181> input<182> input<183> input<184> input<185> input<186> input<187> input<188> input<189> input<190>
+ input<191> input<192> input<193> input<194> input<195> input<196> input<197> input<198> input<199> input<200> input<201> input<202> input<203> input<204> input<205> input<206>
+ input<207> input<208> input<209> input<210> input<211> input<212> input<213> input<214> input<215> input<216> input<217> input<218> input<219> input<220> input<221> input<222>
+ input<223> input<224> input<225> input<226> input<227> input<228> input<229> input<230> input<231> input<232> input<233> input<234> input<235> input<236> input<237> input<238>
+ input<239> input<240> input<241> input<242> input<243> input<244> input<245> input<246> input<247> input<248> input<249> input<250> input<251> input<252> input<253> input<254>
+ input<255> xrom_input

** Library name: mycells45
** Cell name: ACCELERATOR_WO_SRAM_MA
** View name: schematic
xbuffer clk qa<3> qa<2> qa<1> qa<0> buffer_flip buffer_init input<255> input<254> input<253> input<252> input<251> input<250> input<249> input<248> input<247> input<246> input<245> input<244> input<243> input<242> input<241> input<240> input<239> input<238> input<237> input<236> input<235> input<234> input<233> input<232> input<231> input<230> input<229> input<228> input<227> input<226> input<225> input<224> input<223> input<222> input<221> input<220> input<219> input<218> input<217> input<216> input<215> input<214> input<213> input<212> input<211> input<210> input<209> input<208> input<207> input<206> input<205> input<204> input<203> input<202> input<201> input<200> input<199> input<198> input<197> input<196> input<195> input<194> input<193> input<192> input<191> input<190> input<189> input<188> input<187> input<186> input<185> input<184> input<183> input<182> input<181> input<180> input<179> input<178> input<177> input<176> input<175> input<174> input<173> input<172> input<171> input<170> input<169> input<168> 
+input<167> input<166> input<165> input<164> input<163> input<162> input<161> input<160> input<159> input<158> input<157> input<156> input<155> input<154> input<153> input<152> input<151> input<150> input<149> input<148> input<147> input<146> input<145> input<144> input<143> input<142> input<141> input<140> input<139> input<138> input<137> input<136> input<135> input<134> input<133> input<132> input<131> input<130> input<129> input<128> input<127> input<126> input<125> input<124> input<123> input<122> input<121> input<120> input<119> input<118> input<117> input<116> input<115> input<114> input<113> input<112> input<111> input<110> input<109> input<108> input<107> input<106> input<105> input<104> input<103> input<102> input<101> input<100> input<99> input<98> input<97> input<96> input<95> input<94> input<93> input<92> input<91> input<90> input<89> input<88> input<87> input<86> input<85> input<84> input<83> input<82> input<81> input<80> input<79> input<78> input<77> input<76> input<75> input<74> input<73>
+input<72> input<71> input<70> input<69> input<68> input<67> input<66> input<65> input<64> input<63> input<62> input<61> input<60> input<59> input<58> input<57> input<56> input<55> input<54> input<53> input<52> input<51> input<50> input<49> input<48> input<47> input<46> input<45> input<44> input<43> input<42> input<41> input<40> input<39> input<38> input<37> input<36> input<35> input<34> input<33> input<32> input<31> input<30> input<29> input<28> input<27> input<26> input<25> input<24> input<23> input<22> input<21> input<20> input<19> input<18> input<17> input<16> input<15> input<14> input<13> input<12> input<11> input<10> input<9> input<8> input<7> input<6> input<5> input<4> input<3> input<2> input<1> input<0> net38<0> net38<1> net38<2> net38<3> net38<4> net38<5> net38<6> net38<7> net38<8> net38<9> net38<10> net38<11> net38<12> net38<13> net38<14> net38<15> net38<16> net38<17> net38<18> net38<19> net38<20> net38<21> net38<22> net38<23> net38<24> net38<25> net38<26> net38<27> net38<28> net38<29> net38<30>
+net38<31> net38<32> net38<33> net38<34> net38<35> net38<36> net38<37> net38<38> net38<39> net38<40> net38<41> net38<42> net38<43> net38<44> net38<45> net38<46> net38<47> net38<48> net38<49> net38<50> net38<51> net38<52> net38<53> net38<54> net38<55> net38<56> net38<57> net38<58> net38<59> net38<60> net38<61> net38<62> net38<63> net38<64> net38<65> net38<66> net38<67> net38<68> net38<69> net38<70> net38<71> net38<72> net38<73> net38<74> net38<75> net38<76> net38<77> net38<78> net38<79> net38<80> net38<81> net38<82> net38<83> net38<84> net38<85> net38<86> net38<87> net38<88> net38<89> net38<90> net38<91> net38<92> net38<93> net38<94> net38<95> net38<96> net38<97> net38<98> net38<99> net38<100> net38<101> net38<102> net38<103> net38<104> net38<105> net38<106> net38<107> net38<108> net38<109> net38<110> net38<111> net38<112> net38<113> net38<114> net38<115> net38<116> net38<117> net38<118> net38<119> net38<120> net38<121> net38<122> net38<123> net38<124> net38<125> net38<126> net38<127> net38<128> net38<129>
+net38<130> net38<131> net38<132> net38<133> net38<134> net38<135> net38<136> net38<137> net38<138> net38<139> net38<140> net38<141> net38<142> net38<143> net38<144> net38<145> net38<146> net38<147> net38<148> net38<149> net38<150> net38<151> net38<152> net38<153> net38<154> net38<155> net38<156> net38<157> net38<158> net38<159> net38<160> net38<161> net38<162> net38<163> net38<164> net38<165> net38<166> net38<167> net38<168> net38<169> net38<170> net38<171> net38<172> net38<173> net38<174> net38<175> net38<176> net38<177> net38<178> net38<179> net38<180> net38<181> net38<182> net38<183> net38<184> net38<185> net38<186> net38<187> net38<188> net38<189> net38<190> net38<191> net38<192> net38<193> net38<194> net38<195> net38<196> net38<197> net38<198> net38<199> net38<200> net38<201> net38<202> net38<203> net38<204> net38<205> net38<206> net38<207> net38<208> net38<209> net38<210> net38<211> net38<212> net38<213> net38<214> net38<215> net38<216> net38<217> net38<218> net38<219> net38<220> net38<221> net38<222> 
+net38<223> net38<224> net38<225> net38<226> net38<227> net38<228> net38<229> net38<230> net38<231> net38<232> net38<233> net38<234> net38<235> net38<236> net38<237> net38<238> net38<239> net38<240> net38<241> net38<242> net38<243> net38<244> net38<245> net38<246> net38<247> net38<248> net38<249> net38<250> net38<251> net38<252> net38<253> net38<254> net38<255> buffer_blk_addr<5> buffer_blk_addr<4> buffer_blk_addr<3> buffer_blk_addr<2> buffer_blk_addr<1> buffer_blk_addr<0> BUFFER_4bit_64
xctrl buffer_blk_addr<5> buffer_blk_addr<4> buffer_blk_addr<3> buffer_blk_addr<2> buffer_blk_addr<1> buffer_blk_addr<0> buffer_flip buffer_init clk l1_weight_num<4> l1_weight_num<3> l1_weight_num<2> l1_weight_num<1> l1_weight_num<0> reset weight_addr<4> weight_addr<3> weight_addr<2> weight_addr<1> weight_addr<0> sram_ren sram_wen start state<5> state<4> state<3> state<2> state<1> state<0> tot_weight_num<4> tot_weight_num<3> tot_weight_num<2> tot_weight_num<1> tot_weight_num<0> layer_sel ACCELERATOR_CTRL
xi7 net025 ready inverter_param size=1
xi8 state<3> net025 inverter_param size=1
xi13 layer_sel net028 inverter_param size=1
xi4<255> net39<0> result<255> inverter_param size=2
xi4<254> net39<1> result<254> inverter_param size=2
xi4<253> net39<2> result<253> inverter_param size=2
xi4<252> net39<3> result<252> inverter_param size=2
xi4<251> net39<4> result<251> inverter_param size=2
xi4<250> net39<5> result<250> inverter_param size=2
xi4<249> net39<6> result<249> inverter_param size=2
xi4<248> net39<7> result<248> inverter_param size=2
xi4<247> net39<8> result<247> inverter_param size=2
xi4<246> net39<9> result<246> inverter_param size=2
xi4<245> net39<10> result<245> inverter_param size=2
xi4<244> net39<11> result<244> inverter_param size=2
xi4<243> net39<12> result<243> inverter_param size=2
xi4<242> net39<13> result<242> inverter_param size=2
xi4<241> net39<14> result<241> inverter_param size=2
xi4<240> net39<15> result<240> inverter_param size=2
xi4<239> net39<16> result<239> inverter_param size=2
xi4<238> net39<17> result<238> inverter_param size=2
xi4<237> net39<18> result<237> inverter_param size=2
xi4<236> net39<19> result<236> inverter_param size=2
xi4<235> net39<20> result<235> inverter_param size=2
xi4<234> net39<21> result<234> inverter_param size=2
xi4<233> net39<22> result<233> inverter_param size=2
xi4<232> net39<23> result<232> inverter_param size=2
xi4<231> net39<24> result<231> inverter_param size=2
xi4<230> net39<25> result<230> inverter_param size=2
xi4<229> net39<26> result<229> inverter_param size=2
xi4<228> net39<27> result<228> inverter_param size=2
xi4<227> net39<28> result<227> inverter_param size=2
xi4<226> net39<29> result<226> inverter_param size=2
xi4<225> net39<30> result<225> inverter_param size=2
xi4<224> net39<31> result<224> inverter_param size=2
xi4<223> net39<32> result<223> inverter_param size=2
xi4<222> net39<33> result<222> inverter_param size=2
xi4<221> net39<34> result<221> inverter_param size=2
xi4<220> net39<35> result<220> inverter_param size=2
xi4<219> net39<36> result<219> inverter_param size=2
xi4<218> net39<37> result<218> inverter_param size=2
xi4<217> net39<38> result<217> inverter_param size=2
xi4<216> net39<39> result<216> inverter_param size=2
xi4<215> net39<40> result<215> inverter_param size=2
xi4<214> net39<41> result<214> inverter_param size=2
xi4<213> net39<42> result<213> inverter_param size=2
xi4<212> net39<43> result<212> inverter_param size=2
xi4<211> net39<44> result<211> inverter_param size=2
xi4<210> net39<45> result<210> inverter_param size=2
xi4<209> net39<46> result<209> inverter_param size=2
xi4<208> net39<47> result<208> inverter_param size=2
xi4<207> net39<48> result<207> inverter_param size=2
xi4<206> net39<49> result<206> inverter_param size=2
xi4<205> net39<50> result<205> inverter_param size=2
xi4<204> net39<51> result<204> inverter_param size=2
xi4<203> net39<52> result<203> inverter_param size=2
xi4<202> net39<53> result<202> inverter_param size=2
xi4<201> net39<54> result<201> inverter_param size=2
xi4<200> net39<55> result<200> inverter_param size=2
xi4<199> net39<56> result<199> inverter_param size=2
xi4<198> net39<57> result<198> inverter_param size=2
xi4<197> net39<58> result<197> inverter_param size=2
xi4<196> net39<59> result<196> inverter_param size=2
xi4<195> net39<60> result<195> inverter_param size=2
xi4<194> net39<61> result<194> inverter_param size=2
xi4<193> net39<62> result<193> inverter_param size=2
xi4<192> net39<63> result<192> inverter_param size=2
xi4<191> net39<64> result<191> inverter_param size=2
xi4<190> net39<65> result<190> inverter_param size=2
xi4<189> net39<66> result<189> inverter_param size=2
xi4<188> net39<67> result<188> inverter_param size=2
xi4<187> net39<68> result<187> inverter_param size=2
xi4<186> net39<69> result<186> inverter_param size=2
xi4<185> net39<70> result<185> inverter_param size=2
xi4<184> net39<71> result<184> inverter_param size=2
xi4<183> net39<72> result<183> inverter_param size=2
xi4<182> net39<73> result<182> inverter_param size=2
xi4<181> net39<74> result<181> inverter_param size=2
xi4<180> net39<75> result<180> inverter_param size=2
xi4<179> net39<76> result<179> inverter_param size=2
xi4<178> net39<77> result<178> inverter_param size=2
xi4<177> net39<78> result<177> inverter_param size=2
xi4<176> net39<79> result<176> inverter_param size=2
xi4<175> net39<80> result<175> inverter_param size=2
xi4<174> net39<81> result<174> inverter_param size=2
xi4<173> net39<82> result<173> inverter_param size=2
xi4<172> net39<83> result<172> inverter_param size=2
xi4<171> net39<84> result<171> inverter_param size=2
xi4<170> net39<85> result<170> inverter_param size=2
xi4<169> net39<86> result<169> inverter_param size=2
xi4<168> net39<87> result<168> inverter_param size=2
xi4<167> net39<88> result<167> inverter_param size=2
xi4<166> net39<89> result<166> inverter_param size=2
xi4<165> net39<90> result<165> inverter_param size=2
xi4<164> net39<91> result<164> inverter_param size=2
xi4<163> net39<92> result<163> inverter_param size=2
xi4<162> net39<93> result<162> inverter_param size=2
xi4<161> net39<94> result<161> inverter_param size=2
xi4<160> net39<95> result<160> inverter_param size=2
xi4<159> net39<96> result<159> inverter_param size=2
xi4<158> net39<97> result<158> inverter_param size=2
xi4<157> net39<98> result<157> inverter_param size=2
xi4<156> net39<99> result<156> inverter_param size=2
xi4<155> net39<100> result<155> inverter_param size=2
xi4<154> net39<101> result<154> inverter_param size=2
xi4<153> net39<102> result<153> inverter_param size=2
xi4<152> net39<103> result<152> inverter_param size=2
xi4<151> net39<104> result<151> inverter_param size=2
xi4<150> net39<105> result<150> inverter_param size=2
xi4<149> net39<106> result<149> inverter_param size=2
xi4<148> net39<107> result<148> inverter_param size=2
xi4<147> net39<108> result<147> inverter_param size=2
xi4<146> net39<109> result<146> inverter_param size=2
xi4<145> net39<110> result<145> inverter_param size=2
xi4<144> net39<111> result<144> inverter_param size=2
xi4<143> net39<112> result<143> inverter_param size=2
xi4<142> net39<113> result<142> inverter_param size=2
xi4<141> net39<114> result<141> inverter_param size=2
xi4<140> net39<115> result<140> inverter_param size=2
xi4<139> net39<116> result<139> inverter_param size=2
xi4<138> net39<117> result<138> inverter_param size=2
xi4<137> net39<118> result<137> inverter_param size=2
xi4<136> net39<119> result<136> inverter_param size=2
xi4<135> net39<120> result<135> inverter_param size=2
xi4<134> net39<121> result<134> inverter_param size=2
xi4<133> net39<122> result<133> inverter_param size=2
xi4<132> net39<123> result<132> inverter_param size=2
xi4<131> net39<124> result<131> inverter_param size=2
xi4<130> net39<125> result<130> inverter_param size=2
xi4<129> net39<126> result<129> inverter_param size=2
xi4<128> net39<127> result<128> inverter_param size=2
xi4<127> net39<128> result<127> inverter_param size=2
xi4<126> net39<129> result<126> inverter_param size=2
xi4<125> net39<130> result<125> inverter_param size=2
xi4<124> net39<131> result<124> inverter_param size=2
xi4<123> net39<132> result<123> inverter_param size=2
xi4<122> net39<133> result<122> inverter_param size=2
xi4<121> net39<134> result<121> inverter_param size=2
xi4<120> net39<135> result<120> inverter_param size=2
xi4<119> net39<136> result<119> inverter_param size=2
xi4<118> net39<137> result<118> inverter_param size=2
xi4<117> net39<138> result<117> inverter_param size=2
xi4<116> net39<139> result<116> inverter_param size=2
xi4<115> net39<140> result<115> inverter_param size=2
xi4<114> net39<141> result<114> inverter_param size=2
xi4<113> net39<142> result<113> inverter_param size=2
xi4<112> net39<143> result<112> inverter_param size=2
xi4<111> net39<144> result<111> inverter_param size=2
xi4<110> net39<145> result<110> inverter_param size=2
xi4<109> net39<146> result<109> inverter_param size=2
xi4<108> net39<147> result<108> inverter_param size=2
xi4<107> net39<148> result<107> inverter_param size=2
xi4<106> net39<149> result<106> inverter_param size=2
xi4<105> net39<150> result<105> inverter_param size=2
xi4<104> net39<151> result<104> inverter_param size=2
xi4<103> net39<152> result<103> inverter_param size=2
xi4<102> net39<153> result<102> inverter_param size=2
xi4<101> net39<154> result<101> inverter_param size=2
xi4<100> net39<155> result<100> inverter_param size=2
xi4<99> net39<156> result<99> inverter_param size=2
xi4<98> net39<157> result<98> inverter_param size=2
xi4<97> net39<158> result<97> inverter_param size=2
xi4<96> net39<159> result<96> inverter_param size=2
xi4<95> net39<160> result<95> inverter_param size=2
xi4<94> net39<161> result<94> inverter_param size=2
xi4<93> net39<162> result<93> inverter_param size=2
xi4<92> net39<163> result<92> inverter_param size=2
xi4<91> net39<164> result<91> inverter_param size=2
xi4<90> net39<165> result<90> inverter_param size=2
xi4<89> net39<166> result<89> inverter_param size=2
xi4<88> net39<167> result<88> inverter_param size=2
xi4<87> net39<168> result<87> inverter_param size=2
xi4<86> net39<169> result<86> inverter_param size=2
xi4<85> net39<170> result<85> inverter_param size=2
xi4<84> net39<171> result<84> inverter_param size=2
xi4<83> net39<172> result<83> inverter_param size=2
xi4<82> net39<173> result<82> inverter_param size=2
xi4<81> net39<174> result<81> inverter_param size=2
xi4<80> net39<175> result<80> inverter_param size=2
xi4<79> net39<176> result<79> inverter_param size=2
xi4<78> net39<177> result<78> inverter_param size=2
xi4<77> net39<178> result<77> inverter_param size=2
xi4<76> net39<179> result<76> inverter_param size=2
xi4<75> net39<180> result<75> inverter_param size=2
xi4<74> net39<181> result<74> inverter_param size=2
xi4<73> net39<182> result<73> inverter_param size=2
xi4<72> net39<183> result<72> inverter_param size=2
xi4<71> net39<184> result<71> inverter_param size=2
xi4<70> net39<185> result<70> inverter_param size=2
xi4<69> net39<186> result<69> inverter_param size=2
xi4<68> net39<187> result<68> inverter_param size=2
xi4<67> net39<188> result<67> inverter_param size=2
xi4<66> net39<189> result<66> inverter_param size=2
xi4<65> net39<190> result<65> inverter_param size=2
xi4<64> net39<191> result<64> inverter_param size=2
xi4<63> net39<192> result<63> inverter_param size=2
xi4<62> net39<193> result<62> inverter_param size=2
xi4<61> net39<194> result<61> inverter_param size=2
xi4<60> net39<195> result<60> inverter_param size=2
xi4<59> net39<196> result<59> inverter_param size=2
xi4<58> net39<197> result<58> inverter_param size=2
xi4<57> net39<198> result<57> inverter_param size=2
xi4<56> net39<199> result<56> inverter_param size=2
xi4<55> net39<200> result<55> inverter_param size=2
xi4<54> net39<201> result<54> inverter_param size=2
xi4<53> net39<202> result<53> inverter_param size=2
xi4<52> net39<203> result<52> inverter_param size=2
xi4<51> net39<204> result<51> inverter_param size=2
xi4<50> net39<205> result<50> inverter_param size=2
xi4<49> net39<206> result<49> inverter_param size=2
xi4<48> net39<207> result<48> inverter_param size=2
xi4<47> net39<208> result<47> inverter_param size=2
xi4<46> net39<209> result<46> inverter_param size=2
xi4<45> net39<210> result<45> inverter_param size=2
xi4<44> net39<211> result<44> inverter_param size=2
xi4<43> net39<212> result<43> inverter_param size=2
xi4<42> net39<213> result<42> inverter_param size=2
xi4<41> net39<214> result<41> inverter_param size=2
xi4<40> net39<215> result<40> inverter_param size=2
xi4<39> net39<216> result<39> inverter_param size=2
xi4<38> net39<217> result<38> inverter_param size=2
xi4<37> net39<218> result<37> inverter_param size=2
xi4<36> net39<219> result<36> inverter_param size=2
xi4<35> net39<220> result<35> inverter_param size=2
xi4<34> net39<221> result<34> inverter_param size=2
xi4<33> net39<222> result<33> inverter_param size=2
xi4<32> net39<223> result<32> inverter_param size=2
xi4<31> net39<224> result<31> inverter_param size=2
xi4<30> net39<225> result<30> inverter_param size=2
xi4<29> net39<226> result<29> inverter_param size=2
xi4<28> net39<227> result<28> inverter_param size=2
xi4<27> net39<228> result<27> inverter_param size=2
xi4<26> net39<229> result<26> inverter_param size=2
xi4<25> net39<230> result<25> inverter_param size=2
xi4<24> net39<231> result<24> inverter_param size=2
xi4<23> net39<232> result<23> inverter_param size=2
xi4<22> net39<233> result<22> inverter_param size=2
xi4<21> net39<234> result<21> inverter_param size=2
xi4<20> net39<235> result<20> inverter_param size=2
xi4<19> net39<236> result<19> inverter_param size=2
xi4<18> net39<237> result<18> inverter_param size=2
xi4<17> net39<238> result<17> inverter_param size=2
xi4<16> net39<239> result<16> inverter_param size=2
xi4<15> net39<240> result<15> inverter_param size=2
xi4<14> net39<241> result<14> inverter_param size=2
xi4<13> net39<242> result<13> inverter_param size=2
xi4<12> net39<243> result<12> inverter_param size=2
xi4<11> net39<244> result<11> inverter_param size=2
xi4<10> net39<245> result<10> inverter_param size=2
xi4<9> net39<246> result<9> inverter_param size=2
xi4<8> net39<247> result<8> inverter_param size=2
xi4<7> net39<248> result<7> inverter_param size=2
xi4<6> net39<249> result<6> inverter_param size=2
xi4<5> net39<250> result<5> inverter_param size=2
xi4<4> net39<251> result<4> inverter_param size=2
xi4<3> net39<252> result<3> inverter_param size=2
xi4<2> net39<253> result<2> inverter_param size=2
xi4<1> net39<254> result<1> inverter_param size=2
xi4<0> net39<255> result<0> inverter_param size=2
xi5<255> net38<0> net39<0> inverter_param size=1
xi5<254> net38<1> net39<1> inverter_param size=1
xi5<253> net38<2> net39<2> inverter_param size=1
xi5<252> net38<3> net39<3> inverter_param size=1
xi5<251> net38<4> net39<4> inverter_param size=1
xi5<250> net38<5> net39<5> inverter_param size=1
xi5<249> net38<6> net39<6> inverter_param size=1
xi5<248> net38<7> net39<7> inverter_param size=1
xi5<247> net38<8> net39<8> inverter_param size=1
xi5<246> net38<9> net39<9> inverter_param size=1
xi5<245> net38<10> net39<10> inverter_param size=1
xi5<244> net38<11> net39<11> inverter_param size=1
xi5<243> net38<12> net39<12> inverter_param size=1
xi5<242> net38<13> net39<13> inverter_param size=1
xi5<241> net38<14> net39<14> inverter_param size=1
xi5<240> net38<15> net39<15> inverter_param size=1
xi5<239> net38<16> net39<16> inverter_param size=1
xi5<238> net38<17> net39<17> inverter_param size=1
xi5<237> net38<18> net39<18> inverter_param size=1
xi5<236> net38<19> net39<19> inverter_param size=1
xi5<235> net38<20> net39<20> inverter_param size=1
xi5<234> net38<21> net39<21> inverter_param size=1
xi5<233> net38<22> net39<22> inverter_param size=1
xi5<232> net38<23> net39<23> inverter_param size=1
xi5<231> net38<24> net39<24> inverter_param size=1
xi5<230> net38<25> net39<25> inverter_param size=1
xi5<229> net38<26> net39<26> inverter_param size=1
xi5<228> net38<27> net39<27> inverter_param size=1
xi5<227> net38<28> net39<28> inverter_param size=1
xi5<226> net38<29> net39<29> inverter_param size=1
xi5<225> net38<30> net39<30> inverter_param size=1
xi5<224> net38<31> net39<31> inverter_param size=1
xi5<223> net38<32> net39<32> inverter_param size=1
xi5<222> net38<33> net39<33> inverter_param size=1
xi5<221> net38<34> net39<34> inverter_param size=1
xi5<220> net38<35> net39<35> inverter_param size=1
xi5<219> net38<36> net39<36> inverter_param size=1
xi5<218> net38<37> net39<37> inverter_param size=1
xi5<217> net38<38> net39<38> inverter_param size=1
xi5<216> net38<39> net39<39> inverter_param size=1
xi5<215> net38<40> net39<40> inverter_param size=1
xi5<214> net38<41> net39<41> inverter_param size=1
xi5<213> net38<42> net39<42> inverter_param size=1
xi5<212> net38<43> net39<43> inverter_param size=1
xi5<211> net38<44> net39<44> inverter_param size=1
xi5<210> net38<45> net39<45> inverter_param size=1
xi5<209> net38<46> net39<46> inverter_param size=1
xi5<208> net38<47> net39<47> inverter_param size=1
xi5<207> net38<48> net39<48> inverter_param size=1
xi5<206> net38<49> net39<49> inverter_param size=1
xi5<205> net38<50> net39<50> inverter_param size=1
xi5<204> net38<51> net39<51> inverter_param size=1
xi5<203> net38<52> net39<52> inverter_param size=1
xi5<202> net38<53> net39<53> inverter_param size=1
xi5<201> net38<54> net39<54> inverter_param size=1
xi5<200> net38<55> net39<55> inverter_param size=1
xi5<199> net38<56> net39<56> inverter_param size=1
xi5<198> net38<57> net39<57> inverter_param size=1
xi5<197> net38<58> net39<58> inverter_param size=1
xi5<196> net38<59> net39<59> inverter_param size=1
xi5<195> net38<60> net39<60> inverter_param size=1
xi5<194> net38<61> net39<61> inverter_param size=1
xi5<193> net38<62> net39<62> inverter_param size=1
xi5<192> net38<63> net39<63> inverter_param size=1
xi5<191> net38<64> net39<64> inverter_param size=1
xi5<190> net38<65> net39<65> inverter_param size=1
xi5<189> net38<66> net39<66> inverter_param size=1
xi5<188> net38<67> net39<67> inverter_param size=1
xi5<187> net38<68> net39<68> inverter_param size=1
xi5<186> net38<69> net39<69> inverter_param size=1
xi5<185> net38<70> net39<70> inverter_param size=1
xi5<184> net38<71> net39<71> inverter_param size=1
xi5<183> net38<72> net39<72> inverter_param size=1
xi5<182> net38<73> net39<73> inverter_param size=1
xi5<181> net38<74> net39<74> inverter_param size=1
xi5<180> net38<75> net39<75> inverter_param size=1
xi5<179> net38<76> net39<76> inverter_param size=1
xi5<178> net38<77> net39<77> inverter_param size=1
xi5<177> net38<78> net39<78> inverter_param size=1
xi5<176> net38<79> net39<79> inverter_param size=1
xi5<175> net38<80> net39<80> inverter_param size=1
xi5<174> net38<81> net39<81> inverter_param size=1
xi5<173> net38<82> net39<82> inverter_param size=1
xi5<172> net38<83> net39<83> inverter_param size=1
xi5<171> net38<84> net39<84> inverter_param size=1
xi5<170> net38<85> net39<85> inverter_param size=1
xi5<169> net38<86> net39<86> inverter_param size=1
xi5<168> net38<87> net39<87> inverter_param size=1
xi5<167> net38<88> net39<88> inverter_param size=1
xi5<166> net38<89> net39<89> inverter_param size=1
xi5<165> net38<90> net39<90> inverter_param size=1
xi5<164> net38<91> net39<91> inverter_param size=1
xi5<163> net38<92> net39<92> inverter_param size=1
xi5<162> net38<93> net39<93> inverter_param size=1
xi5<161> net38<94> net39<94> inverter_param size=1
xi5<160> net38<95> net39<95> inverter_param size=1
xi5<159> net38<96> net39<96> inverter_param size=1
xi5<158> net38<97> net39<97> inverter_param size=1
xi5<157> net38<98> net39<98> inverter_param size=1
xi5<156> net38<99> net39<99> inverter_param size=1
xi5<155> net38<100> net39<100> inverter_param size=1
xi5<154> net38<101> net39<101> inverter_param size=1
xi5<153> net38<102> net39<102> inverter_param size=1
xi5<152> net38<103> net39<103> inverter_param size=1
xi5<151> net38<104> net39<104> inverter_param size=1
xi5<150> net38<105> net39<105> inverter_param size=1
xi5<149> net38<106> net39<106> inverter_param size=1
xi5<148> net38<107> net39<107> inverter_param size=1
xi5<147> net38<108> net39<108> inverter_param size=1
xi5<146> net38<109> net39<109> inverter_param size=1
xi5<145> net38<110> net39<110> inverter_param size=1
xi5<144> net38<111> net39<111> inverter_param size=1
xi5<143> net38<112> net39<112> inverter_param size=1
xi5<142> net38<113> net39<113> inverter_param size=1
xi5<141> net38<114> net39<114> inverter_param size=1
xi5<140> net38<115> net39<115> inverter_param size=1
xi5<139> net38<116> net39<116> inverter_param size=1
xi5<138> net38<117> net39<117> inverter_param size=1
xi5<137> net38<118> net39<118> inverter_param size=1
xi5<136> net38<119> net39<119> inverter_param size=1
xi5<135> net38<120> net39<120> inverter_param size=1
xi5<134> net38<121> net39<121> inverter_param size=1
xi5<133> net38<122> net39<122> inverter_param size=1
xi5<132> net38<123> net39<123> inverter_param size=1
xi5<131> net38<124> net39<124> inverter_param size=1
xi5<130> net38<125> net39<125> inverter_param size=1
xi5<129> net38<126> net39<126> inverter_param size=1
xi5<128> net38<127> net39<127> inverter_param size=1
xi5<127> net38<128> net39<128> inverter_param size=1
xi5<126> net38<129> net39<129> inverter_param size=1
xi5<125> net38<130> net39<130> inverter_param size=1
xi5<124> net38<131> net39<131> inverter_param size=1
xi5<123> net38<132> net39<132> inverter_param size=1
xi5<122> net38<133> net39<133> inverter_param size=1
xi5<121> net38<134> net39<134> inverter_param size=1
xi5<120> net38<135> net39<135> inverter_param size=1
xi5<119> net38<136> net39<136> inverter_param size=1
xi5<118> net38<137> net39<137> inverter_param size=1
xi5<117> net38<138> net39<138> inverter_param size=1
xi5<116> net38<139> net39<139> inverter_param size=1
xi5<115> net38<140> net39<140> inverter_param size=1
xi5<114> net38<141> net39<141> inverter_param size=1
xi5<113> net38<142> net39<142> inverter_param size=1
xi5<112> net38<143> net39<143> inverter_param size=1
xi5<111> net38<144> net39<144> inverter_param size=1
xi5<110> net38<145> net39<145> inverter_param size=1
xi5<109> net38<146> net39<146> inverter_param size=1
xi5<108> net38<147> net39<147> inverter_param size=1
xi5<107> net38<148> net39<148> inverter_param size=1
xi5<106> net38<149> net39<149> inverter_param size=1
xi5<105> net38<150> net39<150> inverter_param size=1
xi5<104> net38<151> net39<151> inverter_param size=1
xi5<103> net38<152> net39<152> inverter_param size=1
xi5<102> net38<153> net39<153> inverter_param size=1
xi5<101> net38<154> net39<154> inverter_param size=1
xi5<100> net38<155> net39<155> inverter_param size=1
xi5<99> net38<156> net39<156> inverter_param size=1
xi5<98> net38<157> net39<157> inverter_param size=1
xi5<97> net38<158> net39<158> inverter_param size=1
xi5<96> net38<159> net39<159> inverter_param size=1
xi5<95> net38<160> net39<160> inverter_param size=1
xi5<94> net38<161> net39<161> inverter_param size=1
xi5<93> net38<162> net39<162> inverter_param size=1
xi5<92> net38<163> net39<163> inverter_param size=1
xi5<91> net38<164> net39<164> inverter_param size=1
xi5<90> net38<165> net39<165> inverter_param size=1
xi5<89> net38<166> net39<166> inverter_param size=1
xi5<88> net38<167> net39<167> inverter_param size=1
xi5<87> net38<168> net39<168> inverter_param size=1
xi5<86> net38<169> net39<169> inverter_param size=1
xi5<85> net38<170> net39<170> inverter_param size=1
xi5<84> net38<171> net39<171> inverter_param size=1
xi5<83> net38<172> net39<172> inverter_param size=1
xi5<82> net38<173> net39<173> inverter_param size=1
xi5<81> net38<174> net39<174> inverter_param size=1
xi5<80> net38<175> net39<175> inverter_param size=1
xi5<79> net38<176> net39<176> inverter_param size=1
xi5<78> net38<177> net39<177> inverter_param size=1
xi5<77> net38<178> net39<178> inverter_param size=1
xi5<76> net38<179> net39<179> inverter_param size=1
xi5<75> net38<180> net39<180> inverter_param size=1
xi5<74> net38<181> net39<181> inverter_param size=1
xi5<73> net38<182> net39<182> inverter_param size=1
xi5<72> net38<183> net39<183> inverter_param size=1
xi5<71> net38<184> net39<184> inverter_param size=1
xi5<70> net38<185> net39<185> inverter_param size=1
xi5<69> net38<186> net39<186> inverter_param size=1
xi5<68> net38<187> net39<187> inverter_param size=1
xi5<67> net38<188> net39<188> inverter_param size=1
xi5<66> net38<189> net39<189> inverter_param size=1
xi5<65> net38<190> net39<190> inverter_param size=1
xi5<64> net38<191> net39<191> inverter_param size=1
xi5<63> net38<192> net39<192> inverter_param size=1
xi5<62> net38<193> net39<193> inverter_param size=1
xi5<61> net38<194> net39<194> inverter_param size=1
xi5<60> net38<195> net39<195> inverter_param size=1
xi5<59> net38<196> net39<196> inverter_param size=1
xi5<58> net38<197> net39<197> inverter_param size=1
xi5<57> net38<198> net39<198> inverter_param size=1
xi5<56> net38<199> net39<199> inverter_param size=1
xi5<55> net38<200> net39<200> inverter_param size=1
xi5<54> net38<201> net39<201> inverter_param size=1
xi5<53> net38<202> net39<202> inverter_param size=1
xi5<52> net38<203> net39<203> inverter_param size=1
xi5<51> net38<204> net39<204> inverter_param size=1
xi5<50> net38<205> net39<205> inverter_param size=1
xi5<49> net38<206> net39<206> inverter_param size=1
xi5<48> net38<207> net39<207> inverter_param size=1
xi5<47> net38<208> net39<208> inverter_param size=1
xi5<46> net38<209> net39<209> inverter_param size=1
xi5<45> net38<210> net39<210> inverter_param size=1
xi5<44> net38<211> net39<211> inverter_param size=1
xi5<43> net38<212> net39<212> inverter_param size=1
xi5<42> net38<213> net39<213> inverter_param size=1
xi5<41> net38<214> net39<214> inverter_param size=1
xi5<40> net38<215> net39<215> inverter_param size=1
xi5<39> net38<216> net39<216> inverter_param size=1
xi5<38> net38<217> net39<217> inverter_param size=1
xi5<37> net38<218> net39<218> inverter_param size=1
xi5<36> net38<219> net39<219> inverter_param size=1
xi5<35> net38<220> net39<220> inverter_param size=1
xi5<34> net38<221> net39<221> inverter_param size=1
xi5<33> net38<222> net39<222> inverter_param size=1
xi5<32> net38<223> net39<223> inverter_param size=1
xi5<31> net38<224> net39<224> inverter_param size=1
xi5<30> net38<225> net39<225> inverter_param size=1
xi5<29> net38<226> net39<226> inverter_param size=1
xi5<28> net38<227> net39<227> inverter_param size=1
xi5<27> net38<228> net39<228> inverter_param size=1
xi5<26> net38<229> net39<229> inverter_param size=1
xi5<25> net38<230> net39<230> inverter_param size=1
xi5<24> net38<231> net39<231> inverter_param size=1
xi5<23> net38<232> net39<232> inverter_param size=1
xi5<22> net38<233> net39<233> inverter_param size=1
xi5<21> net38<234> net39<234> inverter_param size=1
xi5<20> net38<235> net39<235> inverter_param size=1
xi5<19> net38<236> net39<236> inverter_param size=1
xi5<18> net38<237> net39<237> inverter_param size=1
xi5<17> net38<238> net39<238> inverter_param size=1
xi5<16> net38<239> net39<239> inverter_param size=1
xi5<15> net38<240> net39<240> inverter_param size=1
xi5<14> net38<241> net39<241> inverter_param size=1
xi5<13> net38<242> net39<242> inverter_param size=1
xi5<12> net38<243> net39<243> inverter_param size=1
xi5<11> net38<244> net39<244> inverter_param size=1
xi5<10> net38<245> net39<245> inverter_param size=1
xi5<9> net38<246> net39<246> inverter_param size=1
xi5<8> net38<247> net39<247> inverter_param size=1
xi5<7> net38<248> net39<248> inverter_param size=1
xi5<6> net38<249> net39<249> inverter_param size=1
xi5<5> net38<250> net39<250> inverter_param size=1
xi5<4> net38<251> net39<251> inverter_param size=1
xi5<3> net38<252> net39<252> inverter_param size=1
xi5<2> net38<253> net39<253> inverter_param size=1
xi5<1> net38<254> net39<254> inverter_param size=1
xi5<0> net38<255> net39<255> inverter_param size=1
xi1 mac_out<0> mac_out<10> mac_out<11> mac_out<1> mac_out<2> mac_out<3> mac_out<4> mac_out<5> mac_out<6> mac_out<7> mac_out<8> mac_out<9> qa<0> qa<1> qa<2> qa<3> sh<0> sh<1> sh<2> net028 quantization
xi0<2> l1_scale<2> l2_scale<2> sh<2> layer_sel TG_mux2_1
xi0<1> l1_scale<1> l2_scale<1> sh<1> layer_sel TG_mux2_1
xi0<0> l1_scale<0> l2_scale<0> sh<0> layer_sel TG_mux2_1

** OUTPUT CAP
c0<255> result<255> 0 40e-15
c0<254> result<254> 0 40e-15
c0<253> result<253> 0 40e-15
c0<252> result<252> 0 40e-15
c0<251> result<251> 0 40e-15
c0<250> result<250> 0 40e-15
c0<249> result<249> 0 40e-15
c0<248> result<248> 0 40e-15
c0<247> result<247> 0 40e-15
c0<246> result<246> 0 40e-15
c0<245> result<245> 0 40e-15
c0<244> result<244> 0 40e-15
c0<243> result<243> 0 40e-15
c0<242> result<242> 0 40e-15
c0<241> result<241> 0 40e-15
c0<240> result<240> 0 40e-15
c0<239> result<239> 0 40e-15
c0<238> result<238> 0 40e-15
c0<237> result<237> 0 40e-15
c0<236> result<236> 0 40e-15
c0<235> result<235> 0 40e-15
c0<234> result<234> 0 40e-15
c0<233> result<233> 0 40e-15
c0<232> result<232> 0 40e-15
c0<231> result<231> 0 40e-15
c0<230> result<230> 0 40e-15
c0<229> result<229> 0 40e-15
c0<228> result<228> 0 40e-15
c0<227> result<227> 0 40e-15
c0<226> result<226> 0 40e-15
c0<225> result<225> 0 40e-15
c0<224> result<224> 0 40e-15
c0<223> result<223> 0 40e-15
c0<222> result<222> 0 40e-15
c0<221> result<221> 0 40e-15
c0<220> result<220> 0 40e-15
c0<219> result<219> 0 40e-15
c0<218> result<218> 0 40e-15
c0<217> result<217> 0 40e-15
c0<216> result<216> 0 40e-15
c0<215> result<215> 0 40e-15
c0<214> result<214> 0 40e-15
c0<213> result<213> 0 40e-15
c0<212> result<212> 0 40e-15
c0<211> result<211> 0 40e-15
c0<210> result<210> 0 40e-15
c0<209> result<209> 0 40e-15
c0<208> result<208> 0 40e-15
c0<207> result<207> 0 40e-15
c0<206> result<206> 0 40e-15
c0<205> result<205> 0 40e-15
c0<204> result<204> 0 40e-15
c0<203> result<203> 0 40e-15
c0<202> result<202> 0 40e-15
c0<201> result<201> 0 40e-15
c0<200> result<200> 0 40e-15
c0<199> result<199> 0 40e-15
c0<198> result<198> 0 40e-15
c0<197> result<197> 0 40e-15
c0<196> result<196> 0 40e-15
c0<195> result<195> 0 40e-15
c0<194> result<194> 0 40e-15
c0<193> result<193> 0 40e-15
c0<192> result<192> 0 40e-15
c0<191> result<191> 0 40e-15
c0<190> result<190> 0 40e-15
c0<189> result<189> 0 40e-15
c0<188> result<188> 0 40e-15
c0<187> result<187> 0 40e-15
c0<186> result<186> 0 40e-15
c0<185> result<185> 0 40e-15
c0<184> result<184> 0 40e-15
c0<183> result<183> 0 40e-15
c0<182> result<182> 0 40e-15
c0<181> result<181> 0 40e-15
c0<180> result<180> 0 40e-15
c0<179> result<179> 0 40e-15
c0<178> result<178> 0 40e-15
c0<177> result<177> 0 40e-15
c0<176> result<176> 0 40e-15
c0<175> result<175> 0 40e-15
c0<174> result<174> 0 40e-15
c0<173> result<173> 0 40e-15
c0<172> result<172> 0 40e-15
c0<171> result<171> 0 40e-15
c0<170> result<170> 0 40e-15
c0<169> result<169> 0 40e-15
c0<168> result<168> 0 40e-15
c0<167> result<167> 0 40e-15
c0<166> result<166> 0 40e-15
c0<165> result<165> 0 40e-15
c0<164> result<164> 0 40e-15
c0<163> result<163> 0 40e-15
c0<162> result<162> 0 40e-15
c0<161> result<161> 0 40e-15
c0<160> result<160> 0 40e-15
c0<159> result<159> 0 40e-15
c0<158> result<158> 0 40e-15
c0<157> result<157> 0 40e-15
c0<156> result<156> 0 40e-15
c0<155> result<155> 0 40e-15
c0<154> result<154> 0 40e-15
c0<153> result<153> 0 40e-15
c0<152> result<152> 0 40e-15
c0<151> result<151> 0 40e-15
c0<150> result<150> 0 40e-15
c0<149> result<149> 0 40e-15
c0<148> result<148> 0 40e-15
c0<147> result<147> 0 40e-15
c0<146> result<146> 0 40e-15
c0<145> result<145> 0 40e-15
c0<144> result<144> 0 40e-15
c0<143> result<143> 0 40e-15
c0<142> result<142> 0 40e-15
c0<141> result<141> 0 40e-15
c0<140> result<140> 0 40e-15
c0<139> result<139> 0 40e-15
c0<138> result<138> 0 40e-15
c0<137> result<137> 0 40e-15
c0<136> result<136> 0 40e-15
c0<135> result<135> 0 40e-15
c0<134> result<134> 0 40e-15
c0<133> result<133> 0 40e-15
c0<132> result<132> 0 40e-15
c0<131> result<131> 0 40e-15
c0<130> result<130> 0 40e-15
c0<129> result<129> 0 40e-15
c0<128> result<128> 0 40e-15
c0<127> result<127> 0 40e-15
c0<126> result<126> 0 40e-15
c0<125> result<125> 0 40e-15
c0<124> result<124> 0 40e-15
c0<123> result<123> 0 40e-15
c0<122> result<122> 0 40e-15
c0<121> result<121> 0 40e-15
c0<120> result<120> 0 40e-15
c0<119> result<119> 0 40e-15
c0<118> result<118> 0 40e-15
c0<117> result<117> 0 40e-15
c0<116> result<116> 0 40e-15
c0<115> result<115> 0 40e-15
c0<114> result<114> 0 40e-15
c0<113> result<113> 0 40e-15
c0<112> result<112> 0 40e-15
c0<111> result<111> 0 40e-15
c0<110> result<110> 0 40e-15
c0<109> result<109> 0 40e-15
c0<108> result<108> 0 40e-15
c0<107> result<107> 0 40e-15
c0<106> result<106> 0 40e-15
c0<105> result<105> 0 40e-15
c0<104> result<104> 0 40e-15
c0<103> result<103> 0 40e-15
c0<102> result<102> 0 40e-15
c0<101> result<101> 0 40e-15
c0<100> result<100> 0 40e-15
c0<99> result<99> 0 40e-15
c0<98> result<98> 0 40e-15
c0<97> result<97> 0 40e-15
c0<96> result<96> 0 40e-15
c0<95> result<95> 0 40e-15
c0<94> result<94> 0 40e-15
c0<93> result<93> 0 40e-15
c0<92> result<92> 0 40e-15
c0<91> result<91> 0 40e-15
c0<90> result<90> 0 40e-15
c0<89> result<89> 0 40e-15
c0<88> result<88> 0 40e-15
c0<87> result<87> 0 40e-15
c0<86> result<86> 0 40e-15
c0<85> result<85> 0 40e-15
c0<84> result<84> 0 40e-15
c0<83> result<83> 0 40e-15
c0<82> result<82> 0 40e-15
c0<81> result<81> 0 40e-15
c0<80> result<80> 0 40e-15
c0<79> result<79> 0 40e-15
c0<78> result<78> 0 40e-15
c0<77> result<77> 0 40e-15
c0<76> result<76> 0 40e-15
c0<75> result<75> 0 40e-15
c0<74> result<74> 0 40e-15
c0<73> result<73> 0 40e-15
c0<72> result<72> 0 40e-15
c0<71> result<71> 0 40e-15
c0<70> result<70> 0 40e-15
c0<69> result<69> 0 40e-15
c0<68> result<68> 0 40e-15
c0<67> result<67> 0 40e-15
c0<66> result<66> 0 40e-15
c0<65> result<65> 0 40e-15
c0<64> result<64> 0 40e-15
c0<63> result<63> 0 40e-15
c0<62> result<62> 0 40e-15
c0<61> result<61> 0 40e-15
c0<60> result<60> 0 40e-15
c0<59> result<59> 0 40e-15
c0<58> result<58> 0 40e-15
c0<57> result<57> 0 40e-15
c0<56> result<56> 0 40e-15
c0<55> result<55> 0 40e-15
c0<54> result<54> 0 40e-15
c0<53> result<53> 0 40e-15
c0<52> result<52> 0 40e-15
c0<51> result<51> 0 40e-15
c0<50> result<50> 0 40e-15
c0<49> result<49> 0 40e-15
c0<48> result<48> 0 40e-15
c0<47> result<47> 0 40e-15
c0<46> result<46> 0 40e-15
c0<45> result<45> 0 40e-15
c0<44> result<44> 0 40e-15
c0<43> result<43> 0 40e-15
c0<42> result<42> 0 40e-15
c0<41> result<41> 0 40e-15
c0<40> result<40> 0 40e-15
c0<39> result<39> 0 40e-15
c0<38> result<38> 0 40e-15
c0<37> result<37> 0 40e-15
c0<36> result<36> 0 40e-15
c0<35> result<35> 0 40e-15
c0<34> result<34> 0 40e-15
c0<33> result<33> 0 40e-15
c0<32> result<32> 0 40e-15
c0<31> result<31> 0 40e-15
c0<30> result<30> 0 40e-15
c0<29> result<29> 0 40e-15
c0<28> result<28> 0 40e-15
c0<27> result<27> 0 40e-15
c0<26> result<26> 0 40e-15
c0<25> result<25> 0 40e-15
c0<24> result<24> 0 40e-15
c0<23> result<23> 0 40e-15
c0<22> result<22> 0 40e-15
c0<21> result<21> 0 40e-15
c0<20> result<20> 0 40e-15
c0<19> result<19> 0 40e-15
c0<18> result<18> 0 40e-15
c0<17> result<17> 0 40e-15
c0<16> result<16> 0 40e-15
c0<15> result<15> 0 40e-15
c0<14> result<14> 0 40e-15
c0<13> result<13> 0 40e-15
c0<12> result<12> 0 40e-15
c0<11> result<11> 0 40e-15
c0<10> result<10> 0 40e-15
c0<9> result<9> 0 40e-15
c0<8> result<8> 0 40e-15
c0<7> result<7> 0 40e-15
c0<6> result<6> 0 40e-15
c0<5> result<5> 0 40e-15
c0<4> result<4> 0 40e-15
c0<3> result<3> 0 40e-15
c0<2> result<2> 0 40e-15
c0<1> result<1> 0 40e-15
c0<0> result<0> 0 40e-15