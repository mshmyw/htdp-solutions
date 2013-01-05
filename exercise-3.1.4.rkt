;; How to design a program
(define (profit1 ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (revenue ticket-price)
  (* (attendees ticket-price) ticket-price))

(define (cost ticket-price)
  (* 1.50 (attendees ticket-price)))

(define (attendees ticket-price)
  (+ 120
     (* (/ 15 .10) (- 5.00 ticket-price))))

;; How not to design a program
(define (profit2 price)
  (- (* (+ 120
	   (* (/ 15 .10)
	      (- 5.00 price)))
	price)
     (* 1.50
	(+ 120
	   (* (/ 15 .10)
	      (- 5.00 price))))))

