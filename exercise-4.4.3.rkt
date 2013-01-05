;; pay-back : number -> number
;; consumes charge amount and computes pay-back amount
(define (pay-back c)
  (cond [(<= c 500) (* 0.0025)]
	[(<= c 1500) (+ (* (- c 500) 0.0050) 
			(* 500 0.0025))]
	[(<= c 2500) (+ (* (- c 1500) 0.0075)
			(* 1000 0.0050)
			(* 500 0.0025))]
	[else (+ (* (- c 2500) 0.01)
		   (* 1000 0.0075)
		   (* 1000 0.0050)
		   (* 500 0.0025))]))