** Generated for: hspiceD
** Generated on: Oct 21 12:17:18 2024
** Design library name: MyLibPDK45
** Design cell name: myNMOSsim
** Design view name: schematic
.PARAM vdd=1.4 vds=vdd vgs=vdd vbs=vdd


.PROBE DC
+    I1(m0)
** +    par('3*vdd/4/I1(m0)*(1-7*lambda*vdd/9)')
.DC vds 0 vdd 0.001 sweep vdd 0.2 1.4 0.2
.MEAS dc Ivdd find I1(m0) when par(vds)=par(vdd)
.MEAS dc rvdd param='-par(vdd)/Ivdd'
.MEAS dc Ivdd2 find I1(m0) when par(vds)='par(vdd)/2'
.MEAS dc rvdd2 param='-par(vdd)/2/Ivdd'
.MEAS dc req param='(rvdd+rvdd2)/2'

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
m0 0 net3 net4 net4 pfet
v2 net4 0 DC=vds
v0 net4 net3 DC=vgs
v1 net5 0 DC=vbs
c1 net4 0 1p
.END
