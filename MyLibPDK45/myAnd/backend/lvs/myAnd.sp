* SPICE NETLIST
***************************************

.SUBCKT myAnd A B gnd! vdd! Z
** N=7 EP=5 IP=0 FDC=6
M0 7 A gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.08e-14 PD=4.8e-07 PS=4.2e-07 $X=1035 $Y=1250 $D=1
M1 3 B 7 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.35e-14 PD=4.2e-07 PS=4.8e-07 $X=1435 $Y=1250 $D=1
M2 Z 3 gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=2955 $Y=1250 $D=1
M3 3 A vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.16e-14 PD=6.6e-07 PS=6e-07 $X=1035 $Y=2100 $D=0
M4 vdd! B 3 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.7e-14 PD=6e-07 PS=6.6e-07 $X=1435 $Y=2100 $D=0
M5 Z 3 vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=2955 $Y=2100 $D=0
.ENDS
***************************************
