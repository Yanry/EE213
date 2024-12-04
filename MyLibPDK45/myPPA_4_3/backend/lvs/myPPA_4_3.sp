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
M0 9 B 7 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.08e-14 PD=4.8e-07 PS=4.2e-07 $X=-3485 $Y=-1095 $D=1
M1 gnd! A 9 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.35e-14 PD=4.2e-07 PS=4.8e-07 $X=-3085 $Y=-1095 $D=1
M2 8 B gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=-1310 $Y=-1155 $D=1
M3 S A 8 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=300 $Y=-1155 $D=1
M4 7 B vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.16e-14 PD=6.6e-07 PS=6e-07 $X=-3485 $Y=-245 $D=0
M5 vdd! A 7 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.7e-14 PD=6e-07 PS=6.6e-07 $X=-3085 $Y=-245 $D=0
M6 8 B vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=-1310 $Y=-255 $D=0
M7 S A B vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=300 $Y=-255 $D=0
X8 gnd! S A 8 myNMOS $T=1870 -1105 0 0 $X=1220 $Y=-1295
X9 vdd! S A B myPMOS $T=1825 -70 0 0 $X=1220 $Y=-395
X10 7 gnd! vdd! Cout myInverter45 $T=-4655 -505 1 180 $X=-5265 $Y=-1425
.ENDS
***************************************
.SUBCKT myFA A B Cin gnd! vdd! Cout S
** N=19 EP=7 IP=8 FDC=28
M0 9 A gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.08e-14 PD=4.8e-07 PS=4.2e-07 $X=-255 $Y=-530 $D=1
M1 gnd! B 9 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.35e-14 PD=4.2e-07 PS=4.8e-07 $X=145 $Y=-530 $D=1
M2 8 Cin 9 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=885 $Y=-530 $D=1
M3 17 A 8 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.08e-14 PD=4.8e-07 PS=4.2e-07 $X=1625 $Y=-530 $D=1
M4 gnd! B 17 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.35e-14 PD=4.2e-07 PS=4.8e-07 $X=2025 $Y=-530 $D=1
M5 11 A gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.08e-14 PD=4.8e-07 PS=4.2e-07 $X=3930 $Y=-530 $D=1
M6 gnd! B 11 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.35e-14 PD=4.8e-07 PS=4.8e-07 $X=4330 $Y=-530 $D=1
M7 11 Cin gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.35e-14 PD=4.2e-07 PS=4.8e-07 $X=4730 $Y=-530 $D=1
M8 13 8 11 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=5470 $Y=-530 $D=1
M9 18 Cin 13 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.08e-14 PD=4.8e-07 PS=4.2e-07 $X=6210 $Y=-530 $D=1
M10 19 A 18 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.35e-14 AS=1.35e-14 PD=4.8e-07 PS=4.8e-07 $X=6610 $Y=-530 $D=1
M11 gnd! B 19 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.35e-14 PD=4.2e-07 PS=4.8e-07 $X=7010 $Y=-530 $D=1
M12 10 A vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.16e-14 PD=6.6e-07 PS=6e-07 $X=-255 $Y=320 $D=0
M13 vdd! B 10 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.7e-14 PD=6e-07 PS=6.6e-07 $X=145 $Y=320 $D=0
M14 8 Cin 10 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=885 $Y=320 $D=0
M15 14 A 8 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.16e-14 PD=6.6e-07 PS=6e-07 $X=1625 $Y=320 $D=0
M16 vdd! B 14 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.7e-14 PD=6e-07 PS=6.6e-07 $X=2025 $Y=320 $D=0
M17 12 A vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.16e-14 PD=6.6e-07 PS=6e-07 $X=3930 $Y=320 $D=0
M18 vdd! B 12 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.7e-14 PD=6.6e-07 PS=6.6e-07 $X=4330 $Y=320 $D=0
M19 12 Cin vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.7e-14 PD=6e-07 PS=6.6e-07 $X=4730 $Y=320 $D=0
M20 13 8 12 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=5470 $Y=320 $D=0
M21 15 Cin 13 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.16e-14 PD=6.6e-07 PS=6e-07 $X=6210 $Y=320 $D=0
M22 16 A 15 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.7e-14 PD=6.6e-07 PS=6.6e-07 $X=6610 $Y=320 $D=0
M23 vdd! B 16 vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.7e-14 PD=6e-07 PS=6.6e-07 $X=7010 $Y=320 $D=0
X24 8 gnd! vdd! Cout myInverter45 $T=3050 60 0 0 $X=2500 $Y=-860
X25 13 gnd! vdd! S myInverter45 $T=7950 60 0 0 $X=7400 $Y=-860
.ENDS
***************************************
.SUBCKT myPPA_4_3 gnd! vdd! A1<3> A0<3> S<1> A0<2> A1<2> A1<1> A0<1> A1<0> A0<0> A2<2> S<0> A2<3> A2<0> A2<1> S<5> S<4> S<2> S<3>
** N=45 EP=20 IP=106 FDC=254
X0 A1<3> gnd! vdd! 12 myInverter45 $T=-11550 -5615 0 0 $X=-12100 $Y=-6535
X1 A0<3> gnd! vdd! 13 myInverter45 $T=-11550 -2560 0 0 $X=-12100 $Y=-3480
X2 A0<0> gnd! vdd! 24 myInverter45 $T=-1815 3030 0 0 $X=-2365 $Y=2110
X3 A2<2> gnd! vdd! 25 myInverter45 $T=-1720 -5615 0 0 $X=-2270 $Y=-6535
X4 24 gnd! vdd! S<0> myInverter45 $T=-385 3030 0 0 $X=-935 $Y=2110
X5 A2<0> gnd! vdd! 33 myInverter45 $T=9295 3020 1 180 $X=8685 $Y=2100
X6 A2<1> gnd! vdd! 30 myInverter45 $T=10865 3020 1 180 $X=10255 $Y=2100
X7 gnd! vdd! 32 12 1 16 myHA $T=-8235 -5110 1 180 $X=-10615 $Y=-6695
X8 gnd! vdd! 21 A1<0> A0<1> S<1> myHA $T=-8235 3535 1 180 $X=-10615 $Y=1950
X9 gnd! vdd! 28 26 33 35 myHA $T=5905 3535 0 0 $X=640 $Y=1950
X10 gnd! vdd! 45 36 7 S<5> myHA $T=14995 -5110 0 0 $X=9730 $Y=-6695
X11 gnd! vdd! 7 37 9 S<4> myHA $T=14995 -2055 0 0 $X=9730 $Y=-3640
X12 gnd! vdd! 8 35 vdd! S<2> myHA $T=17075 3525 0 0 $X=11810 $Y=1940
X13 2 13 A1<2> gnd! vdd! 1 31 myFA $T=-9670 -2620 0 0 $X=-10615 $Y=-4000
X14 21 A0<2> A1<1> gnd! vdd! 2 26 myFA $T=-9670 435 0 0 $X=-10615 $Y=-945
X15 5 A2<3> 32 gnd! vdd! 34 36 myFA $T=380 -5675 0 0 $X=-565 $Y=-7055
X16 6 25 16 gnd! vdd! 5 37 myFA $T=380 -2620 0 0 $X=-565 $Y=-4000
X17 28 30 31 gnd! vdd! 6 38 myFA $T=380 435 0 0 $X=-565 $Y=-945
X18 8 vdd! 38 gnd! vdd! 9 S<3> myFA $T=10480 435 0 0 $X=9535 $Y=-945
.ENDS
***************************************
