.subckt xrom_input_inv a z s=1
m1 z a vdd! vdd! PMOS_VTL L=50e-9 W='s*180e-9'
m0 z a 0 0 NMOS_VTL L=50e-9 W='s*90e-9'
.ends

.subckt xrom_input_and a b out s=1
m1 net16 a 0 0 NMOS_VTL L=50e-9 W='s*90e-9'
m0 z b net16 0 NMOS_VTL L=50e-9 W='s*90e-9'
m3 z b vdd! vdd! PMOS_VTL L=50e-9 W='s*90e-9'
m4 z a vdd! vdd! PMOS_VTL L=50e-9 W='s*90e-9'
xinv z out xrom_input_inv
.ends

.subckt xrom_input_and_tree a<0> out
v_out out a<0> DC=0
.ends

.subckt xrom_input_dec a<0> q<0> q<1>
xrom_inv0 a<0> a_inv<0> xrom_input_inv s=2
xrom_and_tree0 a_inv<0> q<0> xrom_input_and_tree
xrom_and_tree1 a<0> q<1> xrom_input_and_tree
.ends

.subckt xrom_input_array sel<0> sel<1> out<0> out<1> out<2> out<3> out<4> out<5> out<6> out<7> out<8> out<9> out<10> out<11> out<12> out<13>
+ out<14> out<15> out<16> out<17> out<18> out<19> out<20> out<21> out<22> out<23> out<24> out<25> out<26> out<27> out<28> out<29>
+ out<30> out<31> out<32> out<33> out<34> out<35> out<36> out<37> out<38> out<39> out<40> out<41> out<42> out<43> out<44> out<45>
+ out<46> out<47> out<48> out<49> out<50> out<51> out<52> out<53> out<54> out<55> out<56> out<57> out<58> out<59> out<60> out<61>
+ out<62> out<63> out<64> out<65> out<66> out<67> out<68> out<69> out<70> out<71> out<72> out<73> out<74> out<75> out<76> out<77>
+ out<78> out<79> out<80> out<81> out<82> out<83> out<84> out<85> out<86> out<87> out<88> out<89> out<90> out<91> out<92> out<93>
+ out<94> out<95> out<96> out<97> out<98> out<99> out<100> out<101> out<102> out<103> out<104> out<105> out<106> out<107> out<108> out<109>
+ out<110> out<111> out<112> out<113> out<114> out<115> out<116> out<117> out<118> out<119> out<120> out<121> out<122> out<123> out<124> out<125>
+ out<126> out<127> out<128> out<129> out<130> out<131> out<132> out<133> out<134> out<135> out<136> out<137> out<138> out<139> out<140> out<141>
+ out<142> out<143> out<144> out<145> out<146> out<147> out<148> out<149> out<150> out<151> out<152> out<153> out<154> out<155> out<156> out<157>
+ out<158> out<159> out<160> out<161> out<162> out<163> out<164> out<165> out<166> out<167> out<168> out<169> out<170> out<171> out<172> out<173>
+ out<174> out<175> out<176> out<177> out<178> out<179> out<180> out<181> out<182> out<183> out<184> out<185> out<186> out<187> out<188> out<189>
+ out<190> out<191> out<192> out<193> out<194> out<195> out<196> out<197> out<198> out<199> out<200> out<201> out<202> out<203> out<204> out<205>
+ out<206> out<207> out<208> out<209> out<210> out<211> out<212> out<213> out<214> out<215> out<216> out<217> out<218> out<219> out<220> out<221>
+ out<222> out<223> out<224> out<225> out<226> out<227> out<228> out<229> out<230> out<231> out<232> out<233> out<234> out<235> out<236> out<237>
+ out<238> out<239> out<240> out<241> out<242> out<243> out<244> out<245> out<246> out<247> out<248> out<249> out<250> out<251> out<252> out<253>
+ out<254> out<255>
R0 vdd! col<0> 310000
R1 vdd! col<1> 310000
R2 vdd! col<2> 310000
R3 vdd! col<3> 310000
R4 vdd! col<4> 310000
R5 vdd! col<5> 310000
R6 vdd! col<6> 310000
R7 vdd! col<7> 310000
R8 vdd! col<8> 310000
R9 vdd! col<9> 310000
R10 vdd! col<10> 310000
R11 vdd! col<11> 310000
R12 vdd! col<12> 310000
R13 vdd! col<13> 310000
R14 vdd! col<14> 310000
R15 vdd! col<15> 310000
R16 vdd! col<16> 310000
R17 vdd! col<17> 310000
R18 vdd! col<18> 310000
R19 vdd! col<19> 310000
R20 vdd! col<20> 310000
R21 vdd! col<21> 310000
R22 vdd! col<22> 310000
R23 vdd! col<23> 310000
R24 vdd! col<24> 310000
R25 vdd! col<25> 310000
R26 vdd! col<26> 310000
R27 vdd! col<27> 310000
R28 vdd! col<28> 310000
R29 vdd! col<29> 310000
R30 vdd! col<30> 310000
R31 vdd! col<31> 310000
R32 vdd! col<32> 310000
R33 vdd! col<33> 310000
R34 vdd! col<34> 310000
R35 vdd! col<35> 310000
R36 vdd! col<36> 310000
R37 vdd! col<37> 310000
R38 vdd! col<38> 310000
R39 vdd! col<39> 310000
R40 vdd! col<40> 310000
R41 vdd! col<41> 310000
R42 vdd! col<42> 310000
R43 vdd! col<43> 310000
R44 vdd! col<44> 310000
R45 vdd! col<45> 310000
R46 vdd! col<46> 310000
R47 vdd! col<47> 310000
R48 vdd! col<48> 310000
R49 vdd! col<49> 310000
R50 vdd! col<50> 310000
R51 vdd! col<51> 310000
R52 vdd! col<52> 310000
R53 vdd! col<53> 310000
R54 vdd! col<54> 310000
R55 vdd! col<55> 310000
R56 vdd! col<56> 310000
R57 vdd! col<57> 310000
R58 vdd! col<58> 310000
R59 vdd! col<59> 310000
R60 vdd! col<60> 310000
R61 vdd! col<61> 310000
R62 vdd! col<62> 310000
R63 vdd! col<63> 310000
R64 vdd! col<64> 310000
R65 vdd! col<65> 310000
R66 vdd! col<66> 310000
R67 vdd! col<67> 310000
R68 vdd! col<68> 310000
R69 vdd! col<69> 310000
R70 vdd! col<70> 310000
R71 vdd! col<71> 310000
R72 vdd! col<72> 310000
R73 vdd! col<73> 310000
R74 vdd! col<74> 310000
R75 vdd! col<75> 310000
R76 vdd! col<76> 310000
R77 vdd! col<77> 310000
R78 vdd! col<78> 310000
R79 vdd! col<79> 310000
R80 vdd! col<80> 310000
R81 vdd! col<81> 310000
R82 vdd! col<82> 310000
R83 vdd! col<83> 310000
R84 vdd! col<84> 310000
R85 vdd! col<85> 310000
R86 vdd! col<86> 310000
R87 vdd! col<87> 310000
R88 vdd! col<88> 310000
R89 vdd! col<89> 310000
R90 vdd! col<90> 310000
R91 vdd! col<91> 310000
R92 vdd! col<92> 310000
R93 vdd! col<93> 310000
R94 vdd! col<94> 310000
R95 vdd! col<95> 310000
R96 vdd! col<96> 310000
R97 vdd! col<97> 310000
R98 vdd! col<98> 310000
R99 vdd! col<99> 310000
R100 vdd! col<100> 310000
R101 vdd! col<101> 310000
R102 vdd! col<102> 310000
R103 vdd! col<103> 310000
R104 vdd! col<104> 310000
R105 vdd! col<105> 310000
R106 vdd! col<106> 310000
R107 vdd! col<107> 310000
R108 vdd! col<108> 310000
R109 vdd! col<109> 310000
R110 vdd! col<110> 310000
R111 vdd! col<111> 310000
R112 vdd! col<112> 310000
R113 vdd! col<113> 310000
R114 vdd! col<114> 310000
R115 vdd! col<115> 310000
R116 vdd! col<116> 310000
R117 vdd! col<117> 310000
R118 vdd! col<118> 310000
R119 vdd! col<119> 310000
R120 vdd! col<120> 310000
R121 vdd! col<121> 310000
R122 vdd! col<122> 310000
R123 vdd! col<123> 310000
R124 vdd! col<124> 310000
R125 vdd! col<125> 310000
R126 vdd! col<126> 310000
R127 vdd! col<127> 310000
R128 vdd! col<128> 310000
R129 vdd! col<129> 310000
R130 vdd! col<130> 310000
R131 vdd! col<131> 310000
R132 vdd! col<132> 310000
R133 vdd! col<133> 310000
R134 vdd! col<134> 310000
R135 vdd! col<135> 310000
R136 vdd! col<136> 310000
R137 vdd! col<137> 310000
R138 vdd! col<138> 310000
R139 vdd! col<139> 310000
R140 vdd! col<140> 310000
R141 vdd! col<141> 310000
R142 vdd! col<142> 310000
R143 vdd! col<143> 310000
R144 vdd! col<144> 310000
R145 vdd! col<145> 310000
R146 vdd! col<146> 310000
R147 vdd! col<147> 310000
R148 vdd! col<148> 310000
R149 vdd! col<149> 310000
R150 vdd! col<150> 310000
R151 vdd! col<151> 310000
R152 vdd! col<152> 310000
R153 vdd! col<153> 310000
R154 vdd! col<154> 310000
R155 vdd! col<155> 310000
R156 vdd! col<156> 310000
R157 vdd! col<157> 310000
R158 vdd! col<158> 310000
R159 vdd! col<159> 310000
R160 vdd! col<160> 310000
R161 vdd! col<161> 310000
R162 vdd! col<162> 310000
R163 vdd! col<163> 310000
R164 vdd! col<164> 310000
R165 vdd! col<165> 310000
R166 vdd! col<166> 310000
R167 vdd! col<167> 310000
R168 vdd! col<168> 310000
R169 vdd! col<169> 310000
R170 vdd! col<170> 310000
R171 vdd! col<171> 310000
R172 vdd! col<172> 310000
R173 vdd! col<173> 310000
R174 vdd! col<174> 310000
R175 vdd! col<175> 310000
R176 vdd! col<176> 310000
R177 vdd! col<177> 310000
R178 vdd! col<178> 310000
R179 vdd! col<179> 310000
R180 vdd! col<180> 310000
R181 vdd! col<181> 310000
R182 vdd! col<182> 310000
R183 vdd! col<183> 310000
R184 vdd! col<184> 310000
R185 vdd! col<185> 310000
R186 vdd! col<186> 310000
R187 vdd! col<187> 310000
R188 vdd! col<188> 310000
R189 vdd! col<189> 310000
R190 vdd! col<190> 310000
R191 vdd! col<191> 310000
R192 vdd! col<192> 310000
R193 vdd! col<193> 310000
R194 vdd! col<194> 310000
R195 vdd! col<195> 310000
R196 vdd! col<196> 310000
R197 vdd! col<197> 310000
R198 vdd! col<198> 310000
R199 vdd! col<199> 310000
R200 vdd! col<200> 310000
R201 vdd! col<201> 310000
R202 vdd! col<202> 310000
R203 vdd! col<203> 310000
R204 vdd! col<204> 310000
R205 vdd! col<205> 310000
R206 vdd! col<206> 310000
R207 vdd! col<207> 310000
R208 vdd! col<208> 310000
R209 vdd! col<209> 310000
R210 vdd! col<210> 310000
R211 vdd! col<211> 310000
R212 vdd! col<212> 310000
R213 vdd! col<213> 310000
R214 vdd! col<214> 310000
R215 vdd! col<215> 310000
R216 vdd! col<216> 310000
R217 vdd! col<217> 310000
R218 vdd! col<218> 310000
R219 vdd! col<219> 310000
R220 vdd! col<220> 310000
R221 vdd! col<221> 310000
R222 vdd! col<222> 310000
R223 vdd! col<223> 310000
R224 vdd! col<224> 310000
R225 vdd! col<225> 310000
R226 vdd! col<226> 310000
R227 vdd! col<227> 310000
R228 vdd! col<228> 310000
R229 vdd! col<229> 310000
R230 vdd! col<230> 310000
R231 vdd! col<231> 310000
R232 vdd! col<232> 310000
R233 vdd! col<233> 310000
R234 vdd! col<234> 310000
R235 vdd! col<235> 310000
R236 vdd! col<236> 310000
R237 vdd! col<237> 310000
R238 vdd! col<238> 310000
R239 vdd! col<239> 310000
R240 vdd! col<240> 310000
R241 vdd! col<241> 310000
R242 vdd! col<242> 310000
R243 vdd! col<243> 310000
R244 vdd! col<244> 310000
R245 vdd! col<245> 310000
R246 vdd! col<246> 310000
R247 vdd! col<247> 310000
R248 vdd! col<248> 310000
R249 vdd! col<249> 310000
R250 vdd! col<250> 310000
R251 vdd! col<251> 310000
R252 vdd! col<252> 310000
R253 vdd! col<253> 310000
R254 vdd! col<254> 310000
R255 vdd! col<255> 310000
mn1 col<1> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn2 col<2> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn3 col<3> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn5 col<5> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn6 col<6> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn7 col<7> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn9 col<9> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn10 col<10> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn11 col<11> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn13 col<13> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn14 col<14> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn15 col<15> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn17 col<17> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn18 col<18> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn19 col<19> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn21 col<21> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn22 col<22> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn23 col<23> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn25 col<25> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn26 col<26> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn27 col<27> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn29 col<29> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn30 col<30> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn31 col<31> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn33 col<33> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn34 col<34> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn35 col<35> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn37 col<37> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn38 col<38> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn39 col<39> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn41 col<41> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn42 col<42> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn43 col<43> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn44 col<44> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn45 col<45> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn46 col<46> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn47 col<47> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn48 col<48> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn49 col<49> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn50 col<50> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn51 col<51> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn52 col<52> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn53 col<53> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn54 col<54> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn55 col<55> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn57 col<57> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn58 col<58> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn59 col<59> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn61 col<61> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn62 col<62> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn63 col<63> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn65 col<65> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn66 col<66> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn67 col<67> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn69 col<69> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn70 col<70> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn71 col<71> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn76 col<76> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn77 col<77> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn80 col<80> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn81 col<81> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn85 col<85> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn88 col<88> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn89 col<89> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn90 col<90> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn91 col<91> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn93 col<93> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn94 col<94> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn95 col<95> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn97 col<97> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn98 col<98> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn99 col<99> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn101 col<101> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn102 col<102> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn103 col<103> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn105 col<105> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn108 col<108> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn118 col<118> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn120 col<120> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn124 col<124> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn125 col<125> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn126 col<126> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn127 col<127> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn129 col<129> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn130 col<130> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn131 col<131> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn133 col<133> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn134 col<134> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn135 col<135> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn136 col<136> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn142 col<142> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn144 col<144> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn146 col<146> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn149 col<149> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn152 col<152> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn153 col<153> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn154 col<154> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn155 col<155> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn156 col<156> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn157 col<157> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn158 col<158> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn159 col<159> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn161 col<161> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn162 col<162> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn163 col<163> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn165 col<165> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn166 col<166> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn167 col<167> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn168 col<168> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn169 col<169> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn170 col<170> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn171 col<171> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn172 col<172> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn178 col<178> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn180 col<180> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn181 col<181> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn182 col<182> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn183 col<183> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn185 col<185> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn186 col<186> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn187 col<187> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn189 col<189> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn190 col<190> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn191 col<191> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn193 col<193> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn194 col<194> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn195 col<195> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn197 col<197> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn198 col<198> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn199 col<199> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn200 col<200> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn201 col<201> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn202 col<202> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn203 col<203> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn204 col<204> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn205 col<205> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn213 col<213> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn214 col<214> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn215 col<215> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn217 col<217> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn218 col<218> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn219 col<219> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn221 col<221> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn222 col<222> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn223 col<223> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn225 col<225> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn226 col<226> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn227 col<227> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn229 col<229> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn230 col<230> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn231 col<231> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn232 col<232> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn233 col<233> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn234 col<234> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn235 col<235> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn240 col<240> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn241 col<241> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn242 col<242> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn243 col<243> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn245 col<245> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn246 col<246> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn247 col<247> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn248 col<248> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn249 col<249> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn250 col<250> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn251 col<251> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn253 col<253> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn254 col<254> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
mn255 col<255> sel<0> 0 0 NMOS_VTL L=50e-9 W='1*90e-9'
xrom_inv0 col<0> out<0> xrom_input_inv s=1
xrom_inv1 col<1> out<1> xrom_input_inv s=1
xrom_inv2 col<2> out<2> xrom_input_inv s=1
xrom_inv3 col<3> out<3> xrom_input_inv s=1
xrom_inv4 col<4> out<4> xrom_input_inv s=1
xrom_inv5 col<5> out<5> xrom_input_inv s=1
xrom_inv6 col<6> out<6> xrom_input_inv s=1
xrom_inv7 col<7> out<7> xrom_input_inv s=1
xrom_inv8 col<8> out<8> xrom_input_inv s=1
xrom_inv9 col<9> out<9> xrom_input_inv s=1
xrom_inv10 col<10> out<10> xrom_input_inv s=1
xrom_inv11 col<11> out<11> xrom_input_inv s=1
xrom_inv12 col<12> out<12> xrom_input_inv s=1
xrom_inv13 col<13> out<13> xrom_input_inv s=1
xrom_inv14 col<14> out<14> xrom_input_inv s=1
xrom_inv15 col<15> out<15> xrom_input_inv s=1
xrom_inv16 col<16> out<16> xrom_input_inv s=1
xrom_inv17 col<17> out<17> xrom_input_inv s=1
xrom_inv18 col<18> out<18> xrom_input_inv s=1
xrom_inv19 col<19> out<19> xrom_input_inv s=1
xrom_inv20 col<20> out<20> xrom_input_inv s=1
xrom_inv21 col<21> out<21> xrom_input_inv s=1
xrom_inv22 col<22> out<22> xrom_input_inv s=1
xrom_inv23 col<23> out<23> xrom_input_inv s=1
xrom_inv24 col<24> out<24> xrom_input_inv s=1
xrom_inv25 col<25> out<25> xrom_input_inv s=1
xrom_inv26 col<26> out<26> xrom_input_inv s=1
xrom_inv27 col<27> out<27> xrom_input_inv s=1
xrom_inv28 col<28> out<28> xrom_input_inv s=1
xrom_inv29 col<29> out<29> xrom_input_inv s=1
xrom_inv30 col<30> out<30> xrom_input_inv s=1
xrom_inv31 col<31> out<31> xrom_input_inv s=1
xrom_inv32 col<32> out<32> xrom_input_inv s=1
xrom_inv33 col<33> out<33> xrom_input_inv s=1
xrom_inv34 col<34> out<34> xrom_input_inv s=1
xrom_inv35 col<35> out<35> xrom_input_inv s=1
xrom_inv36 col<36> out<36> xrom_input_inv s=1
xrom_inv37 col<37> out<37> xrom_input_inv s=1
xrom_inv38 col<38> out<38> xrom_input_inv s=1
xrom_inv39 col<39> out<39> xrom_input_inv s=1
xrom_inv40 col<40> out<40> xrom_input_inv s=1
xrom_inv41 col<41> out<41> xrom_input_inv s=1
xrom_inv42 col<42> out<42> xrom_input_inv s=1
xrom_inv43 col<43> out<43> xrom_input_inv s=1
xrom_inv44 col<44> out<44> xrom_input_inv s=1
xrom_inv45 col<45> out<45> xrom_input_inv s=1
xrom_inv46 col<46> out<46> xrom_input_inv s=1
xrom_inv47 col<47> out<47> xrom_input_inv s=1
xrom_inv48 col<48> out<48> xrom_input_inv s=1
xrom_inv49 col<49> out<49> xrom_input_inv s=1
xrom_inv50 col<50> out<50> xrom_input_inv s=1
xrom_inv51 col<51> out<51> xrom_input_inv s=1
xrom_inv52 col<52> out<52> xrom_input_inv s=1
xrom_inv53 col<53> out<53> xrom_input_inv s=1
xrom_inv54 col<54> out<54> xrom_input_inv s=1
xrom_inv55 col<55> out<55> xrom_input_inv s=1
xrom_inv56 col<56> out<56> xrom_input_inv s=1
xrom_inv57 col<57> out<57> xrom_input_inv s=1
xrom_inv58 col<58> out<58> xrom_input_inv s=1
xrom_inv59 col<59> out<59> xrom_input_inv s=1
xrom_inv60 col<60> out<60> xrom_input_inv s=1
xrom_inv61 col<61> out<61> xrom_input_inv s=1
xrom_inv62 col<62> out<62> xrom_input_inv s=1
xrom_inv63 col<63> out<63> xrom_input_inv s=1
xrom_inv64 col<64> out<64> xrom_input_inv s=1
xrom_inv65 col<65> out<65> xrom_input_inv s=1
xrom_inv66 col<66> out<66> xrom_input_inv s=1
xrom_inv67 col<67> out<67> xrom_input_inv s=1
xrom_inv68 col<68> out<68> xrom_input_inv s=1
xrom_inv69 col<69> out<69> xrom_input_inv s=1
xrom_inv70 col<70> out<70> xrom_input_inv s=1
xrom_inv71 col<71> out<71> xrom_input_inv s=1
xrom_inv72 col<72> out<72> xrom_input_inv s=1
xrom_inv73 col<73> out<73> xrom_input_inv s=1
xrom_inv74 col<74> out<74> xrom_input_inv s=1
xrom_inv75 col<75> out<75> xrom_input_inv s=1
xrom_inv76 col<76> out<76> xrom_input_inv s=1
xrom_inv77 col<77> out<77> xrom_input_inv s=1
xrom_inv78 col<78> out<78> xrom_input_inv s=1
xrom_inv79 col<79> out<79> xrom_input_inv s=1
xrom_inv80 col<80> out<80> xrom_input_inv s=1
xrom_inv81 col<81> out<81> xrom_input_inv s=1
xrom_inv82 col<82> out<82> xrom_input_inv s=1
xrom_inv83 col<83> out<83> xrom_input_inv s=1
xrom_inv84 col<84> out<84> xrom_input_inv s=1
xrom_inv85 col<85> out<85> xrom_input_inv s=1
xrom_inv86 col<86> out<86> xrom_input_inv s=1
xrom_inv87 col<87> out<87> xrom_input_inv s=1
xrom_inv88 col<88> out<88> xrom_input_inv s=1
xrom_inv89 col<89> out<89> xrom_input_inv s=1
xrom_inv90 col<90> out<90> xrom_input_inv s=1
xrom_inv91 col<91> out<91> xrom_input_inv s=1
xrom_inv92 col<92> out<92> xrom_input_inv s=1
xrom_inv93 col<93> out<93> xrom_input_inv s=1
xrom_inv94 col<94> out<94> xrom_input_inv s=1
xrom_inv95 col<95> out<95> xrom_input_inv s=1
xrom_inv96 col<96> out<96> xrom_input_inv s=1
xrom_inv97 col<97> out<97> xrom_input_inv s=1
xrom_inv98 col<98> out<98> xrom_input_inv s=1
xrom_inv99 col<99> out<99> xrom_input_inv s=1
xrom_inv100 col<100> out<100> xrom_input_inv s=1
xrom_inv101 col<101> out<101> xrom_input_inv s=1
xrom_inv102 col<102> out<102> xrom_input_inv s=1
xrom_inv103 col<103> out<103> xrom_input_inv s=1
xrom_inv104 col<104> out<104> xrom_input_inv s=1
xrom_inv105 col<105> out<105> xrom_input_inv s=1
xrom_inv106 col<106> out<106> xrom_input_inv s=1
xrom_inv107 col<107> out<107> xrom_input_inv s=1
xrom_inv108 col<108> out<108> xrom_input_inv s=1
xrom_inv109 col<109> out<109> xrom_input_inv s=1
xrom_inv110 col<110> out<110> xrom_input_inv s=1
xrom_inv111 col<111> out<111> xrom_input_inv s=1
xrom_inv112 col<112> out<112> xrom_input_inv s=1
xrom_inv113 col<113> out<113> xrom_input_inv s=1
xrom_inv114 col<114> out<114> xrom_input_inv s=1
xrom_inv115 col<115> out<115> xrom_input_inv s=1
xrom_inv116 col<116> out<116> xrom_input_inv s=1
xrom_inv117 col<117> out<117> xrom_input_inv s=1
xrom_inv118 col<118> out<118> xrom_input_inv s=1
xrom_inv119 col<119> out<119> xrom_input_inv s=1
xrom_inv120 col<120> out<120> xrom_input_inv s=1
xrom_inv121 col<121> out<121> xrom_input_inv s=1
xrom_inv122 col<122> out<122> xrom_input_inv s=1
xrom_inv123 col<123> out<123> xrom_input_inv s=1
xrom_inv124 col<124> out<124> xrom_input_inv s=1
xrom_inv125 col<125> out<125> xrom_input_inv s=1
xrom_inv126 col<126> out<126> xrom_input_inv s=1
xrom_inv127 col<127> out<127> xrom_input_inv s=1
xrom_inv128 col<128> out<128> xrom_input_inv s=1
xrom_inv129 col<129> out<129> xrom_input_inv s=1
xrom_inv130 col<130> out<130> xrom_input_inv s=1
xrom_inv131 col<131> out<131> xrom_input_inv s=1
xrom_inv132 col<132> out<132> xrom_input_inv s=1
xrom_inv133 col<133> out<133> xrom_input_inv s=1
xrom_inv134 col<134> out<134> xrom_input_inv s=1
xrom_inv135 col<135> out<135> xrom_input_inv s=1
xrom_inv136 col<136> out<136> xrom_input_inv s=1
xrom_inv137 col<137> out<137> xrom_input_inv s=1
xrom_inv138 col<138> out<138> xrom_input_inv s=1
xrom_inv139 col<139> out<139> xrom_input_inv s=1
xrom_inv140 col<140> out<140> xrom_input_inv s=1
xrom_inv141 col<141> out<141> xrom_input_inv s=1
xrom_inv142 col<142> out<142> xrom_input_inv s=1
xrom_inv143 col<143> out<143> xrom_input_inv s=1
xrom_inv144 col<144> out<144> xrom_input_inv s=1
xrom_inv145 col<145> out<145> xrom_input_inv s=1
xrom_inv146 col<146> out<146> xrom_input_inv s=1
xrom_inv147 col<147> out<147> xrom_input_inv s=1
xrom_inv148 col<148> out<148> xrom_input_inv s=1
xrom_inv149 col<149> out<149> xrom_input_inv s=1
xrom_inv150 col<150> out<150> xrom_input_inv s=1
xrom_inv151 col<151> out<151> xrom_input_inv s=1
xrom_inv152 col<152> out<152> xrom_input_inv s=1
xrom_inv153 col<153> out<153> xrom_input_inv s=1
xrom_inv154 col<154> out<154> xrom_input_inv s=1
xrom_inv155 col<155> out<155> xrom_input_inv s=1
xrom_inv156 col<156> out<156> xrom_input_inv s=1
xrom_inv157 col<157> out<157> xrom_input_inv s=1
xrom_inv158 col<158> out<158> xrom_input_inv s=1
xrom_inv159 col<159> out<159> xrom_input_inv s=1
xrom_inv160 col<160> out<160> xrom_input_inv s=1
xrom_inv161 col<161> out<161> xrom_input_inv s=1
xrom_inv162 col<162> out<162> xrom_input_inv s=1
xrom_inv163 col<163> out<163> xrom_input_inv s=1
xrom_inv164 col<164> out<164> xrom_input_inv s=1
xrom_inv165 col<165> out<165> xrom_input_inv s=1
xrom_inv166 col<166> out<166> xrom_input_inv s=1
xrom_inv167 col<167> out<167> xrom_input_inv s=1
xrom_inv168 col<168> out<168> xrom_input_inv s=1
xrom_inv169 col<169> out<169> xrom_input_inv s=1
xrom_inv170 col<170> out<170> xrom_input_inv s=1
xrom_inv171 col<171> out<171> xrom_input_inv s=1
xrom_inv172 col<172> out<172> xrom_input_inv s=1
xrom_inv173 col<173> out<173> xrom_input_inv s=1
xrom_inv174 col<174> out<174> xrom_input_inv s=1
xrom_inv175 col<175> out<175> xrom_input_inv s=1
xrom_inv176 col<176> out<176> xrom_input_inv s=1
xrom_inv177 col<177> out<177> xrom_input_inv s=1
xrom_inv178 col<178> out<178> xrom_input_inv s=1
xrom_inv179 col<179> out<179> xrom_input_inv s=1
xrom_inv180 col<180> out<180> xrom_input_inv s=1
xrom_inv181 col<181> out<181> xrom_input_inv s=1
xrom_inv182 col<182> out<182> xrom_input_inv s=1
xrom_inv183 col<183> out<183> xrom_input_inv s=1
xrom_inv184 col<184> out<184> xrom_input_inv s=1
xrom_inv185 col<185> out<185> xrom_input_inv s=1
xrom_inv186 col<186> out<186> xrom_input_inv s=1
xrom_inv187 col<187> out<187> xrom_input_inv s=1
xrom_inv188 col<188> out<188> xrom_input_inv s=1
xrom_inv189 col<189> out<189> xrom_input_inv s=1
xrom_inv190 col<190> out<190> xrom_input_inv s=1
xrom_inv191 col<191> out<191> xrom_input_inv s=1
xrom_inv192 col<192> out<192> xrom_input_inv s=1
xrom_inv193 col<193> out<193> xrom_input_inv s=1
xrom_inv194 col<194> out<194> xrom_input_inv s=1
xrom_inv195 col<195> out<195> xrom_input_inv s=1
xrom_inv196 col<196> out<196> xrom_input_inv s=1
xrom_inv197 col<197> out<197> xrom_input_inv s=1
xrom_inv198 col<198> out<198> xrom_input_inv s=1
xrom_inv199 col<199> out<199> xrom_input_inv s=1
xrom_inv200 col<200> out<200> xrom_input_inv s=1
xrom_inv201 col<201> out<201> xrom_input_inv s=1
xrom_inv202 col<202> out<202> xrom_input_inv s=1
xrom_inv203 col<203> out<203> xrom_input_inv s=1
xrom_inv204 col<204> out<204> xrom_input_inv s=1
xrom_inv205 col<205> out<205> xrom_input_inv s=1
xrom_inv206 col<206> out<206> xrom_input_inv s=1
xrom_inv207 col<207> out<207> xrom_input_inv s=1
xrom_inv208 col<208> out<208> xrom_input_inv s=1
xrom_inv209 col<209> out<209> xrom_input_inv s=1
xrom_inv210 col<210> out<210> xrom_input_inv s=1
xrom_inv211 col<211> out<211> xrom_input_inv s=1
xrom_inv212 col<212> out<212> xrom_input_inv s=1
xrom_inv213 col<213> out<213> xrom_input_inv s=1
xrom_inv214 col<214> out<214> xrom_input_inv s=1
xrom_inv215 col<215> out<215> xrom_input_inv s=1
xrom_inv216 col<216> out<216> xrom_input_inv s=1
xrom_inv217 col<217> out<217> xrom_input_inv s=1
xrom_inv218 col<218> out<218> xrom_input_inv s=1
xrom_inv219 col<219> out<219> xrom_input_inv s=1
xrom_inv220 col<220> out<220> xrom_input_inv s=1
xrom_inv221 col<221> out<221> xrom_input_inv s=1
xrom_inv222 col<222> out<222> xrom_input_inv s=1
xrom_inv223 col<223> out<223> xrom_input_inv s=1
xrom_inv224 col<224> out<224> xrom_input_inv s=1
xrom_inv225 col<225> out<225> xrom_input_inv s=1
xrom_inv226 col<226> out<226> xrom_input_inv s=1
xrom_inv227 col<227> out<227> xrom_input_inv s=1
xrom_inv228 col<228> out<228> xrom_input_inv s=1
xrom_inv229 col<229> out<229> xrom_input_inv s=1
xrom_inv230 col<230> out<230> xrom_input_inv s=1
xrom_inv231 col<231> out<231> xrom_input_inv s=1
xrom_inv232 col<232> out<232> xrom_input_inv s=1
xrom_inv233 col<233> out<233> xrom_input_inv s=1
xrom_inv234 col<234> out<234> xrom_input_inv s=1
xrom_inv235 col<235> out<235> xrom_input_inv s=1
xrom_inv236 col<236> out<236> xrom_input_inv s=1
xrom_inv237 col<237> out<237> xrom_input_inv s=1
xrom_inv238 col<238> out<238> xrom_input_inv s=1
xrom_inv239 col<239> out<239> xrom_input_inv s=1
xrom_inv240 col<240> out<240> xrom_input_inv s=1
xrom_inv241 col<241> out<241> xrom_input_inv s=1
xrom_inv242 col<242> out<242> xrom_input_inv s=1
xrom_inv243 col<243> out<243> xrom_input_inv s=1
xrom_inv244 col<244> out<244> xrom_input_inv s=1
xrom_inv245 col<245> out<245> xrom_input_inv s=1
xrom_inv246 col<246> out<246> xrom_input_inv s=1
xrom_inv247 col<247> out<247> xrom_input_inv s=1
xrom_inv248 col<248> out<248> xrom_input_inv s=1
xrom_inv249 col<249> out<249> xrom_input_inv s=1
xrom_inv250 col<250> out<250> xrom_input_inv s=1
xrom_inv251 col<251> out<251> xrom_input_inv s=1
xrom_inv252 col<252> out<252> xrom_input_inv s=1
xrom_inv253 col<253> out<253> xrom_input_inv s=1
xrom_inv254 col<254> out<254> xrom_input_inv s=1
xrom_inv255 col<255> out<255> xrom_input_inv s=1
.ends

.subckt xrom_input addr<0> input<0> input<1> input<2> input<3> input<4> input<5> input<6> input<7> input<8> input<9> input<10> input<11> input<12> input<13> input<14>
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
+ input<255>
xrom_dec_inst addr<0> wl<0> wl<1> xrom_input_dec
xrom_array_inst wl<0> wl<1> input<0> input<1> input<2> input<3> input<4> input<5> input<6> input<7> input<8> input<9> input<10> input<11> input<12> input<13>
+ input<14> input<15> input<16> input<17> input<18> input<19> input<20> input<21> input<22> input<23> input<24> input<25> input<26> input<27> input<28> input<29>
+ input<30> input<31> input<32> input<33> input<34> input<35> input<36> input<37> input<38> input<39> input<40> input<41> input<42> input<43> input<44> input<45>
+ input<46> input<47> input<48> input<49> input<50> input<51> input<52> input<53> input<54> input<55> input<56> input<57> input<58> input<59> input<60> input<61>
+ input<62> input<63> input<64> input<65> input<66> input<67> input<68> input<69> input<70> input<71> input<72> input<73> input<74> input<75> input<76> input<77>
+ input<78> input<79> input<80> input<81> input<82> input<83> input<84> input<85> input<86> input<87> input<88> input<89> input<90> input<91> input<92> input<93>
+ input<94> input<95> input<96> input<97> input<98> input<99> input<100> input<101> input<102> input<103> input<104> input<105> input<106> input<107> input<108> input<109>
+ input<110> input<111> input<112> input<113> input<114> input<115> input<116> input<117> input<118> input<119> input<120> input<121> input<122> input<123> input<124> input<125>
+ input<126> input<127> input<128> input<129> input<130> input<131> input<132> input<133> input<134> input<135> input<136> input<137> input<138> input<139> input<140> input<141>
+ input<142> input<143> input<144> input<145> input<146> input<147> input<148> input<149> input<150> input<151> input<152> input<153> input<154> input<155> input<156> input<157>
+ input<158> input<159> input<160> input<161> input<162> input<163> input<164> input<165> input<166> input<167> input<168> input<169> input<170> input<171> input<172> input<173>
+ input<174> input<175> input<176> input<177> input<178> input<179> input<180> input<181> input<182> input<183> input<184> input<185> input<186> input<187> input<188> input<189>
+ input<190> input<191> input<192> input<193> input<194> input<195> input<196> input<197> input<198> input<199> input<200> input<201> input<202> input<203> input<204> input<205>
+ input<206> input<207> input<208> input<209> input<210> input<211> input<212> input<213> input<214> input<215> input<216> input<217> input<218> input<219> input<220> input<221>
+ input<222> input<223> input<224> input<225> input<226> input<227> input<228> input<229> input<230> input<231> input<232> input<233> input<234> input<235> input<236> input<237>
+ input<238> input<239> input<240> input<241> input<242> input<243> input<244> input<245> input<246> input<247> input<248> input<249> input<250> input<251> input<252> input<253>
+ input<254> input<255> xrom_input_array
.ends

