** Generated for: hspiceD
** Generated on: Oct 21 12:17:18 2024
** Design library name: MyLibPDK45
** Design cell name: myNMOSsim
** Design view name: schematic
.PARAM vdd=0.7 vds=0.001 vgs=0.5 vbs=0


.PROBE DC
+    I1(m0)
+    deriv('I1(m0)')
.DC vgs 0.0 vdd 0.001

.TEMP 25.0
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2
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
