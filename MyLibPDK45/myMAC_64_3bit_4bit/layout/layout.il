x0 = 11.6775
y0 = -16.7050
term = 0
port = "RESULT"
for( i 0 9
    x1 = x0 + 0.07
	y1 = y0 - 0.07
	term_name = strcat(port "<" concat(term) ">")
	; println(term_name)
	leCreatePin( geGetEditRep() "metal1" "rectangle" list(x0:y0 x1:y1) term_name "inputOutput" list("left" "right" "top" "bottom") )
	term = term + 1
	y0 = y0 - 1.595
)
