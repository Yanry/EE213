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
.INCLUDE "/home/centos/EE213/MyLibPDK15/myInverter/backend/myInverter.pex.netlist"

** Library name: MyLibPDK15
** Cell name: myInverterTestBench
** View name: schematic
xi0 in gnd! vdd! out myInverter
v0 vdd! 0 DC=vdd_val
v1 in 0 PULSE 0 vdd_val 0 10e-12 10e-12 40e-12 100e-12
c0 out 0 1e-15
.END
