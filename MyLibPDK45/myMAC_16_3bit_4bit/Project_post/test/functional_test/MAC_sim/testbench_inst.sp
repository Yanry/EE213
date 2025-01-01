** Library name: mycells45
** Cell name: MAC_64_3bit*4bit_test
** View name: schematic

** test rom
xmultiplier multiplier<0> multiplier<1> multiplier<2> multiplier<3> multiplier<4> multiplier<5> multiplier<6> multiplier<7> multiplier<8> multiplier<9> multiplier<10>
+ multiplier<11> multiplier<12> multiplier<13> multiplier<14> multiplier<15> multiplier<16> multiplier<17> multiplier<18> multiplier<19> multiplier<20> multiplier<21> multiplier<22> multiplier<23> multiplier<24> multiplier<25> multiplier<26>
+ multiplier<27> multiplier<28> multiplier<29> multiplier<30> multiplier<31> multiplier<32> multiplier<33> multiplier<34> multiplier<35> multiplier<36> multiplier<37> multiplier<38> multiplier<39> multiplier<40> multiplier<41> multiplier<42>
+ multiplier<43> multiplier<44> multiplier<45> multiplier<46> multiplier<47> multiplier_src vdd_val=vdd_val period=period

xmultiplicand multiplicand<0> multiplicand<1> multiplicand<2> multiplicand<3> multiplicand<4> multiplicand<5> multiplicand<6> multiplicand<7> multiplicand<8> multiplicand<9> multiplicand<10> multiplicand<11> multiplicand<12> multiplicand<13> multiplicand<14>
+ multiplicand<15> multiplicand<16> multiplicand<17> multiplicand<18> multiplicand<19> multiplicand<20> multiplicand<21> multiplicand<22> multiplicand<23> multiplicand<24> multiplicand<25> multiplicand<26> multiplicand<27> multiplicand<28> multiplicand<29> multiplicand<30>
+ multiplicand<31> multiplicand<32> multiplicand<33> multiplicand<34> multiplicand<35> multiplicand<36> multiplicand<37> multiplicand<38> multiplicand<39> multiplicand<40> multiplicand<41> multiplicand<42> multiplicand<43> multiplicand<44> multiplicand<45> multiplicand<46>
+ multiplicand<47> multiplicand<48> multiplicand<49> multiplicand<50> multiplicand<51> multiplicand<52> multiplicand<53> multiplicand<54> multiplicand<55> multiplicand<56> multiplicand<57> multiplicand<58> multiplicand<59> multiplicand<60> multiplicand<61> multiplicand<62>
+ multiplicand<63> multiplicand_src vdd_val=vdd_val period=period

v0 vdd! 0 DC=vdd_val
vclk clk 0 PULSE 0 vdd_val 0 0 0 'period/2' 'period'
c0<9> result<9> 0 40e-15
c0<8> result<8> 0 40e-15
c0<7> result<7> 0 40e-15
c0<6> result<6> 0 40e-15
c0<5> result<5> 0 40e-15
c0<4> result<4> 0 40e-15
c0<3> result<3> 0 40e-15
c0<2> result<2> 0 40e-15
c0<1> result<1> 0 40e-15
c0<0> result<0> 0 40e-15
