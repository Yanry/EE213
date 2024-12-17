** Library name: mycells45
** Cell name: inverter_param
** View name: schematic
.subckt inverter_param a z
m0 z a 0 0 NMOS_VTL L=50e-9 W='90e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 z a vdd! vdd! PMOS_VTL L=50e-9 W='145e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends inverter_param
** End of subcircuit definition.

** Library name: mycells45
** Cell name: latch
** View name: schematic
.subckt latch d q clk clk_inv
m4 net1 clk net5 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 net2 clk_inv net5 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 net1 clk_inv net5 vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 net2 clk net5 vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
xi0 q net2 inverter_param size=1
xi1 net5 q inverter_param size=1
xi2 d net1 inverter_param size=1
.ends latch
** End of subcircuit definition.

** Library name: mycells45
** Cell name: register
** View name: schematic
.subckt register d q clk
xi1 net4 q clk clk_inv latch
xi0 d net4 clk_inv clk latch
xi3 clk clk_inv inverter_param size=1
.ends register
** End of subcircuit definition.

** Library name: mycells45
** Cell name: TG_mux2_1
** View name: schematic
.subckt TG_mux2_1 a0 a1 out sel
m2 a0 sel out vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 a1 sel_inv out vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 a0 sel_inv out 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 a1 sel out 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
xi0 sel sel_inv inverter_param size=1
.ends TG_mux2_1
** End of subcircuit definition.

** Library name: mycells45
** Cell name: REG_4bit
** View name: schematic
.subckt REG_4bit clk d<3> d<2> d<1> d<0> en q<3> q<2> q<1> q<0>
xi0<3> net8<0> q<3> clk register
xi0<2> net8<1> q<2> clk register
xi0<1> net8<2> q<1> clk register
xi0<0> net8<3> q<0> clk register
xi1<3> q<3> d<3> net8<0> en TG_mux2_1
xi1<2> q<2> d<2> net8<1> en TG_mux2_1
xi1<1> q<1> d<1> net8<2> en TG_mux2_1
xi1<0> q<0> d<0> net8<3> en TG_mux2_1
.ends REG_4bit
** End of subcircuit definition.

** Library name: mycells45
** Cell name: NAND_PARAM
** View name: schematic
.subckt NAND_PARAM a b z
m1 net11 b 0 0 NMOS_VTL L=50e-9 W='180e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 z a net11 0 NMOS_VTL L=50e-9 W='180e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 z b vdd! vdd! PMOS_VTL L=50e-9 W='145e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 z a vdd! vdd! PMOS_VTL L=50e-9 W='145e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends NAND_PARAM
** End of subcircuit definition.

** Library name: mycells45
** Cell name: NOR3_PARAM
** View name: schematic
.subckt NOR3_PARAM a b c z
m2 z c 0 0 NMOS_VTL L=50e-9 W='90e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 z b 0 0 NMOS_VTL L=50e-9 W='90e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 z a 0 0 NMOS_VTL L=50e-9 W='90e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m5 net9 c vdd! vdd! PMOS_VTL L=50e-9 W='435e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 net8 b net9 vdd! PMOS_VTL L=50e-9 W='435e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 z a net8 vdd! PMOS_VTL L=50e-9 W='435e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends NOR3_PARAM
** End of subcircuit definition.

** Library name: mycells45
** Cell name: DECODER_6bit
** View name: schematic
.subckt DECODER_6bit in<4> in<3> in<2> in<1> in<0> out<31> out<30> out<29> out<28> out<27> out<26> out<25> out<24> out<23> out<22> out<21> out<20> out<19> out<18> out<17> out<16> out<15> out<14> out<13> out<12> out<11> out<10> out<9> out<8> out<7> out<6> out<5> out<4> out<3> out<2> out<1> out<0> in<5> out<63> out<62> out<61> out<60> out<59> out<58> out<57> out<56> out<55> out<54> out<53> out<52> out<51> out<50> out<49> out<48> out<47> out<46> out<45> out<44> out<43> out<42> out<41> out<40> out<39> out<38> out<37> out<36> out<35> out<34> out<33> out<32>
xi273 net0319 net0248 net01 NAND_PARAM size=1
xi272 net0423 net0316 net0135 NAND_PARAM size=1
xi270 net0311 net0420 net02 NAND_PARAM size=1
xi269 net0319 net0458 net03 NAND_PARAM size=1
xi268 net0423 net0316 net0136 NAND_PARAM size=1
xi266 net0311 net0420 net04 NAND_PARAM size=1
xi265 net0283 net0248 net05 NAND_PARAM size=1
xi264 net0423 net0316 net0137 NAND_PARAM size=1
xi262 net0311 net0420 net06 NAND_PARAM size=1
xi261 net0283 net0458 net07 NAND_PARAM size=1
xi260 net0423 net0316 net0138 NAND_PARAM size=1
xi258 net0311 net0420 net08 NAND_PARAM size=1
xi257 net0319 net0248 net09 NAND_PARAM size=1
xi256 net0423 net0274 net0139 NAND_PARAM size=1
xi254 net0311 net0420 net010 NAND_PARAM size=1
xi253 net0319 net0458 net011 NAND_PARAM size=1
xi252 net0423 net0274 net0140 NAND_PARAM size=1
xi250 net0311 net0420 net012 NAND_PARAM size=1
xi249 net0283 net0248 net013 NAND_PARAM size=1
xi248 net0423 net0274 net0141 NAND_PARAM size=1
xi246 net0311 net0420 net014 NAND_PARAM size=1
xi245 net0283 net0458 net015 NAND_PARAM size=1
xi244 net0423 net0274 net0142 NAND_PARAM size=1
xi242 net0311 net0420 net016 NAND_PARAM size=1
xi241 net0319 net0248 net017 NAND_PARAM size=1
xi240 net0381 net0316 net0143 NAND_PARAM size=1
xi238 net0311 net0420 net018 NAND_PARAM size=1
xi237 net0319 net0458 net019 NAND_PARAM size=1
xi236 net0381 net0316 net0144 NAND_PARAM size=1
xi234 net0311 net0420 net0654 NAND_PARAM size=1
xi233 net0283 net0248 net021 NAND_PARAM size=1
xi232 net0381 net0316 net0145 NAND_PARAM size=1
xi230 net0311 net0420 net022 NAND_PARAM size=1
xi229 net0283 net0458 net023 NAND_PARAM size=1
xi228 net0381 net0316 net0146 NAND_PARAM size=1
xi226 net0311 net0420 net024 NAND_PARAM size=1
xi225 net0319 net0248 net025 NAND_PARAM size=1
xi224 net0381 net0274 net0147 NAND_PARAM size=1
xi222 net0311 net0420 net026 NAND_PARAM size=1
xi221 net0319 net0458 net027 NAND_PARAM size=1
xi220 net0381 net0274 net0148 NAND_PARAM size=1
xi218 net0311 net0420 net028 NAND_PARAM size=1
xi217 net0283 net0248 net029 NAND_PARAM size=1
xi216 net0381 net0274 net0149 NAND_PARAM size=1
xi214 net0311 net0420 net030 NAND_PARAM size=1
xi213 net0283 net0458 net031 NAND_PARAM size=1
xi212 net0381 net0274 net0150 NAND_PARAM size=1
xi210 net0311 net0420 net032 NAND_PARAM size=1
xi209 net0319 net0248 net033 NAND_PARAM size=1
xi208 net0423 net0316 net0151 NAND_PARAM size=1
xi206 net0311 net0498 net034 NAND_PARAM size=1
xi205 net0319 net0458 net035 NAND_PARAM size=1
xi204 net0423 net0316 net0152 NAND_PARAM size=1
xi202 net0311 net0498 net036 NAND_PARAM size=1
xi201 net0283 net0248 net037 NAND_PARAM size=1
xi200 net0423 net0316 net0153 NAND_PARAM size=1
xi198 net0311 net0498 net038 NAND_PARAM size=1
xi197 net0283 net0458 net039 NAND_PARAM size=1
xi196 net0423 net0316 net0154 NAND_PARAM size=1
xi194 net0311 net0498 net040 NAND_PARAM size=1
xi193 net0319 net0248 net041 NAND_PARAM size=1
xi192 net0423 net0274 net0155 NAND_PARAM size=1
xi190 net0311 net0498 net042 NAND_PARAM size=1
xi189 net0319 net0458 net043 NAND_PARAM size=1
xi188 net0423 net0274 net0156 NAND_PARAM size=1
xi186 net0311 net0498 net044 NAND_PARAM size=1
xi185 net0283 net0248 net045 NAND_PARAM size=1
xi184 net0423 net0274 net0157 NAND_PARAM size=1
xi182 net0311 net0498 net046 NAND_PARAM size=1
xi181 net0283 net0458 net047 NAND_PARAM size=1
xi180 net0423 net0274 net0158 NAND_PARAM size=1
xi178 net0311 net0498 net048 NAND_PARAM size=1
xi177 net0319 net0248 net049 NAND_PARAM size=1
xi176 net0381 net0316 net0159 NAND_PARAM size=1
xi174 net0311 net0498 net050 NAND_PARAM size=1
xi173 net0319 net0458 net051 NAND_PARAM size=1
xi172 net0381 net0316 net0160 NAND_PARAM size=1
xi170 net0311 net0498 net052 NAND_PARAM size=1
xi169 net0283 net0248 net053 NAND_PARAM size=1
xi168 net0381 net0316 net0161 NAND_PARAM size=1
xi166 net0311 net0498 net054 NAND_PARAM size=1
xi165 net0283 net0458 net055 NAND_PARAM size=1
xi164 net0381 net0316 net0162 NAND_PARAM size=1
xi162 net0311 net0498 net056 NAND_PARAM size=1
xi161 net0319 net0248 net057 NAND_PARAM size=1
xi160 net0381 net0274 net0163 NAND_PARAM size=1
xi158 net0311 net0498 net058 NAND_PARAM size=1
xi157 net0319 net0458 net059 NAND_PARAM size=1
xi156 net0381 net0274 net0164 NAND_PARAM size=1
xi154 net0311 net0498 net060 NAND_PARAM size=1
xi153 net0283 net0248 net061 NAND_PARAM size=1
xi152 net0381 net0274 net0165 NAND_PARAM size=1
xi150 net0311 net0498 net062 NAND_PARAM size=1
xi149 net0283 net0458 net063 NAND_PARAM size=1
xi148 net0381 net0274 net0166 NAND_PARAM size=1
xi146 net0311 net0498 net064 NAND_PARAM size=1
xi145 net0319 net0248 net065 NAND_PARAM size=1
xi144 net0423 net0316 net0167 NAND_PARAM size=1
xi142 net0449 net0420 net066 NAND_PARAM size=1
xi141 net0319 net0458 net067 NAND_PARAM size=1
xi140 net0423 net0316 net0168 NAND_PARAM size=1
xi138 net0449 net0420 net068 NAND_PARAM size=1
xi137 net0283 net0248 net069 NAND_PARAM size=1
xi136 net0423 net0316 net0169 NAND_PARAM size=1
xi134 net0449 net0420 net070 NAND_PARAM size=1
xi133 net0283 net0458 net071 NAND_PARAM size=1
xi132 net0423 net0316 net0170 NAND_PARAM size=1
xi130 net0449 net0420 net072 NAND_PARAM size=1
xi129 net0319 net0248 net073 NAND_PARAM size=1
xi128 net0423 net0274 net0171 NAND_PARAM size=1
xi126 net0449 net0420 net074 NAND_PARAM size=1
xi125 net0319 net0458 net075 NAND_PARAM size=1
xi124 net0423 net0274 net0172 NAND_PARAM size=1
xi122 net0449 net0420 net076 NAND_PARAM size=1
xi121 net0283 net0248 net077 NAND_PARAM size=1
xi120 net0423 net0274 net0173 NAND_PARAM size=1
xi118 net0449 net0420 net078 NAND_PARAM size=1
xi117 net0283 net0458 net079 NAND_PARAM size=1
xi116 net0423 net0274 net0174 NAND_PARAM size=1
xi114 net0449 net0420 net080 NAND_PARAM size=1
xi112 net0381 net0316 net0175 NAND_PARAM size=1
xi113 net0319 net0248 net081 NAND_PARAM size=1
xi109 net0319 net0458 net083 NAND_PARAM size=1
xi110 net0449 net0420 net082 NAND_PARAM size=1
xi108 net0381 net0316 net0176 NAND_PARAM size=1
xi106 net0449 net0420 net084 NAND_PARAM size=1
xi105 net0283 net0248 net085 NAND_PARAM size=1
xi104 net0381 net0316 net0177 NAND_PARAM size=1
xi102 net0449 net0420 net086 NAND_PARAM size=1
xi100 net0381 net0316 net0178 NAND_PARAM size=1
xi101 net0283 net0458 net0653 NAND_PARAM size=1
xi97 net0319 net0248 net089 NAND_PARAM size=1
xi98 net0449 net0420 net088 NAND_PARAM size=1
xi96 net0381 net0274 net0179 NAND_PARAM size=1
xi94 net0449 net0420 net090 NAND_PARAM size=1
xi93 net0319 net0458 net091 NAND_PARAM size=1
xi92 net0381 net0274 net0180 NAND_PARAM size=1
xi90 net0449 net0420 net092 NAND_PARAM size=1
xi88 net0381 net0274 net0181 NAND_PARAM size=1
xi89 net0283 net0248 net093 NAND_PARAM size=1
xi85 net0283 net0458 net095 NAND_PARAM size=1
xi86 net0449 net0420 net094 NAND_PARAM size=1
xi84 net0381 net0274 net0182 NAND_PARAM size=1
xi82 net0449 net0420 net096 NAND_PARAM size=1
xi81 net0319 net0248 net097 NAND_PARAM size=1
xi80 net0423 net0316 net0183 NAND_PARAM size=1
xi78 net0449 net0498 net0655 NAND_PARAM size=1
xi76 net0423 net0316 net0184 NAND_PARAM size=1
xi77 net0319 net0458 net099 NAND_PARAM size=1
xi73 net0283 net0248 net0101 NAND_PARAM size=1
xi74 net0449 net0498 net0100 NAND_PARAM size=1
xi72 net0423 net0316 net0185 NAND_PARAM size=1
xi70 net0449 net0498 net0102 NAND_PARAM size=1
xi69 net0283 net0458 net0103 NAND_PARAM size=1
xi68 net0423 net0316 net0186 NAND_PARAM size=1
xi66 net0449 net0498 net0104 NAND_PARAM size=1
xi64 net0423 net0274 net0187 NAND_PARAM size=1
xi65 net0319 net0248 net0105 NAND_PARAM size=1
xi61 net0319 net0458 net0107 NAND_PARAM size=1
xi62 net0449 net0498 net0106 NAND_PARAM size=1
xi60 net0423 net0274 net0188 NAND_PARAM size=1
xi58 net0449 net0498 net0108 NAND_PARAM size=1
xi57 net0283 net0248 net0109 NAND_PARAM size=1
xi56 net0423 net0274 net0189 NAND_PARAM size=1
xi54 net0449 net0498 net0110 NAND_PARAM size=1
xi52 net0423 net0274 net0190 NAND_PARAM size=1
xi53 net0283 net0458 net0111 NAND_PARAM size=1
xi49 net0319 net0248 net0113 NAND_PARAM size=1
xi50 net0449 net0498 net0112 NAND_PARAM size=1
xi48 net0381 net0316 net0191 NAND_PARAM size=1
xi46 net0449 net0498 net0114 NAND_PARAM size=1
xi45 net0319 net0458 net0115 NAND_PARAM size=1
xi44 net0381 net0316 net0192 NAND_PARAM size=1
xi42 net0449 net0498 net0116 NAND_PARAM size=1
xi40 net0381 net0316 net0193 NAND_PARAM size=1
xi41 net0283 net0248 net0117 NAND_PARAM size=1
xi37 net0283 net0458 net0119 NAND_PARAM size=1
xi38 net0449 net0498 net0118 NAND_PARAM size=1
xi36 net0381 net0316 net0194 NAND_PARAM size=1
xi34 net0449 net0498 net0120 NAND_PARAM size=1
xi33 net0319 net0248 net0121 NAND_PARAM size=1
xi32 net0381 net0274 net0195 NAND_PARAM size=1
xi30 net0449 net0498 net0122 NAND_PARAM size=1
xi28 net0381 net0274 net0196 NAND_PARAM size=1
xi29 net0319 net0458 net0123 NAND_PARAM size=1
xi25 net0283 net0248 net0125 NAND_PARAM size=1
xi26 net0449 net0498 net0124 NAND_PARAM size=1
xi24 net0381 net0274 net0197 NAND_PARAM size=1
xi21 net0283 net0458 net087 NAND_PARAM size=1
xi22 net0449 net0498 net0126 NAND_PARAM size=1
xi20 net0381 net0274 net86 NAND_PARAM size=1
xi18 net0449 net0498 net58 NAND_PARAM size=1
xi271 net02 net0135 net01 out<0> NOR3_PARAM size=1
xi267 net04 net0136 net03 out<1> NOR3_PARAM size=1
xi263 net06 net0137 net05 out<2> NOR3_PARAM size=1
xi259 net08 net0138 net07 out<3> NOR3_PARAM size=1
xi255 net010 net0139 net09 out<4> NOR3_PARAM size=1
xi251 net012 net0140 net011 out<5> NOR3_PARAM size=1
xi247 net014 net0141 net013 out<6> NOR3_PARAM size=1
xi243 net016 net0142 net015 out<7> NOR3_PARAM size=1
xi239 net018 net0143 net017 out<8> NOR3_PARAM size=1
xi235 net0654 net0144 net019 out<9> NOR3_PARAM size=1
xi231 net022 net0145 net021 out<10> NOR3_PARAM size=1
xi227 net024 net0146 net023 out<11> NOR3_PARAM size=1
xi223 net026 net0147 net025 out<12> NOR3_PARAM size=1
xi219 net028 net0148 net027 out<13> NOR3_PARAM size=1
xi215 net030 net0149 net029 out<14> NOR3_PARAM size=1
xi211 net032 net0150 net031 out<15> NOR3_PARAM size=1
xi207 net034 net0151 net033 out<16> NOR3_PARAM size=1
xi203 net036 net0152 net035 out<17> NOR3_PARAM size=1
xi199 net038 net0153 net037 out<18> NOR3_PARAM size=1
xi195 net040 net0154 net039 out<19> NOR3_PARAM size=1
xi191 net042 net0155 net041 out<20> NOR3_PARAM size=1
xi187 net044 net0156 net043 out<21> NOR3_PARAM size=1
xi183 net046 net0157 net045 out<22> NOR3_PARAM size=1
xi179 net048 net0158 net047 out<23> NOR3_PARAM size=1
xi175 net050 net0159 net049 out<24> NOR3_PARAM size=1
xi171 net052 net0160 net051 out<25> NOR3_PARAM size=1
xi167 net054 net0161 net053 out<26> NOR3_PARAM size=1
xi163 net056 net0162 net055 out<27> NOR3_PARAM size=1
xi159 net058 net0163 net057 out<28> NOR3_PARAM size=1
xi155 net060 net0164 net059 out<29> NOR3_PARAM size=1
xi151 net062 net0165 net061 out<30> NOR3_PARAM size=1
xi147 net064 net0166 net063 out<31> NOR3_PARAM size=1
xi143 net066 net0167 net065 out<32> NOR3_PARAM size=1
xi139 net068 net0168 net067 out<33> NOR3_PARAM size=1
xi135 net070 net0169 net069 out<34> NOR3_PARAM size=1
xi131 net072 net0170 net071 out<35> NOR3_PARAM size=1
xi127 net074 net0171 net073 out<36> NOR3_PARAM size=1
xi123 net076 net0172 net075 out<37> NOR3_PARAM size=1
xi119 net078 net0173 net077 out<38> NOR3_PARAM size=1
xi115 net080 net0174 net079 out<39> NOR3_PARAM size=1
xi111 net082 net0175 net081 out<40> NOR3_PARAM size=1
xi107 net084 net0176 net083 out<41> NOR3_PARAM size=1
xi103 net086 net0177 net085 out<42> NOR3_PARAM size=1
xi99 net088 net0178 net0653 out<43> NOR3_PARAM size=1
xi95 net090 net0179 net089 out<44> NOR3_PARAM size=1
xi91 net092 net0180 net091 out<45> NOR3_PARAM size=1
xi87 net094 net0181 net093 out<46> NOR3_PARAM size=1
xi19 net58 net86 net087 out<63> NOR3_PARAM size=1
xi83 net096 net0182 net095 out<47> NOR3_PARAM size=1
xi79 net0655 net0183 net097 out<48> NOR3_PARAM size=1
xi75 net0100 net0184 net099 out<49> NOR3_PARAM size=1
xi71 net0102 net0185 net0101 out<50> NOR3_PARAM size=1
xi67 net0104 net0186 net0103 out<51> NOR3_PARAM size=1
xi63 net0106 net0187 net0105 out<52> NOR3_PARAM size=1
xi59 net0108 net0188 net0107 out<53> NOR3_PARAM size=1
xi55 net0110 net0189 net0109 out<54> NOR3_PARAM size=1
xi51 net0112 net0190 net0111 out<55> NOR3_PARAM size=1
xi47 net0114 net0191 net0113 out<56> NOR3_PARAM size=1
xi43 net0116 net0192 net0115 out<57> NOR3_PARAM size=1
xi39 net0118 net0193 net0117 out<58> NOR3_PARAM size=1
xi35 net0120 net0194 net0119 out<59> NOR3_PARAM size=1
xi31 net0122 net0195 net0121 out<60> NOR3_PARAM size=1
xi27 net0124 net0196 net0123 out<61> NOR3_PARAM size=1
xi23 net0126 net0197 net0125 out<62> NOR3_PARAM size=1
xi5 in<5> net0305 inverter_param size=1
xi4 in<4> net0317 inverter_param size=1
xi3 in<3> net0355 inverter_param size=1
xi2 in<2> net0331 inverter_param size=1
xi1 in<1> net0359 inverter_param size=1
xi0 in<0> net0343 inverter_param size=1
xi11 net0305 net0449 inverter_param size=4
xi10 net0317 net0498 inverter_param size=4
xi9 net0355 net0381 inverter_param size=4
xi8 net0331 net0274 inverter_param size=4
xi7 net0359 net0283 inverter_param size=4
xi6 net0343 net0458 inverter_param size=4
xi12 net0458 net0248 inverter_param size=4
xi17 net0449 net0311 inverter_param size=4
xi16 net0498 net0420 inverter_param size=4
xi15 net0381 net0423 inverter_param size=4
xi14 net0274 net0316 inverter_param size=4
xi13 net0283 net0319 inverter_param size=4
.ends DECODER_6bit
** End of subcircuit definition.

** Library name: mycells45
** Cell name: register_sync_reset
** View name: schematic
.subckt register_sync_reset d q reset clk
xi0 net5 q clk register
xi4 d 0 net5 reset TG_mux2_1
.ends register_sync_reset
** End of subcircuit definition.

** Library name: mycells45
** Cell name: BUFFER_4bit_64
** View name: schematic
.subckt BUFFER_4bit_64 clk data<3> data<2> data<1> data<0> flip init init_data<255> init_data<254> init_data<253> init_data<252> init_data<251> init_data<250> init_data<249> init_data<248> init_data<247> init_data<246> init_data<245> init_data<244> init_data<243> init_data<242> init_data<241> init_data<240> init_data<239> init_data<238> init_data<237> init_data<236> init_data<235> init_data<234> init_data<233> init_data<232> init_data<231> init_data<230> init_data<229> init_data<228> init_data<227> init_data<226> init_data<225> init_data<224> init_data<223> init_data<222> init_data<221> init_data<220> init_data<219> init_data<218> init_data<217> init_data<216> init_data<215> init_data<214> init_data<213> init_data<212> init_data<211> init_data<210> init_data<209> init_data<208> init_data<207> init_data<206> init_data<205> init_data<204> init_data<203> init_data<202> init_data<201> init_data<200> init_data<199> init_data<198> init_data<197> init_data<196> init_data<195> init_data<194> init_data<193>
+init_data<192> init_data<191> init_data<190> init_data<189> init_data<188> init_data<187> init_data<186> init_data<185> init_data<184> init_data<183> init_data<182> init_data<181> init_data<180> init_data<179> init_data<178> init_data<177> init_data<176> init_data<175> init_data<174> init_data<173> init_data<172> init_data<171> init_data<170> init_data<169> init_data<168> init_data<167> init_data<166> init_data<165> init_data<164> init_data<163> init_data<162> init_data<161> init_data<160> init_data<159> init_data<158> init_data<157> init_data<156> init_data<155> init_data<154> init_data<153> init_data<152> init_data<151> init_data<150> init_data<149> init_data<148> init_data<147> init_data<146> init_data<145> init_data<144> init_data<143> init_data<142> init_data<141> init_data<140> init_data<139> init_data<138> init_data<137> init_data<136> init_data<135> init_data<134> init_data<133> init_data<132> init_data<131> init_data<130> init_data<129> init_data<128> init_data<127> init_data<126> init_data<125>
+init_data<124> init_data<123> init_data<122> init_data<121> init_data<120> init_data<119> init_data<118> init_data<117> init_data<116> init_data<115> init_data<114> init_data<113> init_data<112> init_data<111> init_data<110> init_data<109> init_data<108> init_data<107> init_data<106> init_data<105> init_data<104> init_data<103> init_data<102> init_data<101> init_data<100> init_data<99> init_data<98> init_data<97> init_data<96> init_data<95> init_data<94> init_data<93> init_data<92> init_data<91> init_data<90> init_data<89> init_data<88> init_data<87> init_data<86> init_data<85> init_data<84> init_data<83> init_data<82> init_data<81> init_data<80> init_data<79> init_data<78> init_data<77> init_data<76> init_data<75> init_data<74> init_data<73> init_data<72> init_data<71> init_data<70> init_data<69> init_data<68> init_data<67> init_data<66> init_data<65> init_data<64> init_data<63> init_data<62> init_data<61> init_data<60> init_data<59> init_data<58> init_data<57> init_data<56> init_data<55> init_data<54>
+init_data<53> init_data<52> init_data<51> init_data<50> init_data<49> init_data<48> init_data<47> init_data<46> init_data<45> init_data<44> init_data<43> init_data<42> init_data<41> init_data<40> init_data<39> init_data<38> init_data<37> init_data<36> init_data<35> init_data<34> init_data<33> init_data<32> init_data<31> init_data<30> init_data<29> init_data<28> init_data<27> init_data<26> init_data<25> init_data<24> init_data<23> init_data<22> init_data<21> init_data<20> init_data<19> init_data<18> init_data<17> init_data<16> init_data<15> init_data<14> init_data<13> init_data<12> init_data<11> init_data<10> init_data<9> init_data<8> init_data<7> init_data<6> init_data<5> init_data<4> init_data<3> init_data<2> init_data<1> init_data<0> out<255> out<254> out<253> out<252> out<251> out<250> out<249> out<248> out<247> out<246> out<245> out<244> out<243> out<242> out<241> out<240> out<239> out<238> out<237> out<236> out<235> out<234> out<233> out<232> out<231> out<230> out<229> out<228> out<227> out<226>
+out<225> out<224> out<223> out<222> out<221> out<220> out<219> out<218> out<217> out<216> out<215> out<214> out<213> out<212> out<211> out<210> out<209> out<208> out<207> out<206> out<205> out<204> out<203> out<202> out<201> out<200> out<199> out<198> out<197> out<196> out<195> out<194> out<193> out<192> out<191> out<190> out<189> out<188> out<187> out<186> out<185> out<184> out<183> out<182> out<181> out<180> out<179> out<178> out<177> out<176> out<175> out<174> out<173> out<172> out<171> out<170> out<169> out<168> out<167> out<166> out<165> out<164> out<163> out<162> out<161> out<160> out<159> out<158> out<157> out<156> out<155> out<154> out<153> out<152> out<151> out<150> out<149> out<148> out<147> out<146> out<145> out<144> out<143> out<142> out<141> out<140> out<139> out<138> out<137> out<136> out<135> out<134> out<133> out<132> out<131> out<130> out<129> out<128> out<127> out<126> out<125> out<124> out<123> out<122> out<121> out<120> out<119> out<118> out<117> out<116> out<115> out<114> out<113>
+out<112> out<111> out<110> out<109> out<108> out<107> out<106> out<105> out<104> out<103> out<102> out<101> out<100> out<99> out<98> out<97> out<96> out<95> out<94> out<93> out<92> out<91> out<90> out<89> out<88> out<87> out<86> out<85> out<84> out<83> out<82> out<81> out<80> out<79> out<78> out<77> out<76> out<75> out<74> out<73> out<72> out<71> out<70> out<69> out<68> out<67> out<66> out<65> out<64> out<63> out<62> out<61> out<60> out<59> out<58> out<57> out<56> out<55> out<54> out<53> out<52> out<51> out<50> out<49> out<48> out<47> out<46> out<45> out<44> out<43> out<42> out<41> out<40> out<39> out<38> out<37> out<36> out<35> out<34> out<33> out<32> out<31> out<30> out<29> out<28> out<27> out<26> out<25> out<24> out<23> out<22> out<21> out<20> out<19> out<18> out<17> out<16> out<15> out<14> out<13> out<12> out<11> out<10> out<9> out<8> out<7> out<6> out<5> out<4> out<3> out<2> out<1> out<0> write_block<5> write_block<4> write_block<3> write_block<2> write_block<1> write_block<0>
xi18<63> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<63> net037<0> net037<1> net037<2> net037<3> REG_4bit
xi18<62> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<62> net037<4> net037<5> net037<6> net037<7> REG_4bit
xi18<61> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<61> net037<8> net037<9> net037<10> net037<11> REG_4bit
xi18<60> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<60> net037<12> net037<13> net037<14> net037<15> REG_4bit
xi18<59> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<59> net037<16> net037<17> net037<18> net037<19> REG_4bit
xi18<58> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<58> net037<20> net037<21> net037<22> net037<23> REG_4bit
xi18<57> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<57> net037<24> net037<25> net037<26> net037<27> REG_4bit
xi18<56> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<56> net037<28> net037<29> net037<30> net037<31> REG_4bit
xi18<55> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<55> net037<32> net037<33> net037<34> net037<35> REG_4bit
xi18<54> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<54> net037<36> net037<37> net037<38> net037<39> REG_4bit
xi18<53> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<53> net037<40> net037<41> net037<42> net037<43> REG_4bit
xi18<52> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<52> net037<44> net037<45> net037<46> net037<47> REG_4bit
xi18<51> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<51> net037<48> net037<49> net037<50> net037<51> REG_4bit
xi18<50> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<50> net037<52> net037<53> net037<54> net037<55> REG_4bit
xi18<49> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<49> net037<56> net037<57> net037<58> net037<59> REG_4bit
xi18<48> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<48> net037<60> net037<61> net037<62> net037<63> REG_4bit
xi18<47> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<47> net037<64> net037<65> net037<66> net037<67> REG_4bit
xi18<46> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<46> net037<68> net037<69> net037<70> net037<71> REG_4bit
xi18<45> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<45> net037<72> net037<73> net037<74> net037<75> REG_4bit
xi18<44> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<44> net037<76> net037<77> net037<78> net037<79> REG_4bit
xi18<43> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<43> net037<80> net037<81> net037<82> net037<83> REG_4bit
xi18<42> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<42> net037<84> net037<85> net037<86> net037<87> REG_4bit
xi18<41> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<41> net037<88> net037<89> net037<90> net037<91> REG_4bit
xi18<40> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<40> net037<92> net037<93> net037<94> net037<95> REG_4bit
xi18<39> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<39> net037<96> net037<97> net037<98> net037<99> REG_4bit
xi18<38> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<38> net037<100> net037<101> net037<102> net037<103> REG_4bit
xi18<37> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<37> net037<104> net037<105> net037<106> net037<107> REG_4bit
xi18<36> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<36> net037<108> net037<109> net037<110> net037<111> REG_4bit
xi18<35> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<35> net037<112> net037<113> net037<114> net037<115> REG_4bit
xi18<34> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<34> net037<116> net037<117> net037<118> net037<119> REG_4bit
xi18<33> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<33> net037<120> net037<121> net037<122> net037<123> REG_4bit
xi18<32> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<32> net037<124> net037<125> net037<126> net037<127> REG_4bit
xi18<31> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<31> net037<128> net037<129> net037<130> net037<131> REG_4bit
xi18<30> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<30> net037<132> net037<133> net037<134> net037<135> REG_4bit
xi18<29> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<29> net037<136> net037<137> net037<138> net037<139> REG_4bit
xi18<28> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<28> net037<140> net037<141> net037<142> net037<143> REG_4bit
xi18<27> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<27> net037<144> net037<145> net037<146> net037<147> REG_4bit
xi18<26> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<26> net037<148> net037<149> net037<150> net037<151> REG_4bit
xi18<25> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<25> net037<152> net037<153> net037<154> net037<155> REG_4bit
xi18<24> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<24> net037<156> net037<157> net037<158> net037<159> REG_4bit
xi18<23> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<23> net037<160> net037<161> net037<162> net037<163> REG_4bit
xi18<22> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<22> net037<164> net037<165> net037<166> net037<167> REG_4bit
xi18<21> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<21> net037<168> net037<169> net037<170> net037<171> REG_4bit
xi18<20> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<20> net037<172> net037<173> net037<174> net037<175> REG_4bit
xi18<19> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<19> net037<176> net037<177> net037<178> net037<179> REG_4bit
xi18<18> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<18> net037<180> net037<181> net037<182> net037<183> REG_4bit
xi18<17> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<17> net037<184> net037<185> net037<186> net037<187> REG_4bit
xi18<16> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<16> net037<188> net037<189> net037<190> net037<191> REG_4bit
xi18<15> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<15> net037<192> net037<193> net037<194> net037<195> REG_4bit
xi18<14> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<14> net037<196> net037<197> net037<198> net037<199> REG_4bit
xi18<13> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<13> net037<200> net037<201> net037<202> net037<203> REG_4bit
xi18<12> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<12> net037<204> net037<205> net037<206> net037<207> REG_4bit
xi18<11> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<11> net037<208> net037<209> net037<210> net037<211> REG_4bit
xi18<10> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<10> net037<212> net037<213> net037<214> net037<215> REG_4bit
xi18<9> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<9> net037<216> net037<217> net037<218> net037<219> REG_4bit
xi18<8> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<8> net037<220> net037<221> net037<222> net037<223> REG_4bit
xi18<7> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<7> net037<224> net037<225> net037<226> net037<227> REG_4bit
xi18<6> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<6> net037<228> net037<229> net037<230> net037<231> REG_4bit
xi18<5> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<5> net037<232> net037<233> net037<234> net037<235> REG_4bit
xi18<4> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<4> net037<236> net037<237> net037<238> net037<239> REG_4bit
xi18<3> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<3> net037<240> net037<241> net037<242> net037<243> REG_4bit
xi18<2> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<2> net037<244> net037<245> net037<246> net037<247> REG_4bit
xi18<1> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<1> net037<248> net037<249> net037<250> net037<251> REG_4bit
xi18<0> clk data_buf<3> data_buf<2> data_buf<1> data_buf<0> en1<0> net037<252> net037<253> net037<254> net037<255> REG_4bit
xi7<63> clk net036<0> net036<1> net036<2> net036<3> en0<63> net038<0> net038<1> net038<2> net038<3> REG_4bit
xi7<62> clk net036<4> net036<5> net036<6> net036<7> en0<62> net038<4> net038<5> net038<6> net038<7> REG_4bit
xi7<61> clk net036<8> net036<9> net036<10> net036<11> en0<61> net038<8> net038<9> net038<10> net038<11> REG_4bit
xi7<60> clk net036<12> net036<13> net036<14> net036<15> en0<60> net038<12> net038<13> net038<14> net038<15> REG_4bit
xi7<59> clk net036<16> net036<17> net036<18> net036<19> en0<59> net038<16> net038<17> net038<18> net038<19> REG_4bit
xi7<58> clk net036<20> net036<21> net036<22> net036<23> en0<58> net038<20> net038<21> net038<22> net038<23> REG_4bit
xi7<57> clk net036<24> net036<25> net036<26> net036<27> en0<57> net038<24> net038<25> net038<26> net038<27> REG_4bit
xi7<56> clk net036<28> net036<29> net036<30> net036<31> en0<56> net038<28> net038<29> net038<30> net038<31> REG_4bit
xi7<55> clk net036<32> net036<33> net036<34> net036<35> en0<55> net038<32> net038<33> net038<34> net038<35> REG_4bit
xi7<54> clk net036<36> net036<37> net036<38> net036<39> en0<54> net038<36> net038<37> net038<38> net038<39> REG_4bit
xi7<53> clk net036<40> net036<41> net036<42> net036<43> en0<53> net038<40> net038<41> net038<42> net038<43> REG_4bit
xi7<52> clk net036<44> net036<45> net036<46> net036<47> en0<52> net038<44> net038<45> net038<46> net038<47> REG_4bit
xi7<51> clk net036<48> net036<49> net036<50> net036<51> en0<51> net038<48> net038<49> net038<50> net038<51> REG_4bit
xi7<50> clk net036<52> net036<53> net036<54> net036<55> en0<50> net038<52> net038<53> net038<54> net038<55> REG_4bit
xi7<49> clk net036<56> net036<57> net036<58> net036<59> en0<49> net038<56> net038<57> net038<58> net038<59> REG_4bit
xi7<48> clk net036<60> net036<61> net036<62> net036<63> en0<48> net038<60> net038<61> net038<62> net038<63> REG_4bit
xi7<47> clk net036<64> net036<65> net036<66> net036<67> en0<47> net038<64> net038<65> net038<66> net038<67> REG_4bit
xi7<46> clk net036<68> net036<69> net036<70> net036<71> en0<46> net038<68> net038<69> net038<70> net038<71> REG_4bit
xi7<45> clk net036<72> net036<73> net036<74> net036<75> en0<45> net038<72> net038<73> net038<74> net038<75> REG_4bit
xi7<44> clk net036<76> net036<77> net036<78> net036<79> en0<44> net038<76> net038<77> net038<78> net038<79> REG_4bit
xi7<43> clk net036<80> net036<81> net036<82> net036<83> en0<43> net038<80> net038<81> net038<82> net038<83> REG_4bit
xi7<42> clk net036<84> net036<85> net036<86> net036<87> en0<42> net038<84> net038<85> net038<86> net038<87> REG_4bit
xi7<41> clk net036<88> net036<89> net036<90> net036<91> en0<41> net038<88> net038<89> net038<90> net038<91> REG_4bit
xi7<40> clk net036<92> net036<93> net036<94> net036<95> en0<40> net038<92> net038<93> net038<94> net038<95> REG_4bit
xi7<39> clk net036<96> net036<97> net036<98> net036<99> en0<39> net038<96> net038<97> net038<98> net038<99> REG_4bit
xi7<38> clk net036<100> net036<101> net036<102> net036<103> en0<38> net038<100> net038<101> net038<102> net038<103> REG_4bit
xi7<37> clk net036<104> net036<105> net036<106> net036<107> en0<37> net038<104> net038<105> net038<106> net038<107> REG_4bit
xi7<36> clk net036<108> net036<109> net036<110> net036<111> en0<36> net038<108> net038<109> net038<110> net038<111> REG_4bit
xi7<35> clk net036<112> net036<113> net036<114> net036<115> en0<35> net038<112> net038<113> net038<114> net038<115> REG_4bit
xi7<34> clk net036<116> net036<117> net036<118> net036<119> en0<34> net038<116> net038<117> net038<118> net038<119> REG_4bit
xi7<33> clk net036<120> net036<121> net036<122> net036<123> en0<33> net038<120> net038<121> net038<122> net038<123> REG_4bit
xi7<32> clk net036<124> net036<125> net036<126> net036<127> en0<32> net038<124> net038<125> net038<126> net038<127> REG_4bit
xi7<31> clk net036<128> net036<129> net036<130> net036<131> en0<31> net038<128> net038<129> net038<130> net038<131> REG_4bit
xi7<30> clk net036<132> net036<133> net036<134> net036<135> en0<30> net038<132> net038<133> net038<134> net038<135> REG_4bit
xi7<29> clk net036<136> net036<137> net036<138> net036<139> en0<29> net038<136> net038<137> net038<138> net038<139> REG_4bit
xi7<28> clk net036<140> net036<141> net036<142> net036<143> en0<28> net038<140> net038<141> net038<142> net038<143> REG_4bit
xi7<27> clk net036<144> net036<145> net036<146> net036<147> en0<27> net038<144> net038<145> net038<146> net038<147> REG_4bit
xi7<26> clk net036<148> net036<149> net036<150> net036<151> en0<26> net038<148> net038<149> net038<150> net038<151> REG_4bit
xi7<25> clk net036<152> net036<153> net036<154> net036<155> en0<25> net038<152> net038<153> net038<154> net038<155> REG_4bit
xi7<24> clk net036<156> net036<157> net036<158> net036<159> en0<24> net038<156> net038<157> net038<158> net038<159> REG_4bit
xi7<23> clk net036<160> net036<161> net036<162> net036<163> en0<23> net038<160> net038<161> net038<162> net038<163> REG_4bit
xi7<22> clk net036<164> net036<165> net036<166> net036<167> en0<22> net038<164> net038<165> net038<166> net038<167> REG_4bit
xi7<21> clk net036<168> net036<169> net036<170> net036<171> en0<21> net038<168> net038<169> net038<170> net038<171> REG_4bit
xi7<20> clk net036<172> net036<173> net036<174> net036<175> en0<20> net038<172> net038<173> net038<174> net038<175> REG_4bit
xi7<19> clk net036<176> net036<177> net036<178> net036<179> en0<19> net038<176> net038<177> net038<178> net038<179> REG_4bit
xi7<18> clk net036<180> net036<181> net036<182> net036<183> en0<18> net038<180> net038<181> net038<182> net038<183> REG_4bit
xi7<17> clk net036<184> net036<185> net036<186> net036<187> en0<17> net038<184> net038<185> net038<186> net038<187> REG_4bit
xi7<16> clk net036<188> net036<189> net036<190> net036<191> en0<16> net038<188> net038<189> net038<190> net038<191> REG_4bit
xi7<15> clk net036<192> net036<193> net036<194> net036<195> en0<15> net038<192> net038<193> net038<194> net038<195> REG_4bit
xi7<14> clk net036<196> net036<197> net036<198> net036<199> en0<14> net038<196> net038<197> net038<198> net038<199> REG_4bit
xi7<13> clk net036<200> net036<201> net036<202> net036<203> en0<13> net038<200> net038<201> net038<202> net038<203> REG_4bit
xi7<12> clk net036<204> net036<205> net036<206> net036<207> en0<12> net038<204> net038<205> net038<206> net038<207> REG_4bit
xi7<11> clk net036<208> net036<209> net036<210> net036<211> en0<11> net038<208> net038<209> net038<210> net038<211> REG_4bit
xi7<10> clk net036<212> net036<213> net036<214> net036<215> en0<10> net038<212> net038<213> net038<214> net038<215> REG_4bit
xi7<9> clk net036<216> net036<217> net036<218> net036<219> en0<9> net038<216> net038<217> net038<218> net038<219> REG_4bit
xi7<8> clk net036<220> net036<221> net036<222> net036<223> en0<8> net038<220> net038<221> net038<222> net038<223> REG_4bit
xi7<7> clk net036<224> net036<225> net036<226> net036<227> en0<7> net038<224> net038<225> net038<226> net038<227> REG_4bit
xi7<6> clk net036<228> net036<229> net036<230> net036<231> en0<6> net038<228> net038<229> net038<230> net038<231> REG_4bit
xi7<5> clk net036<232> net036<233> net036<234> net036<235> en0<5> net038<232> net038<233> net038<234> net038<235> REG_4bit
xi7<4> clk net036<236> net036<237> net036<238> net036<239> en0<4> net038<236> net038<237> net038<238> net038<239> REG_4bit
xi7<3> clk net036<240> net036<241> net036<242> net036<243> en0<3> net038<240> net038<241> net038<242> net038<243> REG_4bit
xi7<2> clk net036<244> net036<245> net036<246> net036<247> en0<2> net038<244> net038<245> net038<246> net038<247> REG_4bit
xi7<1> clk net036<248> net036<249> net036<250> net036<251> en0<1> net038<248> net038<249> net038<250> net038<251> REG_4bit
xi7<0> clk net036<252> net036<253> net036<254> net036<255> en0<0> net038<252> net038<253> net038<254> net038<255> REG_4bit
xi0 net08 net012 inverter_param size=1
xi9 net020 init_buf inverter_param size=16
xi10 net040 net020 inverter_param size=16
xi11 net039 net040 inverter_param size=4
xi12 init net039 inverter_param size=1
xi17<3> data<3> net030<0> inverter_param size=1
xi17<2> data<2> net030<1> inverter_param size=1
xi17<1> data<1> net030<2> inverter_param size=1
xi17<0> data<0> net030<3> inverter_param size=1
xi16<3> net030<0> net031<0> inverter_param size=1
xi16<2> net030<1> net031<1> inverter_param size=1
xi16<1> net030<2> net031<2> inverter_param size=1
xi16<0> net030<3> net031<3> inverter_param size=1
xi14<3> net032<0> data_buf<3> inverter_param size=16
xi14<2> net032<1> data_buf<2> inverter_param size=16
xi14<1> net032<2> data_buf<1> inverter_param size=16
xi14<0> net032<3> data_buf<0> inverter_param size=16
xi15<3> net031<0> net032<0> inverter_param size=4
xi15<2> net031<1> net032<1> inverter_param size=4
xi15<1> net031<2> net032<2> inverter_param size=4
xi15<0> net031<3> net032<3> inverter_param size=4
xi22<63> net022<0> net035<0> inverter_param size=1
xi22<62> net022<1> net035<1> inverter_param size=1
xi22<61> net022<2> net035<2> inverter_param size=1
xi22<60> net022<3> net035<3> inverter_param size=1
xi22<59> net022<4> net035<4> inverter_param size=1
xi22<58> net022<5> net035<5> inverter_param size=1
xi22<57> net022<6> net035<6> inverter_param size=1
xi22<56> net022<7> net035<7> inverter_param size=1
xi22<55> net022<8> net035<8> inverter_param size=1
xi22<54> net022<9> net035<9> inverter_param size=1
xi22<53> net022<10> net035<10> inverter_param size=1
xi22<52> net022<11> net035<11> inverter_param size=1
xi22<51> net022<12> net035<12> inverter_param size=1
xi22<50> net022<13> net035<13> inverter_param size=1
xi22<49> net022<14> net035<14> inverter_param size=1
xi22<48> net022<15> net035<15> inverter_param size=1
xi22<47> net022<16> net035<16> inverter_param size=1
xi22<46> net022<17> net035<17> inverter_param size=1
xi22<45> net022<18> net035<18> inverter_param size=1
xi22<44> net022<19> net035<19> inverter_param size=1
xi22<43> net022<20> net035<20> inverter_param size=1
xi22<42> net022<21> net035<21> inverter_param size=1
xi22<41> net022<22> net035<22> inverter_param size=1
xi22<40> net022<23> net035<23> inverter_param size=1
xi22<39> net022<24> net035<24> inverter_param size=1
xi22<38> net022<25> net035<25> inverter_param size=1
xi22<37> net022<26> net035<26> inverter_param size=1
xi22<36> net022<27> net035<27> inverter_param size=1
xi22<35> net022<28> net035<28> inverter_param size=1
xi22<34> net022<29> net035<29> inverter_param size=1
xi22<33> net022<30> net035<30> inverter_param size=1
xi22<32> net022<31> net035<31> inverter_param size=1
xi22<31> net022<32> net035<32> inverter_param size=1
xi22<30> net022<33> net035<33> inverter_param size=1
xi22<29> net022<34> net035<34> inverter_param size=1
xi22<28> net022<35> net035<35> inverter_param size=1
xi22<27> net022<36> net035<36> inverter_param size=1
xi22<26> net022<37> net035<37> inverter_param size=1
xi22<25> net022<38> net035<38> inverter_param size=1
xi22<24> net022<39> net035<39> inverter_param size=1
xi22<23> net022<40> net035<40> inverter_param size=1
xi22<22> net022<41> net035<41> inverter_param size=1
xi22<21> net022<42> net035<42> inverter_param size=1
xi22<20> net022<43> net035<43> inverter_param size=1
xi22<19> net022<44> net035<44> inverter_param size=1
xi22<18> net022<45> net035<45> inverter_param size=1
xi22<17> net022<46> net035<46> inverter_param size=1
xi22<16> net022<47> net035<47> inverter_param size=1
xi22<15> net022<48> net035<48> inverter_param size=1
xi22<14> net022<49> net035<49> inverter_param size=1
xi22<13> net022<50> net035<50> inverter_param size=1
xi22<12> net022<51> net035<51> inverter_param size=1
xi22<11> net022<52> net035<52> inverter_param size=1
xi22<10> net022<53> net035<53> inverter_param size=1
xi22<9> net022<54> net035<54> inverter_param size=1
xi22<8> net022<55> net035<55> inverter_param size=1
xi22<7> net022<56> net035<56> inverter_param size=1
xi22<6> net022<57> net035<57> inverter_param size=1
xi22<5> net022<58> net035<58> inverter_param size=1
xi22<4> net022<59> net035<59> inverter_param size=1
xi22<3> net022<60> net035<60> inverter_param size=1
xi22<2> net022<61> net035<61> inverter_param size=1
xi22<1> net022<62> net035<62> inverter_param size=1
xi22<0> net022<63> net035<63> inverter_param size=1
xi25<63> net021<0> en1<63> inverter_param size=1
xi25<62> net021<1> en1<62> inverter_param size=1
xi25<61> net021<2> en1<61> inverter_param size=1
xi25<60> net021<3> en1<60> inverter_param size=1
xi25<59> net021<4> en1<59> inverter_param size=1
xi25<58> net021<5> en1<58> inverter_param size=1
xi25<57> net021<6> en1<57> inverter_param size=1
xi25<56> net021<7> en1<56> inverter_param size=1
xi25<55> net021<8> en1<55> inverter_param size=1
xi25<54> net021<9> en1<54> inverter_param size=1
xi25<53> net021<10> en1<53> inverter_param size=1
xi25<52> net021<11> en1<52> inverter_param size=1
xi25<51> net021<12> en1<51> inverter_param size=1
xi25<50> net021<13> en1<50> inverter_param size=1
xi25<49> net021<14> en1<49> inverter_param size=1
xi25<48> net021<15> en1<48> inverter_param size=1
xi25<47> net021<16> en1<47> inverter_param size=1
xi25<46> net021<17> en1<46> inverter_param size=1
xi25<45> net021<18> en1<45> inverter_param size=1
xi25<44> net021<19> en1<44> inverter_param size=1
xi25<43> net021<20> en1<43> inverter_param size=1
xi25<42> net021<21> en1<42> inverter_param size=1
xi25<41> net021<22> en1<41> inverter_param size=1
xi25<40> net021<23> en1<40> inverter_param size=1
xi25<39> net021<24> en1<39> inverter_param size=1
xi25<38> net021<25> en1<38> inverter_param size=1
xi25<37> net021<26> en1<37> inverter_param size=1
xi25<36> net021<27> en1<36> inverter_param size=1
xi25<35> net021<28> en1<35> inverter_param size=1
xi25<34> net021<29> en1<34> inverter_param size=1
xi25<33> net021<30> en1<33> inverter_param size=1
xi25<32> net021<31> en1<32> inverter_param size=1
xi25<31> net021<32> en1<31> inverter_param size=1
xi25<30> net021<33> en1<30> inverter_param size=1
xi25<29> net021<34> en1<29> inverter_param size=1
xi25<28> net021<35> en1<28> inverter_param size=1
xi25<27> net021<36> en1<27> inverter_param size=1
xi25<26> net021<37> en1<26> inverter_param size=1
xi25<25> net021<38> en1<25> inverter_param size=1
xi25<24> net021<39> en1<24> inverter_param size=1
xi25<23> net021<40> en1<23> inverter_param size=1
xi25<22> net021<41> en1<22> inverter_param size=1
xi25<21> net021<42> en1<21> inverter_param size=1
xi25<20> net021<43> en1<20> inverter_param size=1
xi25<19> net021<44> en1<19> inverter_param size=1
xi25<18> net021<45> en1<18> inverter_param size=1
xi25<17> net021<46> en1<17> inverter_param size=1
xi25<16> net021<47> en1<16> inverter_param size=1
xi25<15> net021<48> en1<15> inverter_param size=1
xi25<14> net021<49> en1<14> inverter_param size=1
xi25<13> net021<50> en1<13> inverter_param size=1
xi25<12> net021<51> en1<12> inverter_param size=1
xi25<11> net021<52> en1<11> inverter_param size=1
xi25<10> net021<53> en1<10> inverter_param size=1
xi25<9> net021<54> en1<9> inverter_param size=1
xi25<8> net021<55> en1<8> inverter_param size=1
xi25<7> net021<56> en1<7> inverter_param size=1
xi25<6> net021<57> en1<6> inverter_param size=1
xi25<5> net021<58> en1<5> inverter_param size=1
xi25<4> net021<59> en1<4> inverter_param size=1
xi25<3> net021<60> en1<3> inverter_param size=1
xi25<2> net021<61> en1<2> inverter_param size=1
xi25<1> net021<62> en1<1> inverter_param size=1
xi25<0> net021<63> en1<0> inverter_param size=1
xi1 write1 write0 inverter_param size=32
xi2 net14 write1 inverter_param size=16
xi3 net15 net14 inverter_param size=4
xi4 net08 net15 inverter_param size=1
xi13<255> net038<0> net037<0> out<255> write0 TG_mux2_1
xi13<254> net038<1> net037<1> out<254> write0 TG_mux2_1
xi13<253> net038<2> net037<2> out<253> write0 TG_mux2_1
xi13<252> net038<3> net037<3> out<252> write0 TG_mux2_1
xi13<251> net038<4> net037<4> out<251> write0 TG_mux2_1
xi13<250> net038<5> net037<5> out<250> write0 TG_mux2_1
xi13<249> net038<6> net037<6> out<249> write0 TG_mux2_1
xi13<248> net038<7> net037<7> out<248> write0 TG_mux2_1
xi13<247> net038<8> net037<8> out<247> write0 TG_mux2_1
xi13<246> net038<9> net037<9> out<246> write0 TG_mux2_1
xi13<245> net038<10> net037<10> out<245> write0 TG_mux2_1
xi13<244> net038<11> net037<11> out<244> write0 TG_mux2_1
xi13<243> net038<12> net037<12> out<243> write0 TG_mux2_1
xi13<242> net038<13> net037<13> out<242> write0 TG_mux2_1
xi13<241> net038<14> net037<14> out<241> write0 TG_mux2_1
xi13<240> net038<15> net037<15> out<240> write0 TG_mux2_1
xi13<239> net038<16> net037<16> out<239> write0 TG_mux2_1
xi13<238> net038<17> net037<17> out<238> write0 TG_mux2_1
xi13<237> net038<18> net037<18> out<237> write0 TG_mux2_1
xi13<236> net038<19> net037<19> out<236> write0 TG_mux2_1
xi13<235> net038<20> net037<20> out<235> write0 TG_mux2_1
xi13<234> net038<21> net037<21> out<234> write0 TG_mux2_1
xi13<233> net038<22> net037<22> out<233> write0 TG_mux2_1
xi13<232> net038<23> net037<23> out<232> write0 TG_mux2_1
xi13<231> net038<24> net037<24> out<231> write0 TG_mux2_1
xi13<230> net038<25> net037<25> out<230> write0 TG_mux2_1
xi13<229> net038<26> net037<26> out<229> write0 TG_mux2_1
xi13<228> net038<27> net037<27> out<228> write0 TG_mux2_1
xi13<227> net038<28> net037<28> out<227> write0 TG_mux2_1
xi13<226> net038<29> net037<29> out<226> write0 TG_mux2_1
xi13<225> net038<30> net037<30> out<225> write0 TG_mux2_1
xi13<224> net038<31> net037<31> out<224> write0 TG_mux2_1
xi13<223> net038<32> net037<32> out<223> write0 TG_mux2_1
xi13<222> net038<33> net037<33> out<222> write0 TG_mux2_1
xi13<221> net038<34> net037<34> out<221> write0 TG_mux2_1
xi13<220> net038<35> net037<35> out<220> write0 TG_mux2_1
xi13<219> net038<36> net037<36> out<219> write0 TG_mux2_1
xi13<218> net038<37> net037<37> out<218> write0 TG_mux2_1
xi13<217> net038<38> net037<38> out<217> write0 TG_mux2_1
xi13<216> net038<39> net037<39> out<216> write0 TG_mux2_1
xi13<215> net038<40> net037<40> out<215> write0 TG_mux2_1
xi13<214> net038<41> net037<41> out<214> write0 TG_mux2_1
xi13<213> net038<42> net037<42> out<213> write0 TG_mux2_1
xi13<212> net038<43> net037<43> out<212> write0 TG_mux2_1
xi13<211> net038<44> net037<44> out<211> write0 TG_mux2_1
xi13<210> net038<45> net037<45> out<210> write0 TG_mux2_1
xi13<209> net038<46> net037<46> out<209> write0 TG_mux2_1
xi13<208> net038<47> net037<47> out<208> write0 TG_mux2_1
xi13<207> net038<48> net037<48> out<207> write0 TG_mux2_1
xi13<206> net038<49> net037<49> out<206> write0 TG_mux2_1
xi13<205> net038<50> net037<50> out<205> write0 TG_mux2_1
xi13<204> net038<51> net037<51> out<204> write0 TG_mux2_1
xi13<203> net038<52> net037<52> out<203> write0 TG_mux2_1
xi13<202> net038<53> net037<53> out<202> write0 TG_mux2_1
xi13<201> net038<54> net037<54> out<201> write0 TG_mux2_1
xi13<200> net038<55> net037<55> out<200> write0 TG_mux2_1
xi13<199> net038<56> net037<56> out<199> write0 TG_mux2_1
xi13<198> net038<57> net037<57> out<198> write0 TG_mux2_1
xi13<197> net038<58> net037<58> out<197> write0 TG_mux2_1
xi13<196> net038<59> net037<59> out<196> write0 TG_mux2_1
xi13<195> net038<60> net037<60> out<195> write0 TG_mux2_1
xi13<194> net038<61> net037<61> out<194> write0 TG_mux2_1
xi13<193> net038<62> net037<62> out<193> write0 TG_mux2_1
xi13<192> net038<63> net037<63> out<192> write0 TG_mux2_1
xi13<191> net038<64> net037<64> out<191> write0 TG_mux2_1
xi13<190> net038<65> net037<65> out<190> write0 TG_mux2_1
xi13<189> net038<66> net037<66> out<189> write0 TG_mux2_1
xi13<188> net038<67> net037<67> out<188> write0 TG_mux2_1
xi13<187> net038<68> net037<68> out<187> write0 TG_mux2_1
xi13<186> net038<69> net037<69> out<186> write0 TG_mux2_1
xi13<185> net038<70> net037<70> out<185> write0 TG_mux2_1
xi13<184> net038<71> net037<71> out<184> write0 TG_mux2_1
xi13<183> net038<72> net037<72> out<183> write0 TG_mux2_1
xi13<182> net038<73> net037<73> out<182> write0 TG_mux2_1
xi13<181> net038<74> net037<74> out<181> write0 TG_mux2_1
xi13<180> net038<75> net037<75> out<180> write0 TG_mux2_1
xi13<179> net038<76> net037<76> out<179> write0 TG_mux2_1
xi13<178> net038<77> net037<77> out<178> write0 TG_mux2_1
xi13<177> net038<78> net037<78> out<177> write0 TG_mux2_1
xi13<176> net038<79> net037<79> out<176> write0 TG_mux2_1
xi13<175> net038<80> net037<80> out<175> write0 TG_mux2_1
xi13<174> net038<81> net037<81> out<174> write0 TG_mux2_1
xi13<173> net038<82> net037<82> out<173> write0 TG_mux2_1
xi13<172> net038<83> net037<83> out<172> write0 TG_mux2_1
xi13<171> net038<84> net037<84> out<171> write0 TG_mux2_1
xi13<170> net038<85> net037<85> out<170> write0 TG_mux2_1
xi13<169> net038<86> net037<86> out<169> write0 TG_mux2_1
xi13<168> net038<87> net037<87> out<168> write0 TG_mux2_1
xi13<167> net038<88> net037<88> out<167> write0 TG_mux2_1
xi13<166> net038<89> net037<89> out<166> write0 TG_mux2_1
xi13<165> net038<90> net037<90> out<165> write0 TG_mux2_1
xi13<164> net038<91> net037<91> out<164> write0 TG_mux2_1
xi13<163> net038<92> net037<92> out<163> write0 TG_mux2_1
xi13<162> net038<93> net037<93> out<162> write0 TG_mux2_1
xi13<161> net038<94> net037<94> out<161> write0 TG_mux2_1
xi13<160> net038<95> net037<95> out<160> write0 TG_mux2_1
xi13<159> net038<96> net037<96> out<159> write0 TG_mux2_1
xi13<158> net038<97> net037<97> out<158> write0 TG_mux2_1
xi13<157> net038<98> net037<98> out<157> write0 TG_mux2_1
xi13<156> net038<99> net037<99> out<156> write0 TG_mux2_1
xi13<155> net038<100> net037<100> out<155> write0 TG_mux2_1
xi13<154> net038<101> net037<101> out<154> write0 TG_mux2_1
xi13<153> net038<102> net037<102> out<153> write0 TG_mux2_1
xi13<152> net038<103> net037<103> out<152> write0 TG_mux2_1
xi13<151> net038<104> net037<104> out<151> write0 TG_mux2_1
xi13<150> net038<105> net037<105> out<150> write0 TG_mux2_1
xi13<149> net038<106> net037<106> out<149> write0 TG_mux2_1
xi13<148> net038<107> net037<107> out<148> write0 TG_mux2_1
xi13<147> net038<108> net037<108> out<147> write0 TG_mux2_1
xi13<146> net038<109> net037<109> out<146> write0 TG_mux2_1
xi13<145> net038<110> net037<110> out<145> write0 TG_mux2_1
xi13<144> net038<111> net037<111> out<144> write0 TG_mux2_1
xi13<143> net038<112> net037<112> out<143> write0 TG_mux2_1
xi13<142> net038<113> net037<113> out<142> write0 TG_mux2_1
xi13<141> net038<114> net037<114> out<141> write0 TG_mux2_1
xi13<140> net038<115> net037<115> out<140> write0 TG_mux2_1
xi13<139> net038<116> net037<116> out<139> write0 TG_mux2_1
xi13<138> net038<117> net037<117> out<138> write0 TG_mux2_1
xi13<137> net038<118> net037<118> out<137> write0 TG_mux2_1
xi13<136> net038<119> net037<119> out<136> write0 TG_mux2_1
xi13<135> net038<120> net037<120> out<135> write0 TG_mux2_1
xi13<134> net038<121> net037<121> out<134> write0 TG_mux2_1
xi13<133> net038<122> net037<122> out<133> write0 TG_mux2_1
xi13<132> net038<123> net037<123> out<132> write0 TG_mux2_1
xi13<131> net038<124> net037<124> out<131> write0 TG_mux2_1
xi13<130> net038<125> net037<125> out<130> write0 TG_mux2_1
xi13<129> net038<126> net037<126> out<129> write0 TG_mux2_1
xi13<128> net038<127> net037<127> out<128> write0 TG_mux2_1
xi13<127> net038<128> net037<128> out<127> write0 TG_mux2_1
xi13<126> net038<129> net037<129> out<126> write0 TG_mux2_1
xi13<125> net038<130> net037<130> out<125> write0 TG_mux2_1
xi13<124> net038<131> net037<131> out<124> write0 TG_mux2_1
xi13<123> net038<132> net037<132> out<123> write0 TG_mux2_1
xi13<122> net038<133> net037<133> out<122> write0 TG_mux2_1
xi13<121> net038<134> net037<134> out<121> write0 TG_mux2_1
xi13<120> net038<135> net037<135> out<120> write0 TG_mux2_1
xi13<119> net038<136> net037<136> out<119> write0 TG_mux2_1
xi13<118> net038<137> net037<137> out<118> write0 TG_mux2_1
xi13<117> net038<138> net037<138> out<117> write0 TG_mux2_1
xi13<116> net038<139> net037<139> out<116> write0 TG_mux2_1
xi13<115> net038<140> net037<140> out<115> write0 TG_mux2_1
xi13<114> net038<141> net037<141> out<114> write0 TG_mux2_1
xi13<113> net038<142> net037<142> out<113> write0 TG_mux2_1
xi13<112> net038<143> net037<143> out<112> write0 TG_mux2_1
xi13<111> net038<144> net037<144> out<111> write0 TG_mux2_1
xi13<110> net038<145> net037<145> out<110> write0 TG_mux2_1
xi13<109> net038<146> net037<146> out<109> write0 TG_mux2_1
xi13<108> net038<147> net037<147> out<108> write0 TG_mux2_1
xi13<107> net038<148> net037<148> out<107> write0 TG_mux2_1
xi13<106> net038<149> net037<149> out<106> write0 TG_mux2_1
xi13<105> net038<150> net037<150> out<105> write0 TG_mux2_1
xi13<104> net038<151> net037<151> out<104> write0 TG_mux2_1
xi13<103> net038<152> net037<152> out<103> write0 TG_mux2_1
xi13<102> net038<153> net037<153> out<102> write0 TG_mux2_1
xi13<101> net038<154> net037<154> out<101> write0 TG_mux2_1
xi13<100> net038<155> net037<155> out<100> write0 TG_mux2_1
xi13<99> net038<156> net037<156> out<99> write0 TG_mux2_1
xi13<98> net038<157> net037<157> out<98> write0 TG_mux2_1
xi13<97> net038<158> net037<158> out<97> write0 TG_mux2_1
xi13<96> net038<159> net037<159> out<96> write0 TG_mux2_1
xi13<95> net038<160> net037<160> out<95> write0 TG_mux2_1
xi13<94> net038<161> net037<161> out<94> write0 TG_mux2_1
xi13<93> net038<162> net037<162> out<93> write0 TG_mux2_1
xi13<92> net038<163> net037<163> out<92> write0 TG_mux2_1
xi13<91> net038<164> net037<164> out<91> write0 TG_mux2_1
xi13<90> net038<165> net037<165> out<90> write0 TG_mux2_1
xi13<89> net038<166> net037<166> out<89> write0 TG_mux2_1
xi13<88> net038<167> net037<167> out<88> write0 TG_mux2_1
xi13<87> net038<168> net037<168> out<87> write0 TG_mux2_1
xi13<86> net038<169> net037<169> out<86> write0 TG_mux2_1
xi13<85> net038<170> net037<170> out<85> write0 TG_mux2_1
xi13<84> net038<171> net037<171> out<84> write0 TG_mux2_1
xi13<83> net038<172> net037<172> out<83> write0 TG_mux2_1
xi13<82> net038<173> net037<173> out<82> write0 TG_mux2_1
xi13<81> net038<174> net037<174> out<81> write0 TG_mux2_1
xi13<80> net038<175> net037<175> out<80> write0 TG_mux2_1
xi13<79> net038<176> net037<176> out<79> write0 TG_mux2_1
xi13<78> net038<177> net037<177> out<78> write0 TG_mux2_1
xi13<77> net038<178> net037<178> out<77> write0 TG_mux2_1
xi13<76> net038<179> net037<179> out<76> write0 TG_mux2_1
xi13<75> net038<180> net037<180> out<75> write0 TG_mux2_1
xi13<74> net038<181> net037<181> out<74> write0 TG_mux2_1
xi13<73> net038<182> net037<182> out<73> write0 TG_mux2_1
xi13<72> net038<183> net037<183> out<72> write0 TG_mux2_1
xi13<71> net038<184> net037<184> out<71> write0 TG_mux2_1
xi13<70> net038<185> net037<185> out<70> write0 TG_mux2_1
xi13<69> net038<186> net037<186> out<69> write0 TG_mux2_1
xi13<68> net038<187> net037<187> out<68> write0 TG_mux2_1
xi13<67> net038<188> net037<188> out<67> write0 TG_mux2_1
xi13<66> net038<189> net037<189> out<66> write0 TG_mux2_1
xi13<65> net038<190> net037<190> out<65> write0 TG_mux2_1
xi13<64> net038<191> net037<191> out<64> write0 TG_mux2_1
xi13<63> net038<192> net037<192> out<63> write0 TG_mux2_1
xi13<62> net038<193> net037<193> out<62> write0 TG_mux2_1
xi13<61> net038<194> net037<194> out<61> write0 TG_mux2_1
xi13<60> net038<195> net037<195> out<60> write0 TG_mux2_1
xi13<59> net038<196> net037<196> out<59> write0 TG_mux2_1
xi13<58> net038<197> net037<197> out<58> write0 TG_mux2_1
xi13<57> net038<198> net037<198> out<57> write0 TG_mux2_1
xi13<56> net038<199> net037<199> out<56> write0 TG_mux2_1
xi13<55> net038<200> net037<200> out<55> write0 TG_mux2_1
xi13<54> net038<201> net037<201> out<54> write0 TG_mux2_1
xi13<53> net038<202> net037<202> out<53> write0 TG_mux2_1
xi13<52> net038<203> net037<203> out<52> write0 TG_mux2_1
xi13<51> net038<204> net037<204> out<51> write0 TG_mux2_1
xi13<50> net038<205> net037<205> out<50> write0 TG_mux2_1
xi13<49> net038<206> net037<206> out<49> write0 TG_mux2_1
xi13<48> net038<207> net037<207> out<48> write0 TG_mux2_1
xi13<47> net038<208> net037<208> out<47> write0 TG_mux2_1
xi13<46> net038<209> net037<209> out<46> write0 TG_mux2_1
xi13<45> net038<210> net037<210> out<45> write0 TG_mux2_1
xi13<44> net038<211> net037<211> out<44> write0 TG_mux2_1
xi13<43> net038<212> net037<212> out<43> write0 TG_mux2_1
xi13<42> net038<213> net037<213> out<42> write0 TG_mux2_1
xi13<41> net038<214> net037<214> out<41> write0 TG_mux2_1
xi13<40> net038<215> net037<215> out<40> write0 TG_mux2_1
xi13<39> net038<216> net037<216> out<39> write0 TG_mux2_1
xi13<38> net038<217> net037<217> out<38> write0 TG_mux2_1
xi13<37> net038<218> net037<218> out<37> write0 TG_mux2_1
xi13<36> net038<219> net037<219> out<36> write0 TG_mux2_1
xi13<35> net038<220> net037<220> out<35> write0 TG_mux2_1
xi13<34> net038<221> net037<221> out<34> write0 TG_mux2_1
xi13<33> net038<222> net037<222> out<33> write0 TG_mux2_1
xi13<32> net038<223> net037<223> out<32> write0 TG_mux2_1
xi13<31> net038<224> net037<224> out<31> write0 TG_mux2_1
xi13<30> net038<225> net037<225> out<30> write0 TG_mux2_1
xi13<29> net038<226> net037<226> out<29> write0 TG_mux2_1
xi13<28> net038<227> net037<227> out<28> write0 TG_mux2_1
xi13<27> net038<228> net037<228> out<27> write0 TG_mux2_1
xi13<26> net038<229> net037<229> out<26> write0 TG_mux2_1
xi13<25> net038<230> net037<230> out<25> write0 TG_mux2_1
xi13<24> net038<231> net037<231> out<24> write0 TG_mux2_1
xi13<23> net038<232> net037<232> out<23> write0 TG_mux2_1
xi13<22> net038<233> net037<233> out<22> write0 TG_mux2_1
xi13<21> net038<234> net037<234> out<21> write0 TG_mux2_1
xi13<20> net038<235> net037<235> out<20> write0 TG_mux2_1
xi13<19> net038<236> net037<236> out<19> write0 TG_mux2_1
xi13<18> net038<237> net037<237> out<18> write0 TG_mux2_1
xi13<17> net038<238> net037<238> out<17> write0 TG_mux2_1
xi13<16> net038<239> net037<239> out<16> write0 TG_mux2_1
xi13<15> net038<240> net037<240> out<15> write0 TG_mux2_1
xi13<14> net038<241> net037<241> out<14> write0 TG_mux2_1
xi13<13> net038<242> net037<242> out<13> write0 TG_mux2_1
xi13<12> net038<243> net037<243> out<12> write0 TG_mux2_1
xi13<11> net038<244> net037<244> out<11> write0 TG_mux2_1
xi13<10> net038<245> net037<245> out<10> write0 TG_mux2_1
xi13<9> net038<246> net037<246> out<9> write0 TG_mux2_1
xi13<8> net038<247> net037<247> out<8> write0 TG_mux2_1
xi13<7> net038<248> net037<248> out<7> write0 TG_mux2_1
xi13<6> net038<249> net037<249> out<6> write0 TG_mux2_1
xi13<5> net038<250> net037<250> out<5> write0 TG_mux2_1
xi13<4> net038<251> net037<251> out<4> write0 TG_mux2_1
xi13<3> net038<252> net037<252> out<3> write0 TG_mux2_1
xi13<2> net038<253> net037<253> out<2> write0 TG_mux2_1
xi13<1> net038<254> net037<254> out<1> write0 TG_mux2_1
xi13<0> net038<255> net037<255> out<0> write0 TG_mux2_1
xi5 net08 net012 net019 flip TG_mux2_1
xi8<255> data_buf<3> init_data<255> net036<0> init_buf TG_mux2_1
xi8<254> data_buf<2> init_data<254> net036<1> init_buf TG_mux2_1
xi8<253> data_buf<1> init_data<253> net036<2> init_buf TG_mux2_1
xi8<252> data_buf<0> init_data<252> net036<3> init_buf TG_mux2_1
xi8<251> data_buf<3> init_data<251> net036<4> init_buf TG_mux2_1
xi8<250> data_buf<2> init_data<250> net036<5> init_buf TG_mux2_1
xi8<249> data_buf<1> init_data<249> net036<6> init_buf TG_mux2_1
xi8<248> data_buf<0> init_data<248> net036<7> init_buf TG_mux2_1
xi8<247> data_buf<3> init_data<247> net036<8> init_buf TG_mux2_1
xi8<246> data_buf<2> init_data<246> net036<9> init_buf TG_mux2_1
xi8<245> data_buf<1> init_data<245> net036<10> init_buf TG_mux2_1
xi8<244> data_buf<0> init_data<244> net036<11> init_buf TG_mux2_1
xi8<243> data_buf<3> init_data<243> net036<12> init_buf TG_mux2_1
xi8<242> data_buf<2> init_data<242> net036<13> init_buf TG_mux2_1
xi8<241> data_buf<1> init_data<241> net036<14> init_buf TG_mux2_1
xi8<240> data_buf<0> init_data<240> net036<15> init_buf TG_mux2_1
xi8<239> data_buf<3> init_data<239> net036<16> init_buf TG_mux2_1
xi8<238> data_buf<2> init_data<238> net036<17> init_buf TG_mux2_1
xi8<237> data_buf<1> init_data<237> net036<18> init_buf TG_mux2_1
xi8<236> data_buf<0> init_data<236> net036<19> init_buf TG_mux2_1
xi8<235> data_buf<3> init_data<235> net036<20> init_buf TG_mux2_1
xi8<234> data_buf<2> init_data<234> net036<21> init_buf TG_mux2_1
xi8<233> data_buf<1> init_data<233> net036<22> init_buf TG_mux2_1
xi8<232> data_buf<0> init_data<232> net036<23> init_buf TG_mux2_1
xi8<231> data_buf<3> init_data<231> net036<24> init_buf TG_mux2_1
xi8<230> data_buf<2> init_data<230> net036<25> init_buf TG_mux2_1
xi8<229> data_buf<1> init_data<229> net036<26> init_buf TG_mux2_1
xi8<228> data_buf<0> init_data<228> net036<27> init_buf TG_mux2_1
xi8<227> data_buf<3> init_data<227> net036<28> init_buf TG_mux2_1
xi8<226> data_buf<2> init_data<226> net036<29> init_buf TG_mux2_1
xi8<225> data_buf<1> init_data<225> net036<30> init_buf TG_mux2_1
xi8<224> data_buf<0> init_data<224> net036<31> init_buf TG_mux2_1
xi8<223> data_buf<3> init_data<223> net036<32> init_buf TG_mux2_1
xi8<222> data_buf<2> init_data<222> net036<33> init_buf TG_mux2_1
xi8<221> data_buf<1> init_data<221> net036<34> init_buf TG_mux2_1
xi8<220> data_buf<0> init_data<220> net036<35> init_buf TG_mux2_1
xi8<219> data_buf<3> init_data<219> net036<36> init_buf TG_mux2_1
xi8<218> data_buf<2> init_data<218> net036<37> init_buf TG_mux2_1
xi8<217> data_buf<1> init_data<217> net036<38> init_buf TG_mux2_1
xi8<216> data_buf<0> init_data<216> net036<39> init_buf TG_mux2_1
xi8<215> data_buf<3> init_data<215> net036<40> init_buf TG_mux2_1
xi8<214> data_buf<2> init_data<214> net036<41> init_buf TG_mux2_1
xi8<213> data_buf<1> init_data<213> net036<42> init_buf TG_mux2_1
xi8<212> data_buf<0> init_data<212> net036<43> init_buf TG_mux2_1
xi8<211> data_buf<3> init_data<211> net036<44> init_buf TG_mux2_1
xi8<210> data_buf<2> init_data<210> net036<45> init_buf TG_mux2_1
xi8<209> data_buf<1> init_data<209> net036<46> init_buf TG_mux2_1
xi8<208> data_buf<0> init_data<208> net036<47> init_buf TG_mux2_1
xi8<207> data_buf<3> init_data<207> net036<48> init_buf TG_mux2_1
xi8<206> data_buf<2> init_data<206> net036<49> init_buf TG_mux2_1
xi8<205> data_buf<1> init_data<205> net036<50> init_buf TG_mux2_1
xi8<204> data_buf<0> init_data<204> net036<51> init_buf TG_mux2_1
xi8<203> data_buf<3> init_data<203> net036<52> init_buf TG_mux2_1
xi8<202> data_buf<2> init_data<202> net036<53> init_buf TG_mux2_1
xi8<201> data_buf<1> init_data<201> net036<54> init_buf TG_mux2_1
xi8<200> data_buf<0> init_data<200> net036<55> init_buf TG_mux2_1
xi8<199> data_buf<3> init_data<199> net036<56> init_buf TG_mux2_1
xi8<198> data_buf<2> init_data<198> net036<57> init_buf TG_mux2_1
xi8<197> data_buf<1> init_data<197> net036<58> init_buf TG_mux2_1
xi8<196> data_buf<0> init_data<196> net036<59> init_buf TG_mux2_1
xi8<195> data_buf<3> init_data<195> net036<60> init_buf TG_mux2_1
xi8<194> data_buf<2> init_data<194> net036<61> init_buf TG_mux2_1
xi8<193> data_buf<1> init_data<193> net036<62> init_buf TG_mux2_1
xi8<192> data_buf<0> init_data<192> net036<63> init_buf TG_mux2_1
xi8<191> data_buf<3> init_data<191> net036<64> init_buf TG_mux2_1
xi8<190> data_buf<2> init_data<190> net036<65> init_buf TG_mux2_1
xi8<189> data_buf<1> init_data<189> net036<66> init_buf TG_mux2_1
xi8<188> data_buf<0> init_data<188> net036<67> init_buf TG_mux2_1
xi8<187> data_buf<3> init_data<187> net036<68> init_buf TG_mux2_1
xi8<186> data_buf<2> init_data<186> net036<69> init_buf TG_mux2_1
xi8<185> data_buf<1> init_data<185> net036<70> init_buf TG_mux2_1
xi8<184> data_buf<0> init_data<184> net036<71> init_buf TG_mux2_1
xi8<183> data_buf<3> init_data<183> net036<72> init_buf TG_mux2_1
xi8<182> data_buf<2> init_data<182> net036<73> init_buf TG_mux2_1
xi8<181> data_buf<1> init_data<181> net036<74> init_buf TG_mux2_1
xi8<180> data_buf<0> init_data<180> net036<75> init_buf TG_mux2_1
xi8<179> data_buf<3> init_data<179> net036<76> init_buf TG_mux2_1
xi8<178> data_buf<2> init_data<178> net036<77> init_buf TG_mux2_1
xi8<177> data_buf<1> init_data<177> net036<78> init_buf TG_mux2_1
xi8<176> data_buf<0> init_data<176> net036<79> init_buf TG_mux2_1
xi8<175> data_buf<3> init_data<175> net036<80> init_buf TG_mux2_1
xi8<174> data_buf<2> init_data<174> net036<81> init_buf TG_mux2_1
xi8<173> data_buf<1> init_data<173> net036<82> init_buf TG_mux2_1
xi8<172> data_buf<0> init_data<172> net036<83> init_buf TG_mux2_1
xi8<171> data_buf<3> init_data<171> net036<84> init_buf TG_mux2_1
xi8<170> data_buf<2> init_data<170> net036<85> init_buf TG_mux2_1
xi8<169> data_buf<1> init_data<169> net036<86> init_buf TG_mux2_1
xi8<168> data_buf<0> init_data<168> net036<87> init_buf TG_mux2_1
xi8<167> data_buf<3> init_data<167> net036<88> init_buf TG_mux2_1
xi8<166> data_buf<2> init_data<166> net036<89> init_buf TG_mux2_1
xi8<165> data_buf<1> init_data<165> net036<90> init_buf TG_mux2_1
xi8<164> data_buf<0> init_data<164> net036<91> init_buf TG_mux2_1
xi8<163> data_buf<3> init_data<163> net036<92> init_buf TG_mux2_1
xi8<162> data_buf<2> init_data<162> net036<93> init_buf TG_mux2_1
xi8<161> data_buf<1> init_data<161> net036<94> init_buf TG_mux2_1
xi8<160> data_buf<0> init_data<160> net036<95> init_buf TG_mux2_1
xi8<159> data_buf<3> init_data<159> net036<96> init_buf TG_mux2_1
xi8<158> data_buf<2> init_data<158> net036<97> init_buf TG_mux2_1
xi8<157> data_buf<1> init_data<157> net036<98> init_buf TG_mux2_1
xi8<156> data_buf<0> init_data<156> net036<99> init_buf TG_mux2_1
xi8<155> data_buf<3> init_data<155> net036<100> init_buf TG_mux2_1
xi8<154> data_buf<2> init_data<154> net036<101> init_buf TG_mux2_1
xi8<153> data_buf<1> init_data<153> net036<102> init_buf TG_mux2_1
xi8<152> data_buf<0> init_data<152> net036<103> init_buf TG_mux2_1
xi8<151> data_buf<3> init_data<151> net036<104> init_buf TG_mux2_1
xi8<150> data_buf<2> init_data<150> net036<105> init_buf TG_mux2_1
xi8<149> data_buf<1> init_data<149> net036<106> init_buf TG_mux2_1
xi8<148> data_buf<0> init_data<148> net036<107> init_buf TG_mux2_1
xi8<147> data_buf<3> init_data<147> net036<108> init_buf TG_mux2_1
xi8<146> data_buf<2> init_data<146> net036<109> init_buf TG_mux2_1
xi8<145> data_buf<1> init_data<145> net036<110> init_buf TG_mux2_1
xi8<144> data_buf<0> init_data<144> net036<111> init_buf TG_mux2_1
xi8<143> data_buf<3> init_data<143> net036<112> init_buf TG_mux2_1
xi8<142> data_buf<2> init_data<142> net036<113> init_buf TG_mux2_1
xi8<141> data_buf<1> init_data<141> net036<114> init_buf TG_mux2_1
xi8<140> data_buf<0> init_data<140> net036<115> init_buf TG_mux2_1
xi8<139> data_buf<3> init_data<139> net036<116> init_buf TG_mux2_1
xi8<138> data_buf<2> init_data<138> net036<117> init_buf TG_mux2_1
xi8<137> data_buf<1> init_data<137> net036<118> init_buf TG_mux2_1
xi8<136> data_buf<0> init_data<136> net036<119> init_buf TG_mux2_1
xi8<135> data_buf<3> init_data<135> net036<120> init_buf TG_mux2_1
xi8<134> data_buf<2> init_data<134> net036<121> init_buf TG_mux2_1
xi8<133> data_buf<1> init_data<133> net036<122> init_buf TG_mux2_1
xi8<132> data_buf<0> init_data<132> net036<123> init_buf TG_mux2_1
xi8<131> data_buf<3> init_data<131> net036<124> init_buf TG_mux2_1
xi8<130> data_buf<2> init_data<130> net036<125> init_buf TG_mux2_1
xi8<129> data_buf<1> init_data<129> net036<126> init_buf TG_mux2_1
xi8<128> data_buf<0> init_data<128> net036<127> init_buf TG_mux2_1
xi8<127> data_buf<3> init_data<127> net036<128> init_buf TG_mux2_1
xi8<126> data_buf<2> init_data<126> net036<129> init_buf TG_mux2_1
xi8<125> data_buf<1> init_data<125> net036<130> init_buf TG_mux2_1
xi8<124> data_buf<0> init_data<124> net036<131> init_buf TG_mux2_1
xi8<123> data_buf<3> init_data<123> net036<132> init_buf TG_mux2_1
xi8<122> data_buf<2> init_data<122> net036<133> init_buf TG_mux2_1
xi8<121> data_buf<1> init_data<121> net036<134> init_buf TG_mux2_1
xi8<120> data_buf<0> init_data<120> net036<135> init_buf TG_mux2_1
xi8<119> data_buf<3> init_data<119> net036<136> init_buf TG_mux2_1
xi8<118> data_buf<2> init_data<118> net036<137> init_buf TG_mux2_1
xi8<117> data_buf<1> init_data<117> net036<138> init_buf TG_mux2_1
xi8<116> data_buf<0> init_data<116> net036<139> init_buf TG_mux2_1
xi8<115> data_buf<3> init_data<115> net036<140> init_buf TG_mux2_1
xi8<114> data_buf<2> init_data<114> net036<141> init_buf TG_mux2_1
xi8<113> data_buf<1> init_data<113> net036<142> init_buf TG_mux2_1
xi8<112> data_buf<0> init_data<112> net036<143> init_buf TG_mux2_1
xi8<111> data_buf<3> init_data<111> net036<144> init_buf TG_mux2_1
xi8<110> data_buf<2> init_data<110> net036<145> init_buf TG_mux2_1
xi8<109> data_buf<1> init_data<109> net036<146> init_buf TG_mux2_1
xi8<108> data_buf<0> init_data<108> net036<147> init_buf TG_mux2_1
xi8<107> data_buf<3> init_data<107> net036<148> init_buf TG_mux2_1
xi8<106> data_buf<2> init_data<106> net036<149> init_buf TG_mux2_1
xi8<105> data_buf<1> init_data<105> net036<150> init_buf TG_mux2_1
xi8<104> data_buf<0> init_data<104> net036<151> init_buf TG_mux2_1
xi8<103> data_buf<3> init_data<103> net036<152> init_buf TG_mux2_1
xi8<102> data_buf<2> init_data<102> net036<153> init_buf TG_mux2_1
xi8<101> data_buf<1> init_data<101> net036<154> init_buf TG_mux2_1
xi8<100> data_buf<0> init_data<100> net036<155> init_buf TG_mux2_1
xi8<99> data_buf<3> init_data<99> net036<156> init_buf TG_mux2_1
xi8<98> data_buf<2> init_data<98> net036<157> init_buf TG_mux2_1
xi8<97> data_buf<1> init_data<97> net036<158> init_buf TG_mux2_1
xi8<96> data_buf<0> init_data<96> net036<159> init_buf TG_mux2_1
xi8<95> data_buf<3> init_data<95> net036<160> init_buf TG_mux2_1
xi8<94> data_buf<2> init_data<94> net036<161> init_buf TG_mux2_1
xi8<93> data_buf<1> init_data<93> net036<162> init_buf TG_mux2_1
xi8<92> data_buf<0> init_data<92> net036<163> init_buf TG_mux2_1
xi8<91> data_buf<3> init_data<91> net036<164> init_buf TG_mux2_1
xi8<90> data_buf<2> init_data<90> net036<165> init_buf TG_mux2_1
xi8<89> data_buf<1> init_data<89> net036<166> init_buf TG_mux2_1
xi8<88> data_buf<0> init_data<88> net036<167> init_buf TG_mux2_1
xi8<87> data_buf<3> init_data<87> net036<168> init_buf TG_mux2_1
xi8<86> data_buf<2> init_data<86> net036<169> init_buf TG_mux2_1
xi8<85> data_buf<1> init_data<85> net036<170> init_buf TG_mux2_1
xi8<84> data_buf<0> init_data<84> net036<171> init_buf TG_mux2_1
xi8<83> data_buf<3> init_data<83> net036<172> init_buf TG_mux2_1
xi8<82> data_buf<2> init_data<82> net036<173> init_buf TG_mux2_1
xi8<81> data_buf<1> init_data<81> net036<174> init_buf TG_mux2_1
xi8<80> data_buf<0> init_data<80> net036<175> init_buf TG_mux2_1
xi8<79> data_buf<3> init_data<79> net036<176> init_buf TG_mux2_1
xi8<78> data_buf<2> init_data<78> net036<177> init_buf TG_mux2_1
xi8<77> data_buf<1> init_data<77> net036<178> init_buf TG_mux2_1
xi8<76> data_buf<0> init_data<76> net036<179> init_buf TG_mux2_1
xi8<75> data_buf<3> init_data<75> net036<180> init_buf TG_mux2_1
xi8<74> data_buf<2> init_data<74> net036<181> init_buf TG_mux2_1
xi8<73> data_buf<1> init_data<73> net036<182> init_buf TG_mux2_1
xi8<72> data_buf<0> init_data<72> net036<183> init_buf TG_mux2_1
xi8<71> data_buf<3> init_data<71> net036<184> init_buf TG_mux2_1
xi8<70> data_buf<2> init_data<70> net036<185> init_buf TG_mux2_1
xi8<69> data_buf<1> init_data<69> net036<186> init_buf TG_mux2_1
xi8<68> data_buf<0> init_data<68> net036<187> init_buf TG_mux2_1
xi8<67> data_buf<3> init_data<67> net036<188> init_buf TG_mux2_1
xi8<66> data_buf<2> init_data<66> net036<189> init_buf TG_mux2_1
xi8<65> data_buf<1> init_data<65> net036<190> init_buf TG_mux2_1
xi8<64> data_buf<0> init_data<64> net036<191> init_buf TG_mux2_1
xi8<63> data_buf<3> init_data<63> net036<192> init_buf TG_mux2_1
xi8<62> data_buf<2> init_data<62> net036<193> init_buf TG_mux2_1
xi8<61> data_buf<1> init_data<61> net036<194> init_buf TG_mux2_1
xi8<60> data_buf<0> init_data<60> net036<195> init_buf TG_mux2_1
xi8<59> data_buf<3> init_data<59> net036<196> init_buf TG_mux2_1
xi8<58> data_buf<2> init_data<58> net036<197> init_buf TG_mux2_1
xi8<57> data_buf<1> init_data<57> net036<198> init_buf TG_mux2_1
xi8<56> data_buf<0> init_data<56> net036<199> init_buf TG_mux2_1
xi8<55> data_buf<3> init_data<55> net036<200> init_buf TG_mux2_1
xi8<54> data_buf<2> init_data<54> net036<201> init_buf TG_mux2_1
xi8<53> data_buf<1> init_data<53> net036<202> init_buf TG_mux2_1
xi8<52> data_buf<0> init_data<52> net036<203> init_buf TG_mux2_1
xi8<51> data_buf<3> init_data<51> net036<204> init_buf TG_mux2_1
xi8<50> data_buf<2> init_data<50> net036<205> init_buf TG_mux2_1
xi8<49> data_buf<1> init_data<49> net036<206> init_buf TG_mux2_1
xi8<48> data_buf<0> init_data<48> net036<207> init_buf TG_mux2_1
xi8<47> data_buf<3> init_data<47> net036<208> init_buf TG_mux2_1
xi8<46> data_buf<2> init_data<46> net036<209> init_buf TG_mux2_1
xi8<45> data_buf<1> init_data<45> net036<210> init_buf TG_mux2_1
xi8<44> data_buf<0> init_data<44> net036<211> init_buf TG_mux2_1
xi8<43> data_buf<3> init_data<43> net036<212> init_buf TG_mux2_1
xi8<42> data_buf<2> init_data<42> net036<213> init_buf TG_mux2_1
xi8<41> data_buf<1> init_data<41> net036<214> init_buf TG_mux2_1
xi8<40> data_buf<0> init_data<40> net036<215> init_buf TG_mux2_1
xi8<39> data_buf<3> init_data<39> net036<216> init_buf TG_mux2_1
xi8<38> data_buf<2> init_data<38> net036<217> init_buf TG_mux2_1
xi8<37> data_buf<1> init_data<37> net036<218> init_buf TG_mux2_1
xi8<36> data_buf<0> init_data<36> net036<219> init_buf TG_mux2_1
xi8<35> data_buf<3> init_data<35> net036<220> init_buf TG_mux2_1
xi8<34> data_buf<2> init_data<34> net036<221> init_buf TG_mux2_1
xi8<33> data_buf<1> init_data<33> net036<222> init_buf TG_mux2_1
xi8<32> data_buf<0> init_data<32> net036<223> init_buf TG_mux2_1
xi8<31> data_buf<3> init_data<31> net036<224> init_buf TG_mux2_1
xi8<30> data_buf<2> init_data<30> net036<225> init_buf TG_mux2_1
xi8<29> data_buf<1> init_data<29> net036<226> init_buf TG_mux2_1
xi8<28> data_buf<0> init_data<28> net036<227> init_buf TG_mux2_1
xi8<27> data_buf<3> init_data<27> net036<228> init_buf TG_mux2_1
xi8<26> data_buf<2> init_data<26> net036<229> init_buf TG_mux2_1
xi8<25> data_buf<1> init_data<25> net036<230> init_buf TG_mux2_1
xi8<24> data_buf<0> init_data<24> net036<231> init_buf TG_mux2_1
xi8<23> data_buf<3> init_data<23> net036<232> init_buf TG_mux2_1
xi8<22> data_buf<2> init_data<22> net036<233> init_buf TG_mux2_1
xi8<21> data_buf<1> init_data<21> net036<234> init_buf TG_mux2_1
xi8<20> data_buf<0> init_data<20> net036<235> init_buf TG_mux2_1
xi8<19> data_buf<3> init_data<19> net036<236> init_buf TG_mux2_1
xi8<18> data_buf<2> init_data<18> net036<237> init_buf TG_mux2_1
xi8<17> data_buf<1> init_data<17> net036<238> init_buf TG_mux2_1
xi8<16> data_buf<0> init_data<16> net036<239> init_buf TG_mux2_1
xi8<15> data_buf<3> init_data<15> net036<240> init_buf TG_mux2_1
xi8<14> data_buf<2> init_data<14> net036<241> init_buf TG_mux2_1
xi8<13> data_buf<1> init_data<13> net036<242> init_buf TG_mux2_1
xi8<12> data_buf<0> init_data<12> net036<243> init_buf TG_mux2_1
xi8<11> data_buf<3> init_data<11> net036<244> init_buf TG_mux2_1
xi8<10> data_buf<2> init_data<10> net036<245> init_buf TG_mux2_1
xi8<9> data_buf<1> init_data<9> net036<246> init_buf TG_mux2_1
xi8<8> data_buf<0> init_data<8> net036<247> init_buf TG_mux2_1
xi8<7> data_buf<3> init_data<7> net036<248> init_buf TG_mux2_1
xi8<6> data_buf<2> init_data<6> net036<249> init_buf TG_mux2_1
xi8<5> data_buf<1> init_data<5> net036<250> init_buf TG_mux2_1
xi8<4> data_buf<0> init_data<4> net036<251> init_buf TG_mux2_1
xi8<3> data_buf<3> init_data<3> net036<252> init_buf TG_mux2_1
xi8<2> data_buf<2> init_data<2> net036<253> init_buf TG_mux2_1
xi8<1> data_buf<1> init_data<1> net036<254> init_buf TG_mux2_1
xi8<0> data_buf<0> init_data<0> net036<255> init_buf TG_mux2_1
xi20<63> net035<0> vdd! en0<63> init_buf TG_mux2_1
xi20<62> net035<1> vdd! en0<62> init_buf TG_mux2_1
xi20<61> net035<2> vdd! en0<61> init_buf TG_mux2_1
xi20<60> net035<3> vdd! en0<60> init_buf TG_mux2_1
xi20<59> net035<4> vdd! en0<59> init_buf TG_mux2_1
xi20<58> net035<5> vdd! en0<58> init_buf TG_mux2_1
xi20<57> net035<6> vdd! en0<57> init_buf TG_mux2_1
xi20<56> net035<7> vdd! en0<56> init_buf TG_mux2_1
xi20<55> net035<8> vdd! en0<55> init_buf TG_mux2_1
xi20<54> net035<9> vdd! en0<54> init_buf TG_mux2_1
xi20<53> net035<10> vdd! en0<53> init_buf TG_mux2_1
xi20<52> net035<11> vdd! en0<52> init_buf TG_mux2_1
xi20<51> net035<12> vdd! en0<51> init_buf TG_mux2_1
xi20<50> net035<13> vdd! en0<50> init_buf TG_mux2_1
xi20<49> net035<14> vdd! en0<49> init_buf TG_mux2_1
xi20<48> net035<15> vdd! en0<48> init_buf TG_mux2_1
xi20<47> net035<16> vdd! en0<47> init_buf TG_mux2_1
xi20<46> net035<17> vdd! en0<46> init_buf TG_mux2_1
xi20<45> net035<18> vdd! en0<45> init_buf TG_mux2_1
xi20<44> net035<19> vdd! en0<44> init_buf TG_mux2_1
xi20<43> net035<20> vdd! en0<43> init_buf TG_mux2_1
xi20<42> net035<21> vdd! en0<42> init_buf TG_mux2_1
xi20<41> net035<22> vdd! en0<41> init_buf TG_mux2_1
xi20<40> net035<23> vdd! en0<40> init_buf TG_mux2_1
xi20<39> net035<24> vdd! en0<39> init_buf TG_mux2_1
xi20<38> net035<25> vdd! en0<38> init_buf TG_mux2_1
xi20<37> net035<26> vdd! en0<37> init_buf TG_mux2_1
xi20<36> net035<27> vdd! en0<36> init_buf TG_mux2_1
xi20<35> net035<28> vdd! en0<35> init_buf TG_mux2_1
xi20<34> net035<29> vdd! en0<34> init_buf TG_mux2_1
xi20<33> net035<30> vdd! en0<33> init_buf TG_mux2_1
xi20<32> net035<31> vdd! en0<32> init_buf TG_mux2_1
xi20<31> net035<32> vdd! en0<31> init_buf TG_mux2_1
xi20<30> net035<33> vdd! en0<30> init_buf TG_mux2_1
xi20<29> net035<34> vdd! en0<29> init_buf TG_mux2_1
xi20<28> net035<35> vdd! en0<28> init_buf TG_mux2_1
xi20<27> net035<36> vdd! en0<27> init_buf TG_mux2_1
xi20<26> net035<37> vdd! en0<26> init_buf TG_mux2_1
xi20<25> net035<38> vdd! en0<25> init_buf TG_mux2_1
xi20<24> net035<39> vdd! en0<24> init_buf TG_mux2_1
xi20<23> net035<40> vdd! en0<23> init_buf TG_mux2_1
xi20<22> net035<41> vdd! en0<22> init_buf TG_mux2_1
xi20<21> net035<42> vdd! en0<21> init_buf TG_mux2_1
xi20<20> net035<43> vdd! en0<20> init_buf TG_mux2_1
xi20<19> net035<44> vdd! en0<19> init_buf TG_mux2_1
xi20<18> net035<45> vdd! en0<18> init_buf TG_mux2_1
xi20<17> net035<46> vdd! en0<17> init_buf TG_mux2_1
xi20<16> net035<47> vdd! en0<16> init_buf TG_mux2_1
xi20<15> net035<48> vdd! en0<15> init_buf TG_mux2_1
xi20<14> net035<49> vdd! en0<14> init_buf TG_mux2_1
xi20<13> net035<50> vdd! en0<13> init_buf TG_mux2_1
xi20<12> net035<51> vdd! en0<12> init_buf TG_mux2_1
xi20<11> net035<52> vdd! en0<11> init_buf TG_mux2_1
xi20<10> net035<53> vdd! en0<10> init_buf TG_mux2_1
xi20<9> net035<54> vdd! en0<9> init_buf TG_mux2_1
xi20<8> net035<55> vdd! en0<8> init_buf TG_mux2_1
xi20<7> net035<56> vdd! en0<7> init_buf TG_mux2_1
xi20<6> net035<57> vdd! en0<6> init_buf TG_mux2_1
xi20<5> net035<58> vdd! en0<5> init_buf TG_mux2_1
xi20<4> net035<59> vdd! en0<4> init_buf TG_mux2_1
xi20<3> net035<60> vdd! en0<3> init_buf TG_mux2_1
xi20<2> net035<61> vdd! en0<2> init_buf TG_mux2_1
xi20<1> net035<62> vdd! en0<1> init_buf TG_mux2_1
xi20<0> net035<63> vdd! en0<0> init_buf TG_mux2_1
xi23 write_block<4> write_block<3> write_block<2> write_block<1> write_block<0> decoder_out<31> decoder_out<30> decoder_out<29> decoder_out<28> decoder_out<27> decoder_out<26> decoder_out<25> decoder_out<24> decoder_out<23> decoder_out<22> decoder_out<21> decoder_out<20> decoder_out<19> decoder_out<18> decoder_out<17> decoder_out<16> decoder_out<15> decoder_out<14> decoder_out<13> decoder_out<12> decoder_out<11> decoder_out<10> decoder_out<9> decoder_out<8> decoder_out<7> decoder_out<6> decoder_out<5> decoder_out<4> decoder_out<3> decoder_out<2> decoder_out<1> decoder_out<0> write_block<5> decoder_out<63> decoder_out<62> decoder_out<61> decoder_out<60> decoder_out<59> decoder_out<58> decoder_out<57> decoder_out<56> decoder_out<55> decoder_out<54> decoder_out<53> decoder_out<52> decoder_out<51> decoder_out<50> decoder_out<49> decoder_out<48> decoder_out<47> decoder_out<46> decoder_out<45> decoder_out<44> decoder_out<43> decoder_out<42> decoder_out<41> decoder_out<40> decoder_out<39> decoder_out<38>
+decoder_out<37> decoder_out<36> decoder_out<35> decoder_out<34> decoder_out<33> decoder_out<32> DECODER_6bit
xi21<63> decoder_out<63> write0 net022<0> NAND_PARAM size=1
xi21<62> decoder_out<62> write0 net022<1> NAND_PARAM size=1
xi21<61> decoder_out<61> write0 net022<2> NAND_PARAM size=1
xi21<60> decoder_out<60> write0 net022<3> NAND_PARAM size=1
xi21<59> decoder_out<59> write0 net022<4> NAND_PARAM size=1
xi21<58> decoder_out<58> write0 net022<5> NAND_PARAM size=1
xi21<57> decoder_out<57> write0 net022<6> NAND_PARAM size=1
xi21<56> decoder_out<56> write0 net022<7> NAND_PARAM size=1
xi21<55> decoder_out<55> write0 net022<8> NAND_PARAM size=1
xi21<54> decoder_out<54> write0 net022<9> NAND_PARAM size=1
xi21<53> decoder_out<53> write0 net022<10> NAND_PARAM size=1
xi21<52> decoder_out<52> write0 net022<11> NAND_PARAM size=1
xi21<51> decoder_out<51> write0 net022<12> NAND_PARAM size=1
xi21<50> decoder_out<50> write0 net022<13> NAND_PARAM size=1
xi21<49> decoder_out<49> write0 net022<14> NAND_PARAM size=1
xi21<48> decoder_out<48> write0 net022<15> NAND_PARAM size=1
xi21<47> decoder_out<47> write0 net022<16> NAND_PARAM size=1
xi21<46> decoder_out<46> write0 net022<17> NAND_PARAM size=1
xi21<45> decoder_out<45> write0 net022<18> NAND_PARAM size=1
xi21<44> decoder_out<44> write0 net022<19> NAND_PARAM size=1
xi21<43> decoder_out<43> write0 net022<20> NAND_PARAM size=1
xi21<42> decoder_out<42> write0 net022<21> NAND_PARAM size=1
xi21<41> decoder_out<41> write0 net022<22> NAND_PARAM size=1
xi21<40> decoder_out<40> write0 net022<23> NAND_PARAM size=1
xi21<39> decoder_out<39> write0 net022<24> NAND_PARAM size=1
xi21<38> decoder_out<38> write0 net022<25> NAND_PARAM size=1
xi21<37> decoder_out<37> write0 net022<26> NAND_PARAM size=1
xi21<36> decoder_out<36> write0 net022<27> NAND_PARAM size=1
xi21<35> decoder_out<35> write0 net022<28> NAND_PARAM size=1
xi21<34> decoder_out<34> write0 net022<29> NAND_PARAM size=1
xi21<33> decoder_out<33> write0 net022<30> NAND_PARAM size=1
xi21<32> decoder_out<32> write0 net022<31> NAND_PARAM size=1
xi21<31> decoder_out<31> write0 net022<32> NAND_PARAM size=1
xi21<30> decoder_out<30> write0 net022<33> NAND_PARAM size=1
xi21<29> decoder_out<29> write0 net022<34> NAND_PARAM size=1
xi21<28> decoder_out<28> write0 net022<35> NAND_PARAM size=1
xi21<27> decoder_out<27> write0 net022<36> NAND_PARAM size=1
xi21<26> decoder_out<26> write0 net022<37> NAND_PARAM size=1
xi21<25> decoder_out<25> write0 net022<38> NAND_PARAM size=1
xi21<24> decoder_out<24> write0 net022<39> NAND_PARAM size=1
xi21<23> decoder_out<23> write0 net022<40> NAND_PARAM size=1
xi21<22> decoder_out<22> write0 net022<41> NAND_PARAM size=1
xi21<21> decoder_out<21> write0 net022<42> NAND_PARAM size=1
xi21<20> decoder_out<20> write0 net022<43> NAND_PARAM size=1
xi21<19> decoder_out<19> write0 net022<44> NAND_PARAM size=1
xi21<18> decoder_out<18> write0 net022<45> NAND_PARAM size=1
xi21<17> decoder_out<17> write0 net022<46> NAND_PARAM size=1
xi21<16> decoder_out<16> write0 net022<47> NAND_PARAM size=1
xi21<15> decoder_out<15> write0 net022<48> NAND_PARAM size=1
xi21<14> decoder_out<14> write0 net022<49> NAND_PARAM size=1
xi21<13> decoder_out<13> write0 net022<50> NAND_PARAM size=1
xi21<12> decoder_out<12> write0 net022<51> NAND_PARAM size=1
xi21<11> decoder_out<11> write0 net022<52> NAND_PARAM size=1
xi21<10> decoder_out<10> write0 net022<53> NAND_PARAM size=1
xi21<9> decoder_out<9> write0 net022<54> NAND_PARAM size=1
xi21<8> decoder_out<8> write0 net022<55> NAND_PARAM size=1
xi21<7> decoder_out<7> write0 net022<56> NAND_PARAM size=1
xi21<6> decoder_out<6> write0 net022<57> NAND_PARAM size=1
xi21<5> decoder_out<5> write0 net022<58> NAND_PARAM size=1
xi21<4> decoder_out<4> write0 net022<59> NAND_PARAM size=1
xi21<3> decoder_out<3> write0 net022<60> NAND_PARAM size=1
xi21<2> decoder_out<2> write0 net022<61> NAND_PARAM size=1
xi21<1> decoder_out<1> write0 net022<62> NAND_PARAM size=1
xi21<0> decoder_out<0> write0 net022<63> NAND_PARAM size=1
xi24<63> decoder_out<63> write1 net021<0> NAND_PARAM size=1
xi24<62> decoder_out<62> write1 net021<1> NAND_PARAM size=1
xi24<61> decoder_out<61> write1 net021<2> NAND_PARAM size=1
xi24<60> decoder_out<60> write1 net021<3> NAND_PARAM size=1
xi24<59> decoder_out<59> write1 net021<4> NAND_PARAM size=1
xi24<58> decoder_out<58> write1 net021<5> NAND_PARAM size=1
xi24<57> decoder_out<57> write1 net021<6> NAND_PARAM size=1
xi24<56> decoder_out<56> write1 net021<7> NAND_PARAM size=1
xi24<55> decoder_out<55> write1 net021<8> NAND_PARAM size=1
xi24<54> decoder_out<54> write1 net021<9> NAND_PARAM size=1
xi24<53> decoder_out<53> write1 net021<10> NAND_PARAM size=1
xi24<52> decoder_out<52> write1 net021<11> NAND_PARAM size=1
xi24<51> decoder_out<51> write1 net021<12> NAND_PARAM size=1
xi24<50> decoder_out<50> write1 net021<13> NAND_PARAM size=1
xi24<49> decoder_out<49> write1 net021<14> NAND_PARAM size=1
xi24<48> decoder_out<48> write1 net021<15> NAND_PARAM size=1
xi24<47> decoder_out<47> write1 net021<16> NAND_PARAM size=1
xi24<46> decoder_out<46> write1 net021<17> NAND_PARAM size=1
xi24<45> decoder_out<45> write1 net021<18> NAND_PARAM size=1
xi24<44> decoder_out<44> write1 net021<19> NAND_PARAM size=1
xi24<43> decoder_out<43> write1 net021<20> NAND_PARAM size=1
xi24<42> decoder_out<42> write1 net021<21> NAND_PARAM size=1
xi24<41> decoder_out<41> write1 net021<22> NAND_PARAM size=1
xi24<40> decoder_out<40> write1 net021<23> NAND_PARAM size=1
xi24<39> decoder_out<39> write1 net021<24> NAND_PARAM size=1
xi24<38> decoder_out<38> write1 net021<25> NAND_PARAM size=1
xi24<37> decoder_out<37> write1 net021<26> NAND_PARAM size=1
xi24<36> decoder_out<36> write1 net021<27> NAND_PARAM size=1
xi24<35> decoder_out<35> write1 net021<28> NAND_PARAM size=1
xi24<34> decoder_out<34> write1 net021<29> NAND_PARAM size=1
xi24<33> decoder_out<33> write1 net021<30> NAND_PARAM size=1
xi24<32> decoder_out<32> write1 net021<31> NAND_PARAM size=1
xi24<31> decoder_out<31> write1 net021<32> NAND_PARAM size=1
xi24<30> decoder_out<30> write1 net021<33> NAND_PARAM size=1
xi24<29> decoder_out<29> write1 net021<34> NAND_PARAM size=1
xi24<28> decoder_out<28> write1 net021<35> NAND_PARAM size=1
xi24<27> decoder_out<27> write1 net021<36> NAND_PARAM size=1
xi24<26> decoder_out<26> write1 net021<37> NAND_PARAM size=1
xi24<25> decoder_out<25> write1 net021<38> NAND_PARAM size=1
xi24<24> decoder_out<24> write1 net021<39> NAND_PARAM size=1
xi24<23> decoder_out<23> write1 net021<40> NAND_PARAM size=1
xi24<22> decoder_out<22> write1 net021<41> NAND_PARAM size=1
xi24<21> decoder_out<21> write1 net021<42> NAND_PARAM size=1
xi24<20> decoder_out<20> write1 net021<43> NAND_PARAM size=1
xi24<19> decoder_out<19> write1 net021<44> NAND_PARAM size=1
xi24<18> decoder_out<18> write1 net021<45> NAND_PARAM size=1
xi24<17> decoder_out<17> write1 net021<46> NAND_PARAM size=1
xi24<16> decoder_out<16> write1 net021<47> NAND_PARAM size=1
xi24<15> decoder_out<15> write1 net021<48> NAND_PARAM size=1
xi24<14> decoder_out<14> write1 net021<49> NAND_PARAM size=1
xi24<13> decoder_out<13> write1 net021<50> NAND_PARAM size=1
xi24<12> decoder_out<12> write1 net021<51> NAND_PARAM size=1
xi24<11> decoder_out<11> write1 net021<52> NAND_PARAM size=1
xi24<10> decoder_out<10> write1 net021<53> NAND_PARAM size=1
xi24<9> decoder_out<9> write1 net021<54> NAND_PARAM size=1
xi24<8> decoder_out<8> write1 net021<55> NAND_PARAM size=1
xi24<7> decoder_out<7> write1 net021<56> NAND_PARAM size=1
xi24<6> decoder_out<6> write1 net021<57> NAND_PARAM size=1
xi24<5> decoder_out<5> write1 net021<58> NAND_PARAM size=1
xi24<4> decoder_out<4> write1 net021<59> NAND_PARAM size=1
xi24<3> decoder_out<3> write1 net021<60> NAND_PARAM size=1
xi24<2> decoder_out<2> write1 net021<61> NAND_PARAM size=1
xi24<1> decoder_out<1> write1 net021<62> NAND_PARAM size=1
xi24<0> decoder_out<0> write1 net021<63> NAND_PARAM size=1
xi6 net019 net08 init clk register_sync_reset
.ends BUFFER_4bit_64
** End of subcircuit definition.

** Library name: mycells45
** Cell name: NOR_PARAM
** View name: schematic
.subckt NOR_PARAM a b z
m1 z b 0 0 NMOS_VTL L=50e-9 W='90e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 z a 0 0 NMOS_VTL L=50e-9 W='90e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 net11 b vdd! vdd! PMOS_VTL L=50e-9 W='290e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 z a net11 vdd! PMOS_VTL L=50e-9 W='290e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends NOR_PARAM
** End of subcircuit definition.

** Library name: mycells45
** Cell name: xor_param
** View name: schematic
.subckt xor_param a a_inv b b_inv f
m3 net19 a_inv 0 0 NMOS_VTL L=50e-9 W='180e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 f b_inv net19 0 NMOS_VTL L=50e-9 W='180e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 f a net20 0 NMOS_VTL L=50e-9 W='180e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 net20 b 0 0 NMOS_VTL L=50e-9 W='180e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m7 f a_inv net17 vdd! PMOS_VTL L=50e-9 W='290e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m6 net17 b vdd! vdd! PMOS_VTL L=50e-9 W='290e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m5 net18 b_inv vdd! vdd! PMOS_VTL L=50e-9 W='290e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 f a net18 vdd! PMOS_VTL L=50e-9 W='290e-9*size' AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends xor_param
** End of subcircuit definition.

** Library name: mycells45
** Cell name: half_adder_param
** View name: schematic
.subckt half_adder_param a b cout s
xi10 a_inv b_inv cout NOR_PARAM size=size
xi11 a a_inv b b_inv s xor_param size=size
xi9 b b_inv inverter_param size=size
xi8 a a_inv inverter_param size=size
.ends half_adder_param
** End of subcircuit definition.

** Library name: mycells45
** Cell name: INC_5bit
** View name: schematic
.subckt INC_5bit a<4> a<3> a<2> a<1> a<0> of z<4> z<3> z<2> z<1> z<0>
xi0 a<0> z<0> inverter_param size=1
xi1 a<0> a<1> net5 z<1> half_adder_param size=1
xi4 net7 a<4> of z<4> half_adder_param size=1
xi3 net6 a<3> net7 z<3> half_adder_param size=1
xi2 net5 a<2> net6 z<2> half_adder_param size=1
.ends INC_5bit
** End of subcircuit definition.

** Library name: mycells45
** Cell name: INC_6bit
** View name: schematic
.subckt INC_6bit a<5> a<4> a<3> a<2> a<1> a<0> of z<5> z<4> z<3> z<2> z<1> z<0>
xi0 a<0> z<0> inverter_param size=1
xi1 a<0> a<1> net5 z<1> half_adder_param size=1
xi5 net8 a<5> of z<5> half_adder_param size=1
xi4 net7 a<4> net8 z<4> half_adder_param size=1
xi3 net6 a<3> net7 z<3> half_adder_param size=1
xi2 net5 a<2> net6 z<2> half_adder_param size=1
.ends INC_6bit
** End of subcircuit definition.

** Library name: mycells45
** Cell name: COMPARATOR_5bit
** View name: schematic
.subckt COMPARATOR_5bit a<4> a<3> a<2> a<1> a<0> b<4> b<3> b<2> b<1> b<0> out
xi4 a<0> a_inv<0> b<0> b_inv<0> net5 xor_param size=1
xi3 a<1> a_inv<1> b<1> b_inv<1> net1 xor_param size=1
xi2 a<2> a_inv<2> b<2> b_inv<2> net2 xor_param size=1
xi1 a<3> a_inv<3> b<3> b_inv<3> net3 xor_param size=1
xi0 a<4> a_inv<4> b<4> b_inv<4> net4 xor_param size=1
xi5 net7 net6 net8 NAND_PARAM size=1
xi11 net2 net1 net6 NOR_PARAM size=1
xi10 net4 net3 net7 NOR_PARAM size=1
xi12 net8 net5 out NOR_PARAM size=1
xi13<4> a<4> a_inv<4> inverter_param size=1
xi13<3> a<3> a_inv<3> inverter_param size=1
xi13<2> a<2> a_inv<2> inverter_param size=1
xi13<1> a<1> a_inv<1> inverter_param size=1
xi13<0> a<0> a_inv<0> inverter_param size=1
xi14<4> b<4> b_inv<4> inverter_param size=1
xi14<3> b<3> b_inv<3> inverter_param size=1
xi14<2> b<2> b_inv<2> inverter_param size=1
xi14<1> b<1> b_inv<1> inverter_param size=1
xi14<0> b<0> b_inv<0> inverter_param size=1
.ends COMPARATOR_5bit
** End of subcircuit definition.

** Library name: mycells45
** Cell name: ACCELERATOR_CTRL
** View name: schematic
.subckt ACCELERATOR_CTRL buffer_blk_addr<5> buffer_blk_addr<4> buffer_blk_addr<3> buffer_blk_addr<2> buffer_blk_addr<1> buffer_blk_addr<0> buffer_flip buffer_init clk l1_weight_num<4> l1_weight_num<3> l1_weight_num<2> l1_weight_num<1> l1_weight_num<0> reset sram_addr<4> sram_addr<3> sram_addr<2> sram_addr<1> sram_addr<0> sram_ren sram_wen start state<5> state<4> state<3> state<2> state<1> state<0> tot_weight_num<4> tot_weight_num<3> tot_weight_num<2> tot_weight_num<1> tot_weight_num<0> layer
xi0 reset state<5> clk register
xi42<4> net053<0> sram_addr<4> weight_addr_reset clk register_sync_reset
xi42<3> net053<1> sram_addr<3> weight_addr_reset clk register_sync_reset
xi42<2> net053<2> sram_addr<2> weight_addr_reset clk register_sync_reset
xi42<1> net053<3> sram_addr<1> weight_addr_reset clk register_sync_reset
xi42<0> net053<4> sram_addr<0> weight_addr_reset clk register_sync_reset
xi43<5> net051<0> buffer_blk_addr<5> blk_addr_reset clk register_sync_reset
xi43<4> net051<1> buffer_blk_addr<4> blk_addr_reset clk register_sync_reset
xi43<3> net051<2> buffer_blk_addr<3> blk_addr_reset clk register_sync_reset
xi43<2> net051<3> buffer_blk_addr<2> blk_addr_reset clk register_sync_reset
xi43<1> net051<4> buffer_blk_addr<1> blk_addr_reset clk register_sync_reset
xi43<0> net051<5> buffer_blk_addr<0> blk_addr_reset clk register_sync_reset
xi5 next_state<0> state<0> reset clk register_sync_reset
xi4 next_state<1> state<1> reset clk register_sync_reset
xi3 next_state<2> state<2> reset clk register_sync_reset
xi2 next_state<3> state<3> reset clk register_sync_reset
xi1 next_state<4> state<4> reset clk register_sync_reset
xi62 net065 net064 buffer_flip NOR_PARAM size=1
xi58 weight_addr_exceed layer1_addr_exceed net065 NOR_PARAM size=1
xi49 state<1> state<0> net070 NOR_PARAM size=1
xi36 net022 net021 net025 NOR_PARAM size=1
xi30 state<2> net029 net028 NOR_PARAM size=1
xi10 state<5> net038 net037 NOR_PARAM size=1
xi57 net065 sram_ren blk_addr_reset NAND_PARAM size=1
xi34 state<0> weight_addr_exceed_inv net026 NAND_PARAM size=1
xi32 layer1_addr_exceed state<1> net027 NAND_PARAM size=1
xi28 net017 state<1> net030 NAND_PARAM size=1
xi25 state<3> start net031 NAND_PARAM size=1
xi21 weight_addr_exceed state<0> net032 NAND_PARAM size=1
xi19 weight_addr_exceed state<4> net033 NAND_PARAM size=1
xi17 state<3> net018 net036 NAND_PARAM size=1
xi11 weight_addr_exceed_inv state<4> net039 NAND_PARAM size=1
xi65 net067 layer inverter_param size=1
xi64 state<0> net067 inverter_param size=1
xi63 sram_ren net064 inverter_param size=1
xi56 net071 buffer_init inverter_param size=1
xi55 state<2> net071 inverter_param size=1
xi53 net068 sram_wen inverter_param size=1
xi52 state<4> net068 inverter_param size=1
xi51 net070 sram_ren inverter_param size=1
xi37 net025 next_state<0> inverter_param size=1
xi35 net026 net021 inverter_param size=1
xi33 net027 net022 inverter_param size=1
xi31 net028 next_state<1> inverter_param size=1
xi29 net030 net029 inverter_param size=1
xi27 layer1_addr_exceed net017 inverter_param size=1
xi26 net031 next_state<2> inverter_param size=1
xi24 net034 next_state<3> inverter_param size=1
xi22 net032 net035 inverter_param size=1
xi20 net033 net024 inverter_param size=1
xi18 net036 net023 inverter_param size=1
xi15 weight_addr_exceed weight_addr_exceed_inv inverter_param size=1
xi14 net037 next_state<4> inverter_param size=1
xi16 start net018 inverter_param size=1
xi12 net039 net038 inverter_param size=1
xi54 state<0> state<1> state<4> weight_addr_reset NOR3_PARAM size=1
xi23 net024 net035 net023 net034 NOR3_PARAM size=1
xi40 sram_addr<4> sram_addr<3> sram_addr<2> sram_addr<1> sram_addr<0> net057 net053<0> net053<1> net053<2> net053<3> net053<4> INC_5bit
xi41 buffer_blk_addr<5> buffer_blk_addr<4> buffer_blk_addr<3> buffer_blk_addr<2> buffer_blk_addr<1> buffer_blk_addr<0> net058 net051<0> net051<1> net051<2> net051<3> net051<4> net051<5> INC_6bit
xi48 sram_addr<4> sram_addr<3> sram_addr<2> sram_addr<1> sram_addr<0> l1_weight_num<4> l1_weight_num<3> l1_weight_num<2> l1_weight_num<1> l1_weight_num<0> layer1_addr_exceed COMPARATOR_5bit
xi46 sram_addr<4> sram_addr<3> sram_addr<2> sram_addr<1> sram_addr<0> tot_weight_num<4> tot_weight_num<3> tot_weight_num<2> tot_weight_num<1> tot_weight_num<0> weight_addr_exceed COMPARATOR_5bit
.ends ACCELERATOR_CTRL
** End of subcircuit definition.

** Library name: quant45
** Cell name: relu
** View name: schematic
.subckt relu a<0> a<1> a<2> a<3> b<0> b<1> b<2> b<3> en
xi7 a<3> 0 b<3> net11 TG_mux2_1
xi8 a<2> 0 b<2> net11 TG_mux2_1
xi10 a<0> 0 b<0> net11 TG_mux2_1
xi9 a<1> 0 b<1> net11 TG_mux2_1
xi12 a<3> en net23 NAND_PARAM size=1
xi13 net23 net11 inverter_param size=1
.ends relu
** End of subcircuit definition.

** Library name: quant45
** Cell name: log_shift
** View name: schematic
.subckt log_shift a<0> a<10> a<11> a<1> a<2> a<3> a<4> a<5> a<6> a<7> a<8> a<9> b<0> b<10> b<11> b<1> b<2> b<3> b<4> b<5> b<6> b<7> b<8> b<9> sh<0> sh<1> sh<2>
m318 net87 sh<2> b<0> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m317 net83 net338 b<0> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m312 net84 net338 b<1> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m311 net88 sh<2> b<1> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m310 net89 sh<2> b<2> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m309 net85 net338 b<2> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m304 net86 net338 b<3> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m303 net90 sh<2> b<3> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m302 net91 sh<2> b<4> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m301 net87 net338 b<4> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m296 net88 net338 b<5> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m295 net92 sh<2> b<5> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m294 net93 sh<2> b<6> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m293 net89 net338 b<6> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m288 net90 net338 b<7> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m287 net94 sh<2> b<7> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m286 a<11> sh<2> b<8> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m285 net91 net338 b<8> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m280 net92 net338 b<9> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m279 a<11> sh<2> b<9> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m278 a<11> sh<2> b<10> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m277 net93 net338 b<10> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m274 a<11> sh<2> b<11> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m269 net94 net338 b<11> 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m332 net078 sh<0> 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m258 net28 sh<1> net83 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m257 net26 net291 net83 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m252 net27 net291 net84 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m251 net29 sh<1> net84 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m250 net30 sh<1> net85 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m249 net28 net291 net85 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m244 net29 net291 net86 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m243 net31 sh<1> net86 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m242 net32 sh<1> net87 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m241 net30 net291 net87 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m236 net31 net291 net88 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m235 net33 sh<1> net88 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m234 net34 sh<1> net89 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m233 net32 net291 net89 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m228 net33 net291 net90 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m227 net35 sh<1> net90 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m226 net36 sh<1> net91 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m225 net34 net291 net91 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m220 net35 net291 net92 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m219 net37 sh<1> net92 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m218 a<11> sh<1> net93 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m217 net36 net291 net93 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m214 a<11> sh<1> net94 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m209 net37 net291 net94 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m199 a<1> sh<0> net26 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m198 a<0> net078 net26 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m193 a<1> net078 net27 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m192 a<2> sh<0> net27 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m191 a<3> sh<0> net28 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m190 a<2> net078 net28 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m185 a<3> net078 net29 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m184 a<4> sh<0> net29 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m183 a<5> sh<0> net30 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m182 a<4> net078 net30 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m177 a<5> net078 net31 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m176 a<6> sh<0> net31 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m175 a<7> sh<0> net32 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m174 a<6> net078 net32 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m169 a<7> net078 net33 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m168 a<8> sh<0> net33 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m167 a<9> sh<0> net34 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m166 a<8> net078 net34 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m161 a<9> net078 net35 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m160 a<10> sh<0> net35 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m159 a<11> sh<0> net36 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m158 a<10> net078 net36 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m152 a<11> sh<0> net37 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m153 a<11> net078 net37 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m334 net338 sh<2> 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m333 net291 sh<1> 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 net94 net291 a<11> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m5 b<11> net338 a<11> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m10 net93 net291 a<11> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m16 net92 net291 net37 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m11 b<10> net338 a<11> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m17 b<9> net338 a<11> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m22 net91 net291 net36 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m28 net90 net291 net35 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m23 b<8> net338 a<11> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m29 b<7> net338 net94 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m32 net33 sh<0> a<7> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m38 b<6> sh<2> net89 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m37 net89 sh<1> net32 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m41 net31 net078 a<6> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m46 net87 net291 net32 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m52 net86 net291 net31 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m47 net30 net078 a<5> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m53 net29 net078 a<4> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m58 net85 sh<1> net28 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m62 b<1> net338 net88 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m59 net28 sh<0> a<2> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m67 net83 net291 net28 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m68 b<0> net338 net87 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m74 b<3> sh<2> net86 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m71 net26 sh<0> a<0> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 net078 sh<0> vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m6 b<11> sh<2> net94 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m9 net36 net078 a<11> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m15 net35 net078 a<10> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m12 b<10> sh<2> net93 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m18 b<9> sh<2> net92 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m21 net34 net078 a<9> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m27 net33 net078 a<8> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m24 b<8> sh<2> net91 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m30 b<7> sh<2> net90 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m33 net32 net078 a<7> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m39 b<5> net338 net92 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m36 net32 sh<0> a<6> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m42 net31 sh<0> a<5> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m45 b<4> net338 net91 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m51 b<3> net338 net90 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m48 net30 sh<0> a<4> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m54 net28 net078 a<3> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m57 b<2> sh<2> net85 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m63 b<1> sh<2> net84 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m60 net27 net078 a<2> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m66 net26 net078 a<1> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m69 b<0> sh<2> net83 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m72 net29 sh<0> a<3> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 net338 sh<2> vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m7 net94 sh<1> net37 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m8 net37 sh<0> a<11> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m14 net36 sh<0> a<10> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m13 net93 sh<1> net36 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m19 net92 sh<1> net35 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m20 net35 sh<0> a<9> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m26 net34 sh<0> a<8> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m25 net91 sh<1> net34 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m31 net90 sh<1> net33 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m34 net89 net291 net34 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m40 net88 net291 net33 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m35 b<6> net338 net93 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m43 net88 sh<1> net31 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m44 b<5> sh<2> net88 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m50 b<4> sh<2> net87 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m49 net87 sh<1> net30 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m55 net85 net291 net30 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m56 b<2> net338 net89 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m64 net84 sh<1> net27 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m61 net84 net291 net29 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m65 net27 sh<0> a<1> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m70 net83 sh<1> net26 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 net37 net078 a<11> vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m73 net86 sh<1> net29 vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 net291 sh<1> vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends log_shift
** End of subcircuit definition.

** Library name: quant45
** Cell name: quantization
** View name: schematic
.subckt quantization a<0> a<10> a<11> a<1> a<2> a<3> a<4> a<5> a<6> a<7> a<8> a<9> b<0> b<1> b<2> b<3> sh<0> sh<1> sh<2> relu_en
xi3 net42 net41 net40 net39 b<0> b<1> b<2> b<3> relu_en relu
xi2 a<0> a<10> a<11> a<1> a<2> a<3> a<4> a<5> a<6> a<7> a<8> a<9> net42 net030 net031 net41 net40 net39 net024 net025 net026 net027 net028 net029 sh<0> sh<1> sh<2> log_shift
.ends quantization
** End of subcircuit definition.