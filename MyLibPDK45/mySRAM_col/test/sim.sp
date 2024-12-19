* PARTIAL PRODUCT ADDER
* USE POST=2 TO OUTPUT ASCII FORMAT TR# FILE
.OPTION
+	INGOLD=2
+	PARHIER=LOCAL
+	POST=2
+	PROBE
+	NOMOD

.GLOBAL vdd!
.TEMP 25.0

* YOU SHOULD INCLUDE MODEL FILES
.INCLUDE "/home/centos/PDK/FreePDK45/ncsu_basekit/models/hspice/tran_models/models_nom/NMOS_VTL.inc"
.INCLUDE "/home/centos/PDK/FreePDK45/ncsu_basekit/models/hspice/tran_models/models_nom/PMOS_VTL.inc"

.INCLUDE "../../Project/SRAM.sp"
***********************************
* Set period time here 
***********************************
.PARAM 
+	PERIOD=10n
+	VDD_VAL=0.7
+	T_START=0
+	T_END="128*PERIOD"
+	T_STEP=1p
***********************************
*  Set prc low duration here
***********************************
.PARAM 
+ SRAM_PRC_LOW_DURATION = 'period/5'
.TRAN T_STEP T_END START=T_START

.PROBE TRAN
+ v(data<0>)
+ v(data_read<0>)
+ v(ADDR<4>)
+ v(ADDR<3>)
+ v(ADDR<2>)
+ v(ADDR<1>)
+ v(ADDR<0>)
+ v(sram_wen)
+ v(sram_ren)
+ v(prc)
+ v(wl<0>)
+ v(xi0.net75)

xi0 
+ addr<4> addr<3> addr<2> addr<1> addr<0> 
+ wl<0> wl<1> wl<2> wl<3>
+ wl<4> wl<5> wl<6> wl<7>
+ wl<8> wl<9> wl<10> wl<11>
+ wl<12> wl<13> wl<14> wl<15>
+ wl<16> wl<17> wl<18> wl<19>
+ wl<20> wl<21> wl<22> wl<23>
+ wl<24> wl<25> wl<26> wl<27>
+ wl<28> wl<29> wl<30> wl<31> 
+ myDecoder_5_32
xi1 data<0> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> mySRAM_col
** SRAM precharge
v7 prc 0 PULSE vdd_val 0 0 0 0 SRAM_PRC_LOW_DURATION period
v6 sram_wen 0 PULSE 0 vdd_val 0 0 0 'period*32' 'period*64'
v5 sram_ren 0 PULSE vdd_val 0 0 0 0 'period*32' 'period*64'
v4 addr<4> 0 PULSE vdd_val 0 0 0 0 'period*16' 'period*32'
v3 addr<3> 0 PULSE vdd_val 0 0 0 0 'period*8' 'period*16'
v2 addr<2> 0 PULSE vdd_val 0 0 0 0 'period*4' 'period*8'
v1 addr<1> 0 PULSE vdd_val 0 0 0 0 'period*2' 'period*4'
v0 addr<0> 0 PULSE vdd_val 0 0 0 0 'period*1' 'period*2'
v8 vdd! 0 DC=vdd_val
v9 data<0>  0 PULSE vdd_val 0 0 0 0 'period*2' 'period*4'
c0 data_read<0> 0 40e-15
