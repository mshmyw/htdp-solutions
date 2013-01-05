;; A polynomial is either
;; 1. a number or
;; 2. (cons n lon) where n is a number and lon is a list of numbers

;; value : polynomial list-of-numbers -> number
;; consumes a polynomial and a list of coefficients, produces
;; value of polynomial
;; ASSUMPTION : both lists are of equal length
(define (value apoly alon)
  (cond
   [ (and (empty? apoly) (empty? alon)) 0]
   [ (not (and (cons? apoly) (cons? alon)))
     (error 'value "list mismatch")]
   [ else (+ (* (first apoly) (first alon))
	     (value (rest apoly) (rest alon)))]))
;; test:
(= (value (list 2 3 4 5) (list 2 3 4 5)) 54)