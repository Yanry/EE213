** Generated for: hspiceD
** Generated on: Nov 28 12:43:44 2024
** Design library name: MyLibPDK45
** Design cell name: myPPA_4_3
** Design view name: schematic
.GLOBAL vdd!


** Library name: MyLibPDK45
** Cell name: myNAND
** View name: schematic
.subckt myNAND a b z
m1 z b net013 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 net013 a 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
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
m1 a bbar z z NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 z a bbar bbar NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 a b z z PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
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
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: myFA
** View name: schematic
.subckt myFA a b cin cout s
m11 net35 cin net068 vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m10 net068 a net069 vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m9 net069 b vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m8 net35 net79 net42 vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m7 net42 cin vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m6 net42 b vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m5 net42 a vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 net79 a net071 vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 net071 b vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 net79 cin net7 vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 net7 b vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 net7 a vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m23 net60 b 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m22 net64 a net60 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m21 net35 cin net64 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m20 net65 cin 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m19 net65 b 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m18 net65 a 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m17 net35 net79 net65 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m16 net12 b 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m15 net79 a net12 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m14 net4 b 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m13 net4 a 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m12 net79 cin net4 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
xi10 net35 s myInverter45
xi9 net79 cout myInverter45
.ends myFA
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: myBuffer_2
** View name: schematic
.subckt myBuffer_2 in out
xi1 net5 out myInverter45
xi0 in net5 myInverter45
.ends myBuffer_2
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: myPPA_4_3
** View name: schematic
.subckt myPPA_4_3 a0<3> a0<2> a0<1> a0<0> a1<3> a1<2> a1<1> a1<0> a2<3> a2<2> a2<1> a2<0> s<5> s<4> s<3> s<2> s<1> s<0> 
xi16 vdd! net025 net016 s<2> myHA
xi21 net012 net021 net010 s<4> myHA
xi22 net010 net020 net032 s<5> myHA
xi6 a2bar<0> net34 net1 net025 myHA
xi5 net28 a1bar<3> net5 net6 myHA
xi0 a0<1> a1<0> net35 s<1> myHA
xi18 net016 vdd! net023 net012 s<3> myFA
xi9 net18 a2<3> net5 net027 net020 myFA
xi8 net20 a2bar<2> net6 net18 net021 myFA
xi7 net1 a2bar<1> net29 net20 net023 myFA
xi4 net33 a0bar<3> a1<2> net28 net29 myFA
xi3 net35 a0<2> a1<1> net33 net34 myFA
xi10 a0<0> s<0> myBuffer_2
xi11 a1<3> a1bar<3> myInverter45
xi12 a0<3> a0bar<3> myInverter45
xi13 a2<2> a2bar<2> myInverter45
xi14 a2<1> a2bar<1> myInverter45
xi15 a2<0> a2bar<0> myInverter45
.ends myPPA_4_3
.END
