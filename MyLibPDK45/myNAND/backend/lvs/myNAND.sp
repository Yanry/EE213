* SPICE NETLIST
***************************************

.SUBCKT myNAND A gnd! B Z vdd!
** N=6 EP=5 IP=0 FDC=4
M0 6 A gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.08e-14 PD=4.8e-07 PS=4.2e-07 $X=20 $Y=80 $D=1
M1 Z B 6 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.35e-14 PD=4.2e-07 PS=4.8e-07 $X=420 $Y=80 $D=1
M2 Z A vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.16e-14 PD=6.6e-07 PS=6e-07 $X=20 $Y=930 $D=0
M3 vdd! B Z vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.7e-14 PD=6e-07 PS=6.6e-07 $X=420 $Y=930 $D=0
.ENDS
***************************************
