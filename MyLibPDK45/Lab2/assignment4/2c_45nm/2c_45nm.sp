** Generated for: hspiceD
** Generated on: Sep 29 21:52:48 2024
** Design library name: MyLibPDK45
** Design cell name: myInverter45TestBench
** Design view name: schematic
.GLOBAL vdd!
.PARAM vdd_val=1.1


.PROBE TRAN
+    V(out)
.TRAN 100e-15 200e-12 START=0.0 sweep vdd_val 0.4 1.1 0.1
.MEAS tran power avg P(xi0)

.TEMP 25.0
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2
+    MEASFORM=3
.INCLUDE "/home/centos/PDK/FreePDK45/ncsu_basekit/models/hspice/tran_models/models_nom/NMOS_VTL.inc"
.INCLUDE "/home/centos/PDK/FreePDK45/ncsu_basekit/models/hspice/tran_models/models_nom/PMOS_VTL.inc"

** Library name: MyLibPDK45
** Cell name: myInverter45
** View name: schematic
.subckt myInverter45 in out
m0 out in 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 out in vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends myInverter45
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: myInverter45TestBench
** View name: schematic
xi0 in out myInverter45
v0 vdd! 0 DC=vdd_val
v1 in 0 PULSE 0 vdd_val 0 20e-12 20e-12 80e-12 200e-12
c0 out 0 1e-15
.END
