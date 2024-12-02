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
.SUBCKT myInverter45 in gnd! vdd! out
** N=4 EP=4 IP=8 FDC=2
X0 gnd! gnd! out in myNMOS $T=100 -545 0 0 $X=-550 $Y=-735
X1 vdd! vdd! out in myPMOS $T=55 445 0 0 $X=-550 $Y=120
.ENDS
***************************************
.SUBCKT myHA gnd! vdd! Cout B A S
** N=9 EP=6 IP=12 FDC=12
M0 9 B 5 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.08e-14 PD=4.8e-07 PS=4.2e-07 $X=-3485 $Y=-1095 $D=1
M1 gnd! A 9 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.35e-14 PD=4.2e-07 PS=4.8e-07 $X=-3085 $Y=-1095 $D=1
M2 7 B gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=-1310 $Y=-1155 $D=1
M3 S A 7 7 NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=300 $Y=-1155 $D=1
M4 5 B vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.16e-14 PD=6.6e-07 PS=6e-07 $X=-3485 $Y=-245 $D=0
M5 vdd! A 5 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.7e-14 PD=6e-07 PS=6.6e-07 $X=-3085 $Y=-245 $D=0
M6 7 B vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=-1310 $Y=-255 $D=0
M7 S A B B PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=300 $Y=-255 $D=0
X8 gnd! S A 7 myNMOS $T=1870 -1105 0 0 $X=1220 $Y=-1295
X9 vdd! S A B myPMOS $T=1825 -70 0 0 $X=1220 $Y=-395
X10 5 gnd! vdd! Cout myInverter45 $T=-4655 -505 1 180 $X=-5265 $Y=-1425
.ENDS
***************************************
.SUBCKT myFA A B Cin gnd! vdd! Cout S
** N=19 EP=7 IP=8 FDC=28
M0 4 A gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.08e-14 PD=4.8e-07 PS=4.2e-07 $X=-255 $Y=-530 $D=1
M1 gnd! B 4 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.35e-14 PD=4.2e-07 PS=4.8e-07 $X=145 $Y=-530 $D=1
M2 1 Cin 4 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=885 $Y=-530 $D=1
M3 17 A 1 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.08e-14 PD=4.8e-07 PS=4.2e-07 $X=1625 $Y=-530 $D=1
M4 gnd! B 17 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.35e-14 PD=4.2e-07 PS=4.8e-07 $X=2025 $Y=-530 $D=1
M5 10 A gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.08e-14 PD=4.8e-07 PS=4.2e-07 $X=3930 $Y=-530 $D=1
M6 gnd! B 10 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.35e-14 PD=4.8e-07 PS=4.8e-07 $X=4330 $Y=-530 $D=1
M7 10 Cin gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.35e-14 PD=4.2e-07 PS=4.8e-07 $X=4730 $Y=-530 $D=1
M8 12 1 10 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=5470 $Y=-530 $D=1
M9 18 Cin 12 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.08e-14 PD=4.8e-07 PS=4.2e-07 $X=6210 $Y=-530 $D=1
M10 19 A 18 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.35e-14 PD=4.8e-07 PS=4.8e-07 $X=6610 $Y=-530 $D=1
M11 gnd! B 19 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.35e-14 PD=4.2e-07 PS=4.8e-07 $X=7010 $Y=-530 $D=1
M12 5 A vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.16e-14 PD=6.6e-07 PS=6e-07 $X=-255 $Y=320 $D=0
M13 vdd! B 5 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.7e-14 PD=6e-07 PS=6.6e-07 $X=145 $Y=320 $D=0
M14 1 Cin 5 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=885 $Y=320 $D=0
M15 14 A 1 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.16e-14 PD=6.6e-07 PS=6e-07 $X=1625 $Y=320 $D=0
M16 vdd! B 14 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.7e-14 PD=6e-07 PS=6.6e-07 $X=2025 $Y=320 $D=0
M17 11 A vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.16e-14 PD=6.6e-07 PS=6e-07 $X=3930 $Y=320 $D=0
M18 vdd! B 11 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.7e-14 PD=6.6e-07 PS=6.6e-07 $X=4330 $Y=320 $D=0
M19 11 Cin vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.7e-14 PD=6e-07 PS=6.6e-07 $X=4730 $Y=320 $D=0
M20 12 1 11 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=5470 $Y=320 $D=0
M21 15 Cin 12 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.16e-14 PD=6.6e-07 PS=6e-07 $X=6210 $Y=320 $D=0
M22 16 A 15 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.7e-14 PD=6.6e-07 PS=6.6e-07 $X=6610 $Y=320 $D=0
M23 vdd! B 16 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.7e-14 PD=6e-07 PS=6.6e-07 $X=7010 $Y=320 $D=0
X24 1 gnd! vdd! Cout myInverter45 $T=3050 60 0 0 $X=2500 $Y=-860
X25 12 gnd! vdd! S myInverter45 $T=7950 60 0 0 $X=7400 $Y=-860
.ENDS
***************************************
.SUBCKT myPPA_unsigned_4_3 gnd! vdd! S<1> A0<3> A0<2> A1<2> A1<1> A0<1> A1<3> A1<0> A0<0> S<0> A2<3> A2<2> A2<1> A2<0> Cout S<2> S<5> S<4>
+ S<3>
** N=32 EP=21 IP=61 FDC=180
X0 A0<0> gnd! vdd! 18 myInverter45 $T=2595 -3125 0 0 $X=2045 $Y=-4045
X1 18 gnd! vdd! S<0> myInverter45 $T=4025 -3125 0 0 $X=3475 $Y=-4045
X2 gnd! vdd! 26 A1<3> 1 10 myHA $T=-3825 -11265 1 180 $X=-6205 $Y=-12850
X3 gnd! vdd! 16 A1<0> A0<1> S<1> myHA $T=-3825 -2620 1 180 $X=-6205 $Y=-4205
X4 gnd! vdd! 21 19 A2<0> S<2> myHA $T=10315 -2620 0 0 $X=5050 $Y=-4205
X5 2 A0<3> A1<2> gnd! vdd! 1 25 myFA $T=-5260 -8775 0 0 $X=-6205 $Y=-10155
X6 16 A0<2> A1<1> gnd! vdd! 2 19 myFA $T=-5260 -5720 0 0 $X=-6205 $Y=-7100
X7 5 A2<3> 26 gnd! vdd! Cout S<5> myFA $T=4790 -11830 0 0 $X=3845 $Y=-13210
X8 6 A2<2> 10 gnd! vdd! 5 S<4> myFA $T=4790 -8775 0 0 $X=3845 $Y=-10155
X9 21 A2<1> 25 gnd! vdd! 6 S<3> myFA $T=4790 -5720 0 0 $X=3845 $Y=-7100
.ENDS
***************************************
