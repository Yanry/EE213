** Generated for: hspiceD
** Generated on: Dec 19 13:30:51 2024
** Design library name: MyLibPDK45
** Design cell name: mySRAM
** Design view name: schematic
.GLOBAL vdd!


** Library name: MyLibPDK45
** Cell name: mySRAM_cell
** View name: schematic
.subckt mySRAM_cell bit_line bit_line_bar word_line
m5 bit_line_bar word_line net10 0 NMOS_VTL L=50e-9 W=135e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 net8 word_line bit_line 0 NMOS_VTL L=50e-9 W=135e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 net8 net10 0 0 NMOS_VTL L=50e-9 W=220e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 net10 net8 0 0 NMOS_VTL L=50e-9 W=220e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m3 net8 net10 vdd! vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 net10 net8 vdd! vdd! PMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends mySRAM_cell
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: mySRAM_prc
** View name: schematic
.subckt mySRAM_prc prc bit_line bit_line_bar
m2 bit_line prc bit_line_bar vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 bit_line prc vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 bit_line_bar prc vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends mySRAM_prc
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
** Cell name: myInverter45
** View name: schematic
.subckt myInverter45 in out
m0 out in 0 0 NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 out in vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
.ends myInverter45
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
** Cell name: mySRAM_sa
** View name: schematic
.subckt mySRAM_sa data_read prc sram_ren bit_line bit_line_bar
m1 net04 bit_line net13 0 NMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m0 read_data bit_line_bar net13 0 NMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m6 0 ren net13 vdd! NMOS_VTL L=50e-9 W=270e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m4 net04 net04 vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m2 read_data net04 vdd! vdd! PMOS_VTL L=50e-9 W=180e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
xi2 sram_ren prc ren myNAND
xi3 read_data data_read myBuffer_2
.ends mySRAM_sa
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: myAnd
** View name: schematic
.subckt myAnd a b z
xi0 a b net7 myNAND
xi1 net7 z myInverter45
.ends myAnd
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: mySRAM_wr
** View name: schematic
.subckt mySRAM_wr data prc sram_wen bit_line bit_line_bar
m2 bit_line_bar bl_bar_switch 0 0 NMOS_VTL L=50e-9 W=380e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 bit_line bl_switch 0 0 NMOS_VTL L=50e-9 W=380e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
xi5 wen data_bar bl_switch myAnd
xi4 wen data bl_bar_switch myAnd
xi2 sram_wen prc wen myAnd
xi1 data data_bar myInverter45
.ends mySRAM_wr
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: mySRAM_col
** View name: schematic
.subckt mySRAM_col data data_read prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0>
xi31 net75 net76 wl<31> mySRAM_cell
xi30 net75 net76 wl<30> mySRAM_cell
xi29 net75 net76 wl<29> mySRAM_cell
xi28 net75 net76 wl<28> mySRAM_cell
xi27 net75 net76 wl<27> mySRAM_cell
xi26 net75 net76 wl<26> mySRAM_cell
xi25 net75 net76 wl<25> mySRAM_cell
xi24 net75 net76 wl<24> mySRAM_cell
xi23 net75 net76 wl<23> mySRAM_cell
xi22 net75 net76 wl<22> mySRAM_cell
xi21 net75 net76 wl<21> mySRAM_cell
xi20 net75 net76 wl<20> mySRAM_cell
xi19 net75 net76 wl<19> mySRAM_cell
xi18 net75 net76 wl<18> mySRAM_cell
xi17 net75 net76 wl<17> mySRAM_cell
xi16 net75 net76 wl<16> mySRAM_cell
xi15 net75 net76 wl<15> mySRAM_cell
xi14 net75 net76 wl<14> mySRAM_cell
xi13 net75 net76 wl<13> mySRAM_cell
xi12 net75 net76 wl<12> mySRAM_cell
xi11 net75 net76 wl<11> mySRAM_cell
xi10 net75 net76 wl<10> mySRAM_cell
xi9 net75 net76 wl<9> mySRAM_cell
xi8 net75 net76 wl<8> mySRAM_cell
xi7 net75 net76 wl<7> mySRAM_cell
xi6 net75 net76 wl<6> mySRAM_cell
xi5 net75 net76 wl<5> mySRAM_cell
xi4 net75 net76 wl<4> mySRAM_cell
xi3 net75 net76 wl<3> mySRAM_cell
xi2 net75 net76 wl<2> mySRAM_cell
xi1 net75 net76 wl<1> mySRAM_cell
xi0 net75 net76 wl<0> mySRAM_cell
xi32 prc net75 net76 mySRAM_prc
xi33 data_read prc sram_ren net75 net76 mySRAM_sa
xi34 data prc sram_wen net75 net76 mySRAM_wr
.ends mySRAM_col
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: mySRAM_2col
** View name: schematic
.subckt mySRAM_2col data<1> data<0> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0>
xi18 data<1> data_read<1> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> mySRAM_col
xi17 data<0> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> mySRAM_col
.ends mySRAM_2col
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: mySRAM_4col
** View name: schematic
.subckt mySRAM_4col data<3> data<2> data<1> data<0> data_read<3> data_read<2> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0>
xi18 data<3> data<2> data_read<3> data_read<2> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> mySRAM_2col
xi17 data<1> data<0> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> mySRAM_2col
.ends mySRAM_4col
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: mySRAM_8col
** View name: schematic
.subckt mySRAM_8col data<1> data<0> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<7> data<6> data<5> data<4> data<3> data<2> data_read<7> data_read<6> data_read<5> data_read<4> data_read<3> data_read<2>
xi18 data<7> data<6> data<5> data<4> data_read<7> data_read<6> data_read<5> data_read<4> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> mySRAM_4col
xi17 data<3> data<2> data<1> data<0> data_read<3> data_read<2> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> mySRAM_4col
.ends mySRAM_8col
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: mySRAM_16col
** View name: schematic
.subckt mySRAM_16col data<1> data<0> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<15> data<14> data<13> data<12> data<11> data<10> data<9> data<8> data<7> data<6> data<5> data<4> data<3> data<2> data_read<15> data_read<14> data_read<13> data_read<12> data_read<11> data_read<10> data_read<9> data_read<8> data_read<7> data_read<6> data_read<5> data_read<4> data_read<3> data_read<2>
xi18 data<9> data<8> data_read<9> data_read<8> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<15> data<14> data<13> data<12> data<11> data<10> data_read<15> data_read<14> data_read<13> data_read<12> data_read<11> data_read<10> mySRAM_8col
xi17 data<1> data<0> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<7> data<6> data<5> data<4> data<3> data<2> data_read<7> data_read<6> data_read<5> data_read<4> data_read<3> data_read<2> mySRAM_8col
.ends mySRAM_16col
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: mySRAM_32col
** View name: schematic
.subckt mySRAM_32col data<1> data<0> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<31> data<30> data<29> data<28> data<27> data<26> data<25> data<24> data<23> data<22> data<21> data<20> data<19> data<18> data<17> data<16> data<15> data<14> data<13> data<12> data<11> data<10> data<9> data<8> data<7> data<6> data<5> data<4> data<3> data<2> data_read<31> data_read<30> data_read<29> data_read<28> data_read<27> data_read<26> data_read<25> data_read<24> data_read<23> data_read<22> data_read<21> data_read<20> data_read<19> data_read<18> data_read<17> data_read<16> data_read<15> data_read<14> data_read<13> data_read<12> data_read<11> data_read<10> data_read<9> data_read<8> data_read<7> data_read<6> data_read<5> data_read<4> data_read<3> data_read<2>
xi18 data<17> data<16> data_read<17> data_read<16> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<31> data<30> data<29> data<28> data<27> data<26> data<25> data<24> data<23> data<22> data<21> data<20> data<19> data<18> data_read<31> data_read<30> data_read<29> data_read<28> data_read<27> data_read<26> data_read<25> data_read<24> data_read<23> data_read<22> data_read<21> data_read<20> data_read<19> data_read<18> mySRAM_16col
xi17 data<1> data<0> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<15> data<14> data<13> data<12> data<11> data<10> data<9> data<8> data<7> data<6> data<5> data<4> data<3> data<2> data_read<15> data_read<14> data_read<13> data_read<12> data_read<11> data_read<10> data_read<9> data_read<8> data_read<7> data_read<6> data_read<5> data_read<4> data_read<3> data_read<2> mySRAM_16col
.ends mySRAM_32col
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: mySRAM_64col
** View name: schematic
.subckt mySRAM_64col data<1> data<0> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<63> data<62> data<61> data<60> data<59> data<58> data<57> data<56> data<55> data<54> data<53> data<52> data<51> data<50> data<49> data<48> data<47> data<46> data<45> data<44> data<43> data<42> data<41> data<40> data<39> data<38> data<37> data<36> data<35> data<34> data<33> data<32> data<31> data<30> data<29> data<28> data<27> data<26> data<25> data<24> data<23> data<22> data<21> data<20> data<19> data<18> data<17> data<16> data<15> data<14> data<13> data<12> data<11> data<10> data<9> data<8> data<7> data<6> data<5> data<4> data<3> data<2> data_read<63> data_read<62> data_read<61> data_read<60> data_read<59> data_read<58> data_read<57> data_read<56> data_read<55> data_read<54> data_read<53> data_read<52>
+data_read<51> data_read<50> data_read<49> data_read<48> data_read<47> data_read<46> data_read<45> data_read<44> data_read<43> data_read<42> data_read<41> data_read<40> data_read<39> data_read<38> data_read<37> data_read<36> data_read<35> data_read<34> data_read<33> data_read<32> data_read<31> data_read<30> data_read<29> data_read<28> data_read<27> data_read<26> data_read<25> data_read<24> data_read<23> data_read<22> data_read<21> data_read<20> data_read<19> data_read<18> data_read<17> data_read<16> data_read<15> data_read<14> data_read<13> data_read<12> data_read<11> data_read<10> data_read<9> data_read<8> data_read<7> data_read<6> data_read<5> data_read<4> data_read<3> data_read<2>
xi18 data<33> data<32> data_read<33> data_read<32> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<63> data<62> data<61> data<60> data<59> data<58> data<57> data<56> data<55> data<54> data<53> data<52> data<51> data<50> data<49> data<48> data<47> data<46> data<45> data<44> data<43> data<42> data<41> data<40> data<39> data<38> data<37> data<36> data<35> data<34> data_read<63> data_read<62> data_read<61> data_read<60> data_read<59> data_read<58> data_read<57> data_read<56> data_read<55> data_read<54> data_read<53> data_read<52> data_read<51> data_read<50> data_read<49> data_read<48> data_read<47> data_read<46> data_read<45> data_read<44> data_read<43> data_read<42> data_read<41> data_read<40> data_read<39> data_read<38> data_read<37> data_read<36> data_read<35> data_read<34> mySRAM_32col
xi17 data<1> data<0> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<31> data<30> data<29> data<28> data<27> data<26> data<25> data<24> data<23> data<22> data<21> data<20> data<19> data<18> data<17> data<16> data<15> data<14> data<13> data<12> data<11> data<10> data<9> data<8> data<7> data<6> data<5> data<4> data<3> data<2> data_read<31> data_read<30> data_read<29> data_read<28> data_read<27> data_read<26> data_read<25> data_read<24> data_read<23> data_read<22> data_read<21> data_read<20> data_read<19> data_read<18> data_read<17> data_read<16> data_read<15> data_read<14> data_read<13> data_read<12> data_read<11> data_read<10> data_read<9> data_read<8> data_read<7> data_read<6> data_read<5> data_read<4> data_read<3> data_read<2> mySRAM_32col
.ends mySRAM_64col
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: mySRAM_128col
** View name: schematic
.subckt mySRAM_128col data<1> data<0> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<127> data<126> data<125> data<124> data<123> data<122> data<121> data<120> data<119> data<118> data<117> data<116> data<115> data<114> data<113> data<112> data<111> data<110> data<109> data<108> data<107> data<106> data<105> data<104> data<103> data<102> data<101> data<100> data<99> data<98> data<97> data<96> data<95> data<94> data<93> data<92> data<91> data<90> data<89> data<88> data<87> data<86> data<85> data<84> data<83> data<82> data<81> data<80> data<79> data<78> data<77> data<76> data<75> data<74> data<73> data<72> data<71> data<70> data<69> data<68> data<67> data<66> data<65> data<64> data<63> data<62> data<61> data<60> data<59> data<58> data<57> data<56> data<55> data<54> data<53> data<52> data<51>
+data<50> data<49> data<48> data<47> data<46> data<45> data<44> data<43> data<42> data<41> data<40> data<39> data<38> data<37> data<36> data<35> data<34> data<33> data<32> data<31> data<30> data<29> data<28> data<27> data<26> data<25> data<24> data<23> data<22> data<21> data<20> data<19> data<18> data<17> data<16> data<15> data<14> data<13> data<12> data<11> data<10> data<9> data<8> data<7> data<6> data<5> data<4> data<3> data<2> data_read<127> data_read<126> data_read<125> data_read<124> data_read<123> data_read<122> data_read<121> data_read<120> data_read<119> data_read<118> data_read<117> data_read<116> data_read<115> data_read<114> data_read<113> data_read<112> data_read<111> data_read<110> data_read<109> data_read<108> data_read<107> data_read<106> data_read<105> data_read<104> data_read<103> data_read<102> data_read<101> data_read<100> data_read<99> data_read<98> data_read<97> data_read<96> data_read<95> data_read<94> data_read<93> data_read<92> data_read<91> data_read<90> data_read<89> data_read<88>
+data_read<87> data_read<86> data_read<85> data_read<84> data_read<83> data_read<82> data_read<81> data_read<80> data_read<79> data_read<78> data_read<77> data_read<76> data_read<75> data_read<74> data_read<73> data_read<72> data_read<71> data_read<70> data_read<69> data_read<68> data_read<67> data_read<66> data_read<65> data_read<64> data_read<63> data_read<62> data_read<61> data_read<60> data_read<59> data_read<58> data_read<57> data_read<56> data_read<55> data_read<54> data_read<53> data_read<52> data_read<51> data_read<50> data_read<49> data_read<48> data_read<47> data_read<46> data_read<45> data_read<44> data_read<43> data_read<42> data_read<41> data_read<40> data_read<39> data_read<38> data_read<37> data_read<36> data_read<35> data_read<34> data_read<33> data_read<32> data_read<31> data_read<30> data_read<29> data_read<28> data_read<27> data_read<26> data_read<25> data_read<24> data_read<23> data_read<22> data_read<21> data_read<20> data_read<19> data_read<18> data_read<17> data_read<16> data_read<15>
+data_read<14> data_read<13> data_read<12> data_read<11> data_read<10> data_read<9> data_read<8> data_read<7> data_read<6> data_read<5> data_read<4> data_read<3> data_read<2>
xi18 data<65> data<64> data_read<65> data_read<64> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<127> data<126> data<125> data<124> data<123> data<122> data<121> data<120> data<119> data<118> data<117> data<116> data<115> data<114> data<113> data<112> data<111> data<110> data<109> data<108> data<107> data<106> data<105> data<104> data<103> data<102> data<101> data<100> data<99> data<98> data<97> data<96> data<95> data<94> data<93> data<92> data<91> data<90> data<89> data<88> data<87> data<86> data<85> data<84> data<83> data<82> data<81> data<80> data<79> data<78> data<77> data<76> data<75> data<74> data<73> data<72> data<71> data<70> data<69> data<68> data<67> data<66> data_read<127> data_read<126> data_read<125> data_read<124> data_read<123> data_read<122> data_read<121> data_read<120> data_read<119> data_read<118>
+data_read<117> data_read<116> data_read<115> data_read<114> data_read<113> data_read<112> data_read<111> data_read<110> data_read<109> data_read<108> data_read<107> data_read<106> data_read<105> data_read<104> data_read<103> data_read<102> data_read<101> data_read<100> data_read<99> data_read<98> data_read<97> data_read<96> data_read<95> data_read<94> data_read<93> data_read<92> data_read<91> data_read<90> data_read<89> data_read<88> data_read<87> data_read<86> data_read<85> data_read<84> data_read<83> data_read<82> data_read<81> data_read<80> data_read<79> data_read<78> data_read<77> data_read<76> data_read<75> data_read<74> data_read<73> data_read<72> data_read<71> data_read<70> data_read<69> data_read<68> data_read<67> data_read<66> mySRAM_64col
xi17 data<1> data<0> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<63> data<62> data<61> data<60> data<59> data<58> data<57> data<56> data<55> data<54> data<53> data<52> data<51> data<50> data<49> data<48> data<47> data<46> data<45> data<44> data<43> data<42> data<41> data<40> data<39> data<38> data<37> data<36> data<35> data<34> data<33> data<32> data<31> data<30> data<29> data<28> data<27> data<26> data<25> data<24> data<23> data<22> data<21> data<20> data<19> data<18> data<17> data<16> data<15> data<14> data<13> data<12> data<11> data<10> data<9> data<8> data<7> data<6> data<5> data<4> data<3> data<2> data_read<63> data_read<62> data_read<61> data_read<60> data_read<59> data_read<58> data_read<57> data_read<56> data_read<55> data_read<54> data_read<53> data_read<52> data_read<51>
+data_read<50> data_read<49> data_read<48> data_read<47> data_read<46> data_read<45> data_read<44> data_read<43> data_read<42> data_read<41> data_read<40> data_read<39> data_read<38> data_read<37> data_read<36> data_read<35> data_read<34> data_read<33> data_read<32> data_read<31> data_read<30> data_read<29> data_read<28> data_read<27> data_read<26> data_read<25> data_read<24> data_read<23> data_read<22> data_read<21> data_read<20> data_read<19> data_read<18> data_read<17> data_read<16> data_read<15> data_read<14> data_read<13> data_read<12> data_read<11> data_read<10> data_read<9> data_read<8> data_read<7> data_read<6> data_read<5> data_read<4> data_read<3> data_read<2> mySRAM_64col
.ends mySRAM_128col
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: mySRAM_192col
** View name: schematic
.subckt mySRAM_192col data<1> data<0> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<191> data<190> data<189> data<188> data<187> data<186> data<185> data<184> data<183> data<182> data<181> data<180> data<179> data<178> data<177> data<176> data<175> data<174> data<173> data<172> data<171> data<170> data<169> data<168> data<167> data<166> data<165> data<164> data<163> data<162> data<161> data<160> data<159> data<158> data<157> data<156> data<155> data<154> data<153> data<152> data<151> data<150> data<149> data<148> data<147> data<146> data<145> data<144> data<143> data<142> data<141> data<140> data<139> data<138> data<137> data<136> data<135> data<134> data<133> data<132> data<131> data<130> data<129> data<128> data<127> data<126> data<125> data<124> data<123> data<122> data<121> data<120>
+data<119> data<118> data<117> data<116> data<115> data<114> data<113> data<112> data<111> data<110> data<109> data<108> data<107> data<106> data<105> data<104> data<103> data<102> data<101> data<100> data<99> data<98> data<97> data<96> data<95> data<94> data<93> data<92> data<91> data<90> data<89> data<88> data<87> data<86> data<85> data<84> data<83> data<82> data<81> data<80> data<79> data<78> data<77> data<76> data<75> data<74> data<73> data<72> data<71> data<70> data<69> data<68> data<67> data<66> data<65> data<64> data<63> data<62> data<61> data<60> data<59> data<58> data<57> data<56> data<55> data<54> data<53> data<52> data<51> data<50> data<49> data<48> data<47> data<46> data<45> data<44> data<43> data<42> data<41> data<40> data<39> data<38> data<37> data<36> data<35> data<34> data<33> data<32> data<31> data<30> data<29> data<28> data<27> data<26> data<25> data<24> data<23> data<22> data<21> data<20> data<19> data<18> data<17> data<16> data<15> data<14> data<13> data<12> data<11> data<10> data<9>
+data<8> data<7> data<6> data<5> data<4> data<3> data<2> data_read<191> data_read<190> data_read<189> data_read<188> data_read<187> data_read<186> data_read<185> data_read<184> data_read<183> data_read<182> data_read<181> data_read<180> data_read<179> data_read<178> data_read<177> data_read<176> data_read<175> data_read<174> data_read<173> data_read<172> data_read<171> data_read<170> data_read<169> data_read<168> data_read<167> data_read<166> data_read<165> data_read<164> data_read<163> data_read<162> data_read<161> data_read<160> data_read<159> data_read<158> data_read<157> data_read<156> data_read<155> data_read<154> data_read<153> data_read<152> data_read<151> data_read<150> data_read<149> data_read<148> data_read<147> data_read<146> data_read<145> data_read<144> data_read<143> data_read<142> data_read<141> data_read<140> data_read<139> data_read<138> data_read<137> data_read<136> data_read<135> data_read<134> data_read<133> data_read<132> data_read<131> data_read<130> data_read<129> data_read<128>
+data_read<127> data_read<126> data_read<125> data_read<124> data_read<123> data_read<122> data_read<121> data_read<120> data_read<119> data_read<118> data_read<117> data_read<116> data_read<115> data_read<114> data_read<113> data_read<112> data_read<111> data_read<110> data_read<109> data_read<108> data_read<107> data_read<106> data_read<105> data_read<104> data_read<103> data_read<102> data_read<101> data_read<100> data_read<99> data_read<98> data_read<97> data_read<96> data_read<95> data_read<94> data_read<93> data_read<92> data_read<91> data_read<90> data_read<89> data_read<88> data_read<87> data_read<86> data_read<85> data_read<84> data_read<83> data_read<82> data_read<81> data_read<80> data_read<79> data_read<78> data_read<77> data_read<76> data_read<75> data_read<74> data_read<73> data_read<72> data_read<71> data_read<70> data_read<69> data_read<68> data_read<67> data_read<66> data_read<65> data_read<64> data_read<63> data_read<62> data_read<61> data_read<60> data_read<59> data_read<58> data_read<57>
+data_read<56> data_read<55> data_read<54> data_read<53> data_read<52> data_read<51> data_read<50> data_read<49> data_read<48> data_read<47> data_read<46> data_read<45> data_read<44> data_read<43> data_read<42> data_read<41> data_read<40> data_read<39> data_read<38> data_read<37> data_read<36> data_read<35> data_read<34> data_read<33> data_read<32> data_read<31> data_read<30> data_read<29> data_read<28> data_read<27> data_read<26> data_read<25> data_read<24> data_read<23> data_read<22> data_read<21> data_read<20> data_read<19> data_read<18> data_read<17> data_read<16> data_read<15> data_read<14> data_read<13> data_read<12> data_read<11> data_read<10> data_read<9> data_read<8> data_read<7> data_read<6> data_read<5> data_read<4> data_read<3> data_read<2>
xi18 data<129> data<128> data_read<129> data_read<128> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<191> data<190> data<189> data<188> data<187> data<186> data<185> data<184> data<183> data<182> data<181> data<180> data<179> data<178> data<177> data<176> data<175> data<174> data<173> data<172> data<171> data<170> data<169> data<168> data<167> data<166> data<165> data<164> data<163> data<162> data<161> data<160> data<159> data<158> data<157> data<156> data<155> data<154> data<153> data<152> data<151> data<150> data<149> data<148> data<147> data<146> data<145> data<144> data<143> data<142> data<141> data<140> data<139> data<138> data<137> data<136> data<135> data<134> data<133> data<132> data<131> data<130> data_read<191> data_read<190> data_read<189> data_read<188> data_read<187> data_read<186> data_read<185>
+data_read<184> data_read<183> data_read<182> data_read<181> data_read<180> data_read<179> data_read<178> data_read<177> data_read<176> data_read<175> data_read<174> data_read<173> data_read<172> data_read<171> data_read<170> data_read<169> data_read<168> data_read<167> data_read<166> data_read<165> data_read<164> data_read<163> data_read<162> data_read<161> data_read<160> data_read<159> data_read<158> data_read<157> data_read<156> data_read<155> data_read<154> data_read<153> data_read<152> data_read<151> data_read<150> data_read<149> data_read<148> data_read<147> data_read<146> data_read<145> data_read<144> data_read<143> data_read<142> data_read<141> data_read<140> data_read<139> data_read<138> data_read<137> data_read<136> data_read<135> data_read<134> data_read<133> data_read<132> data_read<131> data_read<130> mySRAM_64col
xi17 data<1> data<0> data_read<1> data_read<0> prc sram_ren sram_wen wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0> data<127> data<126> data<125> data<124> data<123> data<122> data<121> data<120> data<119> data<118> data<117> data<116> data<115> data<114> data<113> data<112> data<111> data<110> data<109> data<108> data<107> data<106> data<105> data<104> data<103> data<102> data<101> data<100> data<99> data<98> data<97> data<96> data<95> data<94> data<93> data<92> data<91> data<90> data<89> data<88> data<87> data<86> data<85> data<84> data<83> data<82> data<81> data<80> data<79> data<78> data<77> data<76> data<75> data<74> data<73> data<72> data<71> data<70> data<69> data<68> data<67> data<66> data<65> data<64> data<63> data<62> data<61> data<60> data<59> data<58> data<57> data<56> data<55> data<54> data<53> data<52> data<51> data<50> data<49>
+data<48> data<47> data<46> data<45> data<44> data<43> data<42> data<41> data<40> data<39> data<38> data<37> data<36> data<35> data<34> data<33> data<32> data<31> data<30> data<29> data<28> data<27> data<26> data<25> data<24> data<23> data<22> data<21> data<20> data<19> data<18> data<17> data<16> data<15> data<14> data<13> data<12> data<11> data<10> data<9> data<8> data<7> data<6> data<5> data<4> data<3> data<2> data_read<127> data_read<126> data_read<125> data_read<124> data_read<123> data_read<122> data_read<121> data_read<120> data_read<119> data_read<118> data_read<117> data_read<116> data_read<115> data_read<114> data_read<113> data_read<112> data_read<111> data_read<110> data_read<109> data_read<108> data_read<107> data_read<106> data_read<105> data_read<104> data_read<103> data_read<102> data_read<101> data_read<100> data_read<99> data_read<98> data_read<97> data_read<96> data_read<95> data_read<94> data_read<93> data_read<92> data_read<91> data_read<90> data_read<89> data_read<88> data_read<87>
+data_read<86> data_read<85> data_read<84> data_read<83> data_read<82> data_read<81> data_read<80> data_read<79> data_read<78> data_read<77> data_read<76> data_read<75> data_read<74> data_read<73> data_read<72> data_read<71> data_read<70> data_read<69> data_read<68> data_read<67> data_read<66> data_read<65> data_read<64> data_read<63> data_read<62> data_read<61> data_read<60> data_read<59> data_read<58> data_read<57> data_read<56> data_read<55> data_read<54> data_read<53> data_read<52> data_read<51> data_read<50> data_read<49> data_read<48> data_read<47> data_read<46> data_read<45> data_read<44> data_read<43> data_read<42> data_read<41> data_read<40> data_read<39> data_read<38> data_read<37> data_read<36> data_read<35> data_read<34> data_read<33> data_read<32> data_read<31> data_read<30> data_read<29> data_read<28> data_read<27> data_read<26> data_read<25> data_read<24> data_read<23> data_read<22> data_read<21> data_read<20> data_read<19> data_read<18> data_read<17> data_read<16> data_read<15> data_read<14>
+data_read<13> data_read<12> data_read<11> data_read<10> data_read<9> data_read<8> data_read<7> data_read<6> data_read<5> data_read<4> data_read<3> data_read<2> mySRAM_128col
.ends mySRAM_192col
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
.subckt myDecoder_5_32 addr<4> addr<3> addr<2> addr<1> addr<0> wl<31> wl<30> wl<29> wl<28> wl<27> wl<26> wl<25> wl<24> wl<23> wl<22> wl<21> wl<20> wl<19> wl<18> wl<17> wl<16> wl<15> wl<14> wl<13> wl<12> wl<11> wl<10> wl<9> wl<8> wl<7> wl<6> wl<5> wl<4> wl<3> wl<2> wl<1> wl<0>
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
** End of subcircuit definition.

** Library name: MyLibPDK45
** Cell name: mySRAM
** View name: schematic
.subckt SRAM_192bit_32
+addr<4> addr<3> addr<2> addr<1> addr<0>
+prc 
+data_read<191> data_read<190> data_read<189> data_read<188> data_read<187> data_read<186> data_read<185> data_read<184> data_read<183> data_read<182> data_read<181> data_read<180> data_read<179> data_read<178> data_read<177> data_read<176> data_read<175> data_read<174> data_read<173> data_read<172> data_read<171> data_read<170> data_read<169> data_read<168> data_read<167> data_read<166> data_read<165> data_read<164> data_read<163> data_read<162> data_read<161> data_read<160> data_read<159> data_read<158> data_read<157> data_read<156> data_read<155> data_read<154> data_read<153> data_read<152> data_read<151> data_read<150> data_read<149> data_read<148> data_read<147> data_read<146> data_read<145> data_read<144> data_read<143> data_read<142> data_read<141> data_read<140> data_read<139> data_read<138> data_read<137> data_read<136> data_read<135> data_read<134> data_read<133> data_read<132> data_read<131> data_read<130> data_read<129> data_read<128> data_read<127>
+data_read<126> data_read<125> data_read<124> data_read<123> data_read<122> data_read<121> data_read<120> data_read<119> data_read<118> data_read<117> data_read<116> data_read<115> data_read<114> data_read<113> data_read<112> data_read<111> data_read<110> data_read<109> data_read<108> data_read<107> data_read<106> data_read<105> data_read<104> data_read<103> data_read<102> data_read<101> data_read<100> data_read<99> data_read<98> data_read<97> data_read<96> data_read<95> data_read<94> data_read<93> data_read<92> data_read<91> data_read<90> data_read<89> data_read<88> data_read<87> data_read<86> data_read<85> data_read<84> data_read<83> data_read<82> data_read<81> data_read<80> data_read<79> data_read<78> data_read<77> data_read<76> data_read<75> data_read<74> data_read<73> data_read<72> data_read<71> data_read<70> data_read<69> data_read<68> data_read<67> data_read<66> data_read<65> data_read<64> data_read<63> data_read<62> data_read<61> data_read<60> data_read<59> data_read<58> data_read<57> data_read<56>
+data_read<55> data_read<54> data_read<53> data_read<52> data_read<51> data_read<50> data_read<49> data_read<48> data_read<47> data_read<46> data_read<45> data_read<44> data_read<43> data_read<42> data_read<41> data_read<40> data_read<39> data_read<38> data_read<37> data_read<36> data_read<35> data_read<34> data_read<33> data_read<32> data_read<31> data_read<30> data_read<29> data_read<28> data_read<27> data_read<26> data_read<25> data_read<24> data_read<23> data_read<22> data_read<21> data_read<20> data_read<19> data_read<18> data_read<17> data_read<16> data_read<15> data_read<14> data_read<13> data_read<12> data_read<11> data_read<10> data_read<9> data_read<8> data_read<7> data_read<6> data_read<5> data_read<4> data_read<3> data_read<2> data_read<1> data_read<0>
+sram_ren sram_wen 
+data<191> data<190> data<189> data<188> data<187> data<186> data<185> data<184> data<183> data<182> data<181> data<180> data<179> data<178> data<177> data<176> data<175> data<174> data<173> data<172> data<171> data<170> data<169> data<168> data<167> data<166> data<165> data<164> data<163> data<162> data<161> data<160> data<159> data<158> data<157> data<156> data<155> data<154> data<153> data<152> data<151> data<150> data<149> data<148> data<147> data<146> data<145> data<144> data<143> data<142> data<141> data<140> data<139> data<138> data<137> data<136> data<135> data<134> data<133> data<132> data<131> data<130> data<129> data<128> data<127> data<126> data<125> data<124> data<123> data<122> data<121> data<120> data<119> data<118> data<117> data<116> data<115> data<114> data<113> data<112> data<111> data<110> data<109> data<108> data<107> data<106> data<105> data<104> data<103> data<102> data<101> data<100> data<99> data<98> data<97> data<96>
+data<95> data<94> data<93> data<92> data<91> data<90> data<89> data<88> data<87> data<86> data<85> data<84> data<83> data<82> data<81> data<80> data<79> data<78> data<77> data<76> data<75> data<74> data<73> data<72> data<71> data<70> data<69> data<68> data<67> data<66> data<65> data<64> data<63> data<62> data<61> data<60> data<59> data<58> data<57> data<56> data<55> data<54> data<53> data<52> data<51> data<50> data<49> data<48> data<47> data<46> data<45> data<44> data<43> data<42> data<41> data<40> data<39> data<38> data<37> data<36> data<35> data<34> data<33> data<32> data<31> data<30> data<29> data<28> data<27> data<26> data<25> data<24> data<23> data<22> data<21> data<20> data<19> data<18> data<17> data<16> data<15> data<14> data<13> data<12> data<11> data<10> data<9> data<8> data<7> data<6> data<5> data<4> data<3> data<2> data<1> data<0> 

xi0 data<1> data<0> data_read<1> data_read<0> prc sram_ren sram_wen net14<0> net14<1> net14<2> net14<3> net14<4> net14<5> net14<6> net14<7> net14<8> net14<9> net14<10> net14<11> net14<12> net14<13> net14<14> net14<15> net14<16> net14<17> net14<18> net14<19> net14<20> net14<21> net14<22> net14<23> net14<24> net14<25> net14<26> net14<27> net14<28> net14<29> net14<30> net14<31> data<191> data<190> data<189> data<188> data<187> data<186> data<185> data<184> data<183> data<182> data<181> data<180> data<179> data<178> data<177> data<176> data<175> data<174> data<173> data<172> data<171> data<170> data<169> data<168> data<167> data<166> data<165> data<164> data<163> data<162> data<161> data<160> data<159> data<158> data<157> data<156> data<155> data<154> data<153> data<152> data<151> data<150> data<149> data<148> data<147> data<146> data<145> data<144> data<143> data<142> data<141> data<140> data<139> data<138> data<137> data<136> data<135> data<134> data<133> data<132> data<131> data<130> data<129> data<128>
+data<127> data<126> data<125> data<124> data<123> data<122> data<121> data<120> data<119> data<118> data<117> data<116> data<115> data<114> data<113> data<112> data<111> data<110> data<109> data<108> data<107> data<106> data<105> data<104> data<103> data<102> data<101> data<100> data<99> data<98> data<97> data<96> data<95> data<94> data<93> data<92> data<91> data<90> data<89> data<88> data<87> data<86> data<85> data<84> data<83> data<82> data<81> data<80> data<79> data<78> data<77> data<76> data<75> data<74> data<73> data<72> data<71> data<70> data<69> data<68> data<67> data<66> data<65> data<64> data<63> data<62> data<61> data<60> data<59> data<58> data<57> data<56> data<55> data<54> data<53> data<52> data<51> data<50> data<49> data<48> data<47> data<46> data<45> data<44> data<43> data<42> data<41> data<40> data<39> data<38> data<37> data<36> data<35> data<34> data<33> data<32> data<31> data<30> data<29> data<28> data<27> data<26> data<25> data<24> data<23> data<22> data<21> data<20> data<19> data<18>
+data<17> data<16> data<15> data<14> data<13> data<12> data<11> data<10> data<9> data<8> data<7> data<6> data<5> data<4> data<3> data<2> data_read<191> data_read<190> data_read<189> data_read<188> data_read<187> data_read<186> data_read<185> data_read<184> data_read<183> data_read<182> data_read<181> data_read<180> data_read<179> data_read<178> data_read<177> data_read<176> data_read<175> data_read<174> data_read<173> data_read<172> data_read<171> data_read<170> data_read<169> data_read<168> data_read<167> data_read<166> data_read<165> data_read<164> data_read<163> data_read<162> data_read<161> data_read<160> data_read<159> data_read<158> data_read<157> data_read<156> data_read<155> data_read<154> data_read<153> data_read<152> data_read<151> data_read<150> data_read<149> data_read<148> data_read<147> data_read<146> data_read<145> data_read<144> data_read<143> data_read<142> data_read<141> data_read<140> data_read<139> data_read<138> data_read<137> data_read<136> data_read<135> data_read<134> data_read<133>
+data_read<132> data_read<131> data_read<130> data_read<129> data_read<128> data_read<127> data_read<126> data_read<125> data_read<124> data_read<123> data_read<122> data_read<121> data_read<120> data_read<119> data_read<118> data_read<117> data_read<116> data_read<115> data_read<114> data_read<113> data_read<112> data_read<111> data_read<110> data_read<109> data_read<108> data_read<107> data_read<106> data_read<105> data_read<104> data_read<103> data_read<102> data_read<101> data_read<100> data_read<99> data_read<98> data_read<97> data_read<96> data_read<95> data_read<94> data_read<93> data_read<92> data_read<91> data_read<90> data_read<89> data_read<88> data_read<87> data_read<86> data_read<85> data_read<84> data_read<83> data_read<82> data_read<81> data_read<80> data_read<79> data_read<78> data_read<77> data_read<76> data_read<75> data_read<74> data_read<73> data_read<72> data_read<71> data_read<70> data_read<69> data_read<68> data_read<67> data_read<66> data_read<65> data_read<64> data_read<63>
+data_read<62> data_read<61> data_read<60> data_read<59> data_read<58> data_read<57> data_read<56> data_read<55> data_read<54> data_read<53> data_read<52> data_read<51> data_read<50> data_read<49> data_read<48> data_read<47> data_read<46> data_read<45> data_read<44> data_read<43> data_read<42> data_read<41> data_read<40> data_read<39> data_read<38> data_read<37> data_read<36> data_read<35> data_read<34> data_read<33> data_read<32> data_read<31> data_read<30> data_read<29> data_read<28> data_read<27> data_read<26> data_read<25> data_read<24> data_read<23> data_read<22> data_read<21> data_read<20> data_read<19> data_read<18> data_read<17> data_read<16> data_read<15> data_read<14> data_read<13> data_read<12> data_read<11> data_read<10> data_read<9> data_read<8> data_read<7> data_read<6> data_read<5> data_read<4> data_read<3> data_read<2> mySRAM_192col
xi1 addr<4> addr<3> addr<2> addr<1> addr<0> net14<0> net14<1> net14<2> net14<3> net14<4> net14<5> net14<6> net14<7> net14<8> net14<9> net14<10> net14<11> net14<12> net14<13> net14<14> net14<15> net14<16> net14<17> net14<18> net14<19> net14<20> net14<21> net14<22> net14<23> net14<24> net14<25> net14<26> net14<27> net14<28> net14<29> net14<30> net14<31> myDecoder_5_32
.ends SRAM_192bit_32
.END
