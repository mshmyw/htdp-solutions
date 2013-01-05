;; How to design a program
(define FIXED-COST 180)
(define COST-PER-ATTENDEE 0.04)
(define BASELINE-ATTENDANCE 120)
(define ATTENDANCE-INCREASE 15)
(define PRICE-INCREASE .10)
(define BASELINE-PRICE 5.00)

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (revenue ticket-price)
  (* (attendees ticket-price) ticket-price))

(define (cost ticket-price)
  (+ FIXED-COST
     (* COST-PER-ATTENDEE (attendees ticket-price))))

(define (attendees ticket-price)
  (+ BASELINE-ATTENDANCE
     (* (/ ATTENDANCE-INCREASE PRICE-INCREASE) (- BASELINE-PRICE ticket-price))))
