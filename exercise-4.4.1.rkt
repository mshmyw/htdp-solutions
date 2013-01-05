;; interest : number -> number
;; produces amount of interest a deposit earns in a year
(define (interest d)
  (cond [(<= d 1000) (* 0.04 d)]
	[(<= d 5000) (* 0.04 d)]
	[(> d 5000) (* 0.05)]))