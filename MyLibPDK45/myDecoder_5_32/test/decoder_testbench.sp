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

.PARAM 
+	PERIOD=5n
+	VDD_VAL=0.7
+	T_START=0
+	T_END="32*PERIOD"
+	T_STEP=1p

.TRAN T_STEP T_END START=T_START

* SPECIFY THE SIGNALS WE WANT TO MONITOR. PLEASE DO NOT MODIFY!
.PROBE TRAN
+	V(addr<4>)
+	V(addr<3>)
+	V(addr<2>)
+	V(addr<1>)
+	V(addr<0>)
+	V(wl<31>)
+	V(wl<30>)
+	V(wl<29>)
+	V(wl<28>)
+	V(wl<27>)

* YOU CAN MONITOR MORE SIGNALS FOR DEBUGGING HERE
.PROBE TRAN
+	V(vdd!)


* PLEASE INCLUDE YOUR MODULE FILE HERE.
.INCLUDE "./decoder.sp"

* PLEASE INSTANTIATE YOUR MODULE HERE.
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

* TEST CIRCUIT. DO NOT MODIFY!
v0 vdd! 0 DC=vdd_val
v7 addr<0> 0 PULSE vdd_val 0 0 0 0 '1*PERIOD' '2*PERIOD'
v6 addr<1> 0 PULSE vdd_val 0 0 0 0 '2*PERIOD' '4*PERIOD'
v5 addr<2> 0 PULSE vdd_val 0 0 0 0 '4*PERIOD' '8*PERIOD'
v4 addr<3> 0 PULSE vdd_val 0 0 0 0 '8*PERIOD' '16*PERIOD'
v3 addr<4> 0 PULSE vdd_val 0 0 0 0 '16*PERIOD' '32*PERIOD'
c0<4> wl<31> 0 1e-14
c0<3> wl<30> 0 1e-14
c0<2> wl<29> 0 1e-14
c0<1> wl<28> 0 1e-14
c0<0> wl<27> 0 1e-14

* MEASURE POWER CONSUMPTION
.MEAS AVG_POWER AVG "-P(V0)" FROM T_START TO T_END

.END
