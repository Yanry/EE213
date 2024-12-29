* SPICE NETLIST
***************************************

.SUBCKT myInverter45 in gnd! vdd! out
** N=4 EP=4 IP=0 FDC=2
M0 out in gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=140 $Y=-590 $D=1
M1 out in vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=140 $Y=260 $D=0
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
.SUBCKT myAdder_6bit vdd! Cin A<5> A<4> A<3> A<2> A<1> A<0> B<5> B<4> B<3> B<2> B<1> B<0> gnd! S<6> S<5> S<4> S<3> S<2>
+ S<1> S<0>
** N=29 EP=22 IP=49 FDC=196
X0 1 A<5> B<5> gnd! vdd! 29 S<6> myFA $T=-4515 -20485 0 0 $X=-5460 $Y=-21865
X1 2 A<5> B<5> gnd! vdd! 1 S<5> myFA $T=-4515 -17295 0 0 $X=-5460 $Y=-18675
X2 3 A<4> B<4> gnd! vdd! 2 S<4> myFA $T=-4515 -14105 0 0 $X=-5460 $Y=-15485
X3 4 A<3> B<3> gnd! vdd! 3 S<3> myFA $T=-4515 -10915 0 0 $X=-5460 $Y=-12295
X4 5 A<2> B<2> gnd! vdd! 4 S<2> myFA $T=-4515 -7725 0 0 $X=-5460 $Y=-9105
X5 6 A<1> B<1> gnd! vdd! 5 S<1> myFA $T=-4515 -4535 0 0 $X=-5460 $Y=-5915
X6 Cin A<0> B<0> gnd! vdd! 6 S<0> myFA $T=-4515 -1345 0 0 $X=-5460 $Y=-2725
.ENDS
***************************************
