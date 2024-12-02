** Generated for: hspiceD
** Generated on: Oct 21 12:17:18 2024
** Design library name: MyLibPDK45
** Design cell name: myNMOSsim
** Design view name: schematic
.PARAM vdd=0.7 vds=0.5 vgs=0.5 vbs=0


.PROBE DC
+    I1(m0)
.DC vds 0.0 vdd 0.001 sweep vgs 0.3 0.5 0.05
.MEAS dc Id1 find I1(m0) when par(vds)=0.6
.MEAS dc Id0 find I1(m0) when par(vds)=0.4
.MEAS dc lambda param='(Id1-Id0)/(Id0*0.6-Id1*0.4)'

.TEMP 25.0
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2
+    MEASFORM=3
.INCLUDE "/home/centos/PDK/FreePDK7/7nfet.pm"
.INCLUDE "/home/centos/PDK/FreePDK7/7pfet.pm"

** Library name: MyLibPDK45
** Cell name: myNMOSsim
** View name: schematic
m0 net4 net3 0 net5 nfet
v2 net4 0 DC=vds
v0 net3 0 DC=vgs
v1 net5 0 DC=vbs
.END
