x0 = -21.1525
y0 = -106.9425
term = 160
port = "DATA_READ"
for( i 0 31
    x1 = x0 + 0.065
	y1 = y0 - 0.02
	term_name = strcat(port "<" concat(term) ">")
	; println(term_name)
	leCreatePin( geGetEditRep() "metal1" "rectangle" list(x0:y0 x1:y1) term_name "inputOutput" list("left" "right" "top" "bottom") )
	term = term + 1
	x0 = x0 - 3.1125
)
