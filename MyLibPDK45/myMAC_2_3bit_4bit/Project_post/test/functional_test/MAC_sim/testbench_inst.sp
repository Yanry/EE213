** Library name: mycells45
** Cell name: MAC_64_3bit*4bit_test
** View name: schematic

** test rom
xmultiplier multiplier<0> multiplier<1> multiplier<2> multiplier<3> multiplier<4> multiplier<5>  multiplier_src vdd_val=vdd_val period=period

xmultiplicand multiplicand<0> multiplicand<1> multiplicand<2> multiplicand<3> multiplicand<4> multiplicand<5> multiplicand<6> multiplicand<7>  multiplicand_src vdd_val=vdd_val period=period

v0 vdd! 0 DC=vdd_val
vclk clk 0 PULSE 0 vdd_val 0 0 0 'period/2' 'period'
c0<6> result<6> 0 40e-15
c0<5> result<5> 0 40e-15
c0<4> result<4> 0 40e-15
c0<3> result<3> 0 40e-15
c0<2> result<2> 0 40e-15
c0<1> result<1> 0 40e-15
c0<0> result<0> 0 40e-15
