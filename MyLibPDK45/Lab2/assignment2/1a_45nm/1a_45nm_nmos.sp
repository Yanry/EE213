** Generated for: hspiceD
** Generated on: Oct 21 12:17:18 2024
** Design library name: MyLibPDK45
** Design cell name: myNMOSsim
** Design view name: schematic
.PARAM vdd=1.8 vds=vdd vgs=vdd vbs=0


.PROBE DC
+    I1(m0)
** +    par('3*vdd/4/I1(m0)*(1-7*lambda*vdd/9)')
.DC vds 0 vdd 0.001 sweep vdd 0.4 1.8 0.2
.MEAS dc Ivdd find I1(m0) when par(vds)=par(vdd)
.MEAS dc rvdd param='par(vdd)/Ivdd'
.MEAS dc Ivdd2 find I1(m0) when par(vds)='par(vdd)/2'
.MEAS dc rvdd2 param='par(vdd)/2/Ivdd'
.MEAS dc req param='(rvdd+rvdd2)/2'

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
** Cell name: myNMOSsim
** View name: schematic
m0 net4 net3 0 net5 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
v2 net4 0 DC=vds
v0 net3 0 DC=vgs
v1 net5 0 DC=vbs
c1 net4 0 1p
.END
