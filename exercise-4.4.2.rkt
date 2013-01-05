;; tax : number -> number
;; consumes gross pay and produces amount of tax owed
(define (tax gross)
  (cond [(<= gross 240) gross]
	[(<= gross 480) (* 0.15 gross)]
	[(> gross 480) (* 0.28 gross)]))

;; grosspay : number -> number
;; determines the gross pay of an employee from the number of hours worked
(define (grosspay t)
  (* 12 t))

;; netpay : number -> number
;; determines the net pay of an employee from the number of hours worked
(define (netpay t)
  (- (grosspay t) (tax (grosspay t))))