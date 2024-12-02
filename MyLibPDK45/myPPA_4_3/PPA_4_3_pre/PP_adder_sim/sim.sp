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

.PARAM 
+	PERIOD=1n
+	VDD_VAL=0.7
+	T_START=0
+	T_END="128*PERIOD"
+	T_STEP=1p

.TRAN T_STEP T_END START=T_START

* INCLUDE THE MODEL LIBRARIES.
.INCLUDE "./models/PMOS_VTL.inc"
.INCLUDE "./models/NMOS_VTL.inc"

* SPECIFY THE SIGNALS WE WANT TO MONITOR. PLEASE DO NOT MODIFY!
.PROBE TRAN
+	V(s<0>)
+	V(s<1>)
+	V(s<2>)
+	V(s<3>)
+	V(s<4>)
+	V(s<5>)
+	V(a<0>)
+	V(a<1>)
+	V(a<2>)
+	V(a<3>)
+	V(b<0>)
+	V(b<1>)
+	V(b<2>)

* YOU CAN MONITOR MORE SIGNALS FOR DEBUGGING HERE
.PROBE TRAN
+	V(vdd!)


* PLEASE INCLUDE YOUR MODULE FILE HERE.
.INCLUDE "../myPPA.sp"

* PLEASE INSTANTIATE YOUR MODULE HERE.
xi0 i0<3> i0<2> i0<1> i0<0> i1<3> i1<2> i1<1> i1<0> i2<3> i2<2> i2<1> i2<0> s<5> s<4> s<3> s<2> s<1> s<0> myPPA_4_3

* TEST CIRCUIT. DO NOT MODIFY!
v0 vdd! 0 DC=vdd_val
v7 a<0> 0 PULSE vdd_val 0 0 0 0 '1*PERIOD' '2*PERIOD'
v6 a<1> 0 PULSE vdd_val 0 0 0 0 '2*PERIOD' '4*PERIOD'
v5 a<2> 0 PULSE vdd_val 0 0 0 0 '4*PERIOD' '8*PERIOD'
v4 a<3> 0 PULSE vdd_val 0 0 0 0 '8*PERIOD' '16*PERIOD'
v3 b<0> 0 PULSE vdd_val 0 0 0 0 '16*PERIOD' '32*PERIOD'
v2 b<1> 0 PULSE vdd_val 0 0 0 0 '32*PERIOD' '64*PERIOD'
v1 b<2> 0 PULSE vdd_val 0 0 0 0 '64*PERIOD' '128*PERIOD'
c0<5> s<5> 0 1e-14
c0<4> s<4> 0 1e-14
c0<3> s<3> 0 1e-14
c0<2> s<2> 0 1e-14
c0<1> s<1> 0 1e-14
c0<0> s<0> 0 1e-14
e11 i2<3> 0 VCVS POLY(2) a<3> 0 b<2> 0  0  0  0  0  '1/vdd_val'
e10 i2<2> 0 VCVS POLY(2) a<2> 0 b<2> 0  0  0  0  0  '1/vdd_val'
e9 i2<1> 0 VCVS POLY(2) a<1> 0 b<2> 0  0  0  0  0  '1/vdd_val'
e8 i2<0> 0 VCVS POLY(2) a<0> 0 b<2> 0  0  0  0  0  '1/vdd_val'
e7 i1<3> 0 VCVS POLY(2) a<3> 0 b<1> 0  0  0  0  0  '1/vdd_val'
e6 i1<2> 0 VCVS POLY(2) a<2> 0 b<1> 0  0  0  0  0  '1/vdd_val'
e5 i1<1> 0 VCVS POLY(2) a<1> 0 b<1> 0  0  0  0  0  '1/vdd_val'
e4 i1<0> 0 VCVS POLY(2) a<0> 0 b<1> 0  0  0  0  0  '1/vdd_val'
e3 i0<0> 0 VCVS POLY(2) a<0> 0 b<0> 0  0  0  0  0  '1/vdd_val'
e2 i0<1> 0 VCVS POLY(2) a<1> 0 b<0> 0  0  0  0  0  '1/vdd_val'
e1 i0<2> 0 VCVS POLY(2) a<2> 0 b<0> 0  0  0  0  0  '1/vdd_val'
e0 i0<3> 0 VCVS POLY(2) a<3> 0 b<0> 0  0  0  0  0  '1/vdd_val'

* MEASURE POWER CONSUMPTION
.MEAS AVG_POWER AVG "-P(V0)" FROM T_START TO T_END

.END
