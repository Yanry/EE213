** Multiplication & Addition Module

** Include VMA netlist
.INCLUDE "/home/centos/EE213/MyLibPDK45/myMAC_2_3bit_4bit/backend/pex/myMAC_2_3bit_4bit.pex.netlist"

***********************************
* Set period time here 
***********************************
.PARAM
+ period = 5n

** Instantiate your MAC module here
*   The MAC module does vector inner product of two 64d vectors. The multiplier(i.e. weight) and multiplicand(i.e. input) is 
*   quantized to 3bit and 4bit signed integer respectively. The output is a single 12bit signed integer.
*	The following content describes the pins needed in MAC module and the corresponding internal signals they should be connected to
*	Format:
*		<module_pin_name> -> <testbench_signal_name> : <description>
*		"->" means connect to
*
*	Your top module should have the following pins
*	Output:
*       OUT<11:0> -> result<11:0>: The output result of MAC module
*	Inputs:
*       MULTIPLIER<191:0> -> multiplier<191:0>: The 64*3bit multiplier
*       MULTIPLICAND<255:0> -> multiplicand<255:0>: The 64*4bit multiplicand

** Here is an example of the instance. The order of signals may vary with your design.
** Please connect the signals correctly. (Do not modify the instance name when you instantiate your module)
xmac  GND! MULTIPLICAND<7> MULTIPLICAND<6> MULTIPLICAND<3>
+ MULTIPLICAND<2> VDD! MULTIPLICAND<5> MULTIPLICAND<1> MULTIPLIER<3>
+ MULTIPLIER<0> MULTIPLIER<1> MULTIPLIER<4> MULTIPLICAND<4> MULTIPLICAND<0>
+ MULTIPLIER<5> MULTIPLIER<2> RESULT<6> RESULT<5> RESULT<4> RESULT<3> RESULT<2>
+ RESULT<1> RESULT<0> myMAC_2_3bit_4bit