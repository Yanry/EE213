** Generated for: hspiceD
** Generated on: Dec 18 15:21:09 2024
** Design library name: MyLibPDK45
** Design cell name: myDecoder_5_32
** Design view name: schematic
.GLOBAL vdd!


.TEMP 25.0
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2

** Library name: MyLibPDK45
** Cell name: myInverter45
** View name: schematic
.subckt myInverter45 in out
m0 out in 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 out in vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends myInverter45
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: myNOR
** View name: schematic
.subckt myNOR a b z
m1 z a 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 z b 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 z b net15 vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 net15 a vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends myNOR
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: myNOR4
** View name: schematic
.subckt myNOR4 a<0> a<1> a<2> a<3> b<0> b<1> b<2> b<3> z<0> z<1> z<2> z<3>
xi3 a<3> b<3> z<3> myNOR
xi2 a<2> b<2> z<2> myNOR
xi1 a<1> b<1> z<1> myNOR
xi0 a<0> b<0> z<0> myNOR
.ends myNOR4
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: myDecoder_2_4
** View name: schematic
.subckt myDecoder_2_4 a0 a1 wl<3> wl<2> wl<1> wl<0>
xi5 a0 net5 myInverter45
xi1 a1 net6 myInverter45
xi2 a0 net5 a0 net5 a1 a1 net6 net6 wl<0> wl<1> wl<2> wl<3> myNOR4
.ends myDecoder_2_4
** End of subcircuit definition.

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
** Cell name: myNAND4
** View name: schematic
.subckt myNAND4 a<0> a<1> a<2> a<3> b<0> b<1> b<2> b<3> z<0> z<1> z<2> z<3>
xi3 a<3> b<3> z<3> myNAND
xi2 a<2> b<2> z<2> myNAND
xi1 a<1> b<1> z<1> myNAND
xi0 a<0> b<0> z<0> myNAND
.ends myNAND4
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: myDecoder_4_16
** View name: schematic
.subckt myDecoder_4_16 addr<3> addr<2> addr<1> addr<0> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0>
xi1 addr<2> addr<3> y<3> y<2> y<1> y<0> myDecoder_2_4
xi0 addr<0> addr<1> x<3> x<2> x<1> x<0> myDecoder_2_4
xi5 x<0> x<1> x<2> x<3> y<3> y<3> y<3> y<3> wl<12> wl<13> wl<14> wl<15> myNAND4
xi4 x<0> x<1> x<2> x<3> y<2> y<2> y<2> y<2> wl<8> wl<9> wl<10> wl<11> myNAND4
xi3 x<0> x<1> x<2> x<3> y<1> y<1> y<1> y<1> wl<4> wl<5> wl<6> wl<7> myNAND4
xi2 x<0> x<1> x<2> x<3> y<0> y<0> y<0> y<0> wl<0> wl<1> wl<2> wl<3> myNAND4
.ends myDecoder_4_16
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: myDecoder_5_32
** View name: schematic
.subckt myDecoder_5_32 
+ addr<4> addr<3> addr<2> addr<1> addr<0> 
+ wl<0> wl<1> wl<2> wl<3>
+ wl<4> wl<5> wl<6> wl<7>
+ wl<8> wl<9> wl<10> wl<11>
+ wl<12> wl<13> wl<14> wl<15>
+ wl<16> wl<17> wl<18> wl<19>
+ wl<20> wl<21> wl<22> wl<23>
+ wl<24> wl<25> wl<26> wl<27>
+ wl<28> wl<29> wl<30> wl<31>
xi0 addr<3> addr<2> addr<1> addr<0> z<15> z<14> z<13> z<12> z<11> z<10> z<9> z<8> z<7> z<6> z<5> z<4> z<3> z<2> z<1> z<0> myDecoder_4_16
xi28 z<12> z<13> z<14> z<15> addr4<7> addr4<7> addr4<7> addr4<7> wl<28> wl<29> wl<30> wl<31> myNOR4
xi27 z<8> z<9> z<10> z<11> addr4<6> addr4<6> addr4<6> addr4<6> wl<24> wl<25> wl<26> wl<27> myNOR4
xi26 z<4> z<5> z<6> z<7> addr4<5> addr4<5> addr4<5> addr4<5> wl<20> wl<21> wl<22> wl<23> myNOR4
xi25 z<0> z<1> z<2> z<3> addr4<4> addr4<4> addr4<4> addr4<4> wl<16> wl<17> wl<18> wl<19> myNOR4
xi7 z<12> z<13> z<14> z<15> addr4<3> addr4<3> addr4<3> addr4<3> wl<12> wl<13> wl<14> wl<15> myNOR4
xi6 z<8> z<9> z<10> z<11> addr4<2> addr4<2> addr4<2> addr4<2> wl<8> wl<9> wl<10> wl<11> myNOR4
xi5 z<4> z<5> z<6> z<7> addr4<1> addr4<1> addr4<1> addr4<1> wl<4> wl<5> wl<6> wl<7> myNOR4
xi1 z<0> z<1> z<2> z<3> addr4<0> addr4<0> addr4<0> addr4<0> wl<0> wl<1> wl<2> wl<3> myNOR4
xi24 net25 addr4<7> myInverter45
xi23 net25 addr4<6> myInverter45
xi22 net25 addr4<5> myInverter45
xi21 net25 addr4<4> myInverter45
xi20 net31 net25 myInverter45
xi19 addr<4> net31 myInverter45
xi18 net4 addr4<3> myInverter45
xi17 net4 addr4<2> myInverter45
xi16 net4 addr4<1> myInverter45
xi15 net4 addr4<0> myInverter45
xi12 addr<4> net4 myInverter45
.ends myDecoder_5_32
.END
