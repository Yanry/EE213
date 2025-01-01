.subckt multiplier_src out<0> out<1> out<2> out<3> out<4> out<5>
vpat<0> out<0> 0 PAT 'vdd_val' 0 0 0 0 'period' b01 RB=1 R=0
vpat<1> out<1> 0 PAT 'vdd_val' 0 0 0 0 'period' b11 RB=1 R=0
vpat<2> out<2> 0 PAT 'vdd_val' 0 0 0 0 'period' b10 RB=1 R=0
vpat<3> out<3> 0 PAT 'vdd_val' 0 0 0 0 'period' b00 RB=1 R=0
vpat<4> out<4> 0 PAT 'vdd_val' 0 0 0 0 'period' b00 RB=1 R=0
vpat<5> out<5> 0 PAT 'vdd_val' 0 0 0 0 'period' b00 RB=1 R=0
.ends multiplier_src
