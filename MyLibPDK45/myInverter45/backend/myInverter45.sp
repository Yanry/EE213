* SPICE NETLIST
***************************************

.SUBCKT myInverter45 in gnd! vdd! out
** N=4 EP=4 IP=0 FDC=2
M0 out in gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.08e-14 AS=1.08e-14 PD=4.2e-07 PS=4.2e-07 $X=140 $Y=-640 $D=1
M1 out in vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.16e-14 AS=2.16e-14 PD=6e-07 PS=6e-07 $X=140 $Y=260 $D=0
.ENDS
***************************************
