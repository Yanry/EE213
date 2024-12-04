* SPICE NETLIST
***************************************

.SUBCKT myNMOS 1 2 3 4
** N=4 EP=4 IP=0 FDC=1
M0 3 4 2 1 NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=40 $Y=-45 $D=1
.ENDS
***************************************
.SUBCKT myPMOS 1 2 3 4
** N=4 EP=4 IP=0 FDC=1
M0 3 4 2 1 PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=85 $Y=-185 $D=0
.ENDS
***************************************
.SUBCKT myHA gnd! vdd! Cout B A S
** N=9 EP=6 IP=16 FDC=12
M0 9 B 5 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.08e-14 PD=4.8e-07 PS=4.2e-07 $X=-3485 $Y=-1095 $D=1
M1 gnd! A 9 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.35e-14 PD=4.2e-07 PS=4.8e-07 $X=-3085 $Y=-1095 $D=1
M2 7 B gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=-1310 $Y=-1155 $D=1
M3 S A 7 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=300 $Y=-1155 $D=1
M4 5 B vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.16e-14 PD=6.6e-07 PS=6e-07 $X=-3485 $Y=-245 $D=0
M5 vdd! A 5 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.7e-14 PD=6e-07 PS=6.6e-07 $X=-3085 $Y=-245 $D=0
M6 7 B vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=-1310 $Y=-255 $D=0
M7 S A B vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=300 $Y=-255 $D=0
X8 gnd! gnd! Cout 5 myNMOS $T=-4755 -1050 1 180 $X=-5265 $Y=-1240
X9 gnd! S A 7 myNMOS $T=1870 -1105 0 0 $X=1220 $Y=-1295
X10 vdd! vdd! Cout 5 myPMOS $T=-4710 -60 1 180 $X=-5265 $Y=-385
X11 vdd! S A B myPMOS $T=1825 -70 0 0 $X=1220 $Y=-395
.ENDS
***************************************
