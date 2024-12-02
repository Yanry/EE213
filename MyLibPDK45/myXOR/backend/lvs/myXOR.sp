* SPICE NETLIST
***************************************

.SUBCKT myXOR gnd! vdd! B A Z
** N=6 EP=5 IP=0 FDC=6
M0 5 B gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=-8715 $Y=2570 $D=1
M1 Z A 5 5 NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=-7105 $Y=2570 $D=1
M2 A 5 Z gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=-5495 $Y=2575 $D=1
M3 5 B vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=-8715 $Y=3470 $D=0
M4 Z A B B PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=-7105 $Y=3470 $D=0
M5 A B Z vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=-5495 $Y=3470 $D=0
.ENDS
***************************************
