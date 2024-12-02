** Generated for: hspiceD
** Generated on: Nov 25 16:44:08 2024
** Design library name: MyLibPDK45
** Design cell name: myHA
** Design view name: schematic
.GLOBAL vdd!

** Library name: MyLibPDK45
** Cell name: myNAND
** View name: schematic
.subckt myNAND a b z
m1 z b net9 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 net9 a 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 z a vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 z b vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends myNAND
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: myInverter45
** View name: schematic
.subckt myInverter45 in out
m0 out in 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 out in vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends myInverter45
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: myXOR
** View name: schematic
.subckt myXOR a b z
m1 a bbar z 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 z a bbar bbar NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 a b z vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 z a b b PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
xi0 b bbar myInverter45
.ends myXOR
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: myHA
** View name: schematic
.subckt myHA a b cout s
xi0 a b net11 myNAND
xi1 net11 cout myInverter45
xi2 a b s myXOR
.ends myHA
