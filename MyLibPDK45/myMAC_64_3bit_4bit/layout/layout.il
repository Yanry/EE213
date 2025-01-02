x0 = 17.2450
y0 = -5.2650
term = 0
port = "RESULT"
for( i 0 10
    x1 = x0 + 0.07
	y1 = y0 - 0.07
	term_name = strcat(port "<" concat(term) ">")
	; println(term_name)
	leCreatePin( geGetEditRep() "metal1" "rectangle" list(x0:y0 x1:y1) term_name "inputOutput" list("left" "right" "top" "bottom") )
	term = term + 1
	y0 = y0 - 1.595
)
