*adder
.TEMP 25
.OPTION ACCURATE
.OPTION POST=2

.global vdd!

* YOU SHOULD INCLUDE MODEL FILES
.INCLUDE "/home/centos/PDK/FreePDK45/ncsu_basekit/models/hspice/tran_models/models_nom/NMOS_VTL.inc"
.INCLUDE "/home/centos/PDK/FreePDK45/ncsu_basekit/models/hspice/tran_models/models_nom/PMOS_VTL.inc"

* YOU SHOULD INCLUDE YOUR NELIST
.INCLUDE "./myNAND.sp"
xi0 A B Z myNAND

* YOU SHOULD ADD LOAD CAPACITANCE
c0 Z 0 1e-14

* YOU SHOULD GIVE INPUT PATTERNS FOR TEST CASES
* Input pattern for half adder test cases:  
* A: 0 0 1 1  
Vin1 A gnd PULSE (0v 0.7v 9.9n 0.1n 0.1n 9.9n 20n) 
* B: 0 1 0 1  
Vin2 B gnd PULSE (0v 0.7v 4.9n 0.1n 0.1n 4.9n 10n)

* YOU SHOULD GIVE PROPER INPUT PATTERNS FOR MAXIMUM DELAY

.PARAM PERIOD =20NS
.PARAM T0= 0.1NS
.PARAM T1= T0+PERIOD
.PARAM T2= T1+0.1NS
.PARAM STEP= 1PS

VDD   vdd! 0 0.7
VGND  gnd! 0 0

.TRAN STEP T2

* YOU SHOULD MAKE SURE THAT YOU ARE MEASURING THE CORRECT SIGNAL FOR MAXIMUM DELAY. BELOW IS JUST AN EXAMPLE.
* .MEASURE TRAN DELAY_COUT TRIG V(B) VAL= 0.35  RISE=2 TARG V(Cout) VAL= 0.35 RISE=1
* .MEASURE TRAN DELAY_S TRIG V(B) VAL= 0.35  RISE=1 TARG V(S) VAL= 0.35 RISE=1

.probe v(A) v(B) v(Z)
.END








