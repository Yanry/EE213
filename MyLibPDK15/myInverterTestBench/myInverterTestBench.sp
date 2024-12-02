** Generated for: hspiceD
** Generated on: Sep 29 14:44:49 2024
** Design library name: MyLibPDK15
** Design cell name: myInverterTestBench
** Design view name: schematic
.GLOBAL vdd!
.PARAM vdd_val=0.8


.PROBE TRAN
+    V(out)
+    V(in)
.TRAN 100e-15 500e-12 START=0.0

.TEMP 25.0
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2
.INCLUDE "/home/centos/PDK/FreePDK15/hspice/models/fet.inc"

** Library name: MyLibPDK15
** Cell name: myInverter
** View name: schematic
.subckt myInverter_schematic in out
m1 out in vdd! vdd! pfet AD=608e-18 AS=608e-18 PD=168e-9 PS=168e-9 M=3
m0 out in 0 0 nfet AD=608e-18 AS=608e-18 PD=168e-9 PS=168e-9 M=3
.ends myInverter_schematic
** End of subcircuit definition.

** Library name: MyLibPDK15
** Cell name: myInverterTestBench
** View name: schematic
xi0 in out myInverter_schematic
v0 vdd! 0 DC=vdd_val
v1 in 0 PULSE 0 vdd_val 0 10e-12 10e-12 40e-12 100e-12
c0 out 0 1e-15
.END
