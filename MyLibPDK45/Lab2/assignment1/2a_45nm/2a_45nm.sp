** Generated for: hspiceD
** Generated on: Oct 21 12:17:18 2024
** Design library name: MyLibPDK45
** Design cell name: myNMOSsim
** Design view name: schematic
.PARAM vds=1.1 vgs=0.5 vsb=0


.PROBE DC
+    I1(m0)
.DC vgs 0.0 1.1 100e-3 vds lin 2 0.1 1.1
.MEAS dc k max deriv('I1(m0)')
.MEAS dc idm find I1(m0) when deriv('I1(m0)')=k
.MEAS dc vgsm find par(vgs) when deriv('I1(m0)')=k
.MEAS dc vt param='(idm-k*vgsm)/-k'

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
v1 net5 0 DC=vsb
.END
