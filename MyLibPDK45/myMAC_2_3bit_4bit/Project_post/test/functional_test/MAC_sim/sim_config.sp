** Params
.GLOBAL vdd!
.PARAM vdd_val=0.7 period=5n

.TRAN 1e-12 'period*32' START=0.0

.TEMP 25.0
.OPTION
+    INGOLD=2
+    PARHIER=LOCAL
+    PROBE
+    NOMOD
+    POST=2

.PROBE TRAN
+    V(multiplier<0>)
+    V(multiplier<1>)
+    V(multiplier<2>)
+    V(multiplier<3>)
+    V(multiplier<4>)
+    V(multiplier<5>)
.PROBE TRAN
+    V(multiplicand<0>)
+    V(multiplicand<1>)
+    V(multiplicand<2>)
+    V(multiplicand<3>)
+    V(multiplicand<4>)
+    V(multiplicand<5>)
+    V(multiplicand<6>)
+    V(multiplicand<7>)
.PROBE TRAN
+    V(result<0>)
+    V(result<1>)
+    V(result<2>)
+    V(result<3>)
+    V(result<4>)
+    V(result<5>)
+    V(result<6>)
+    V(clk)
