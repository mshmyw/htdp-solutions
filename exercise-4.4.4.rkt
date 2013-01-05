;; how-many : number number number -> number
;; consumes coefficients a, b, and c of a proper quadratic equation
;; and produces number of solutions
(define (how-many a b c)
  (cond [(> (* b b) (* 4 a c)) 2]
	[(= (* b b) (* 4 a c)) 1]
	[else 0]))