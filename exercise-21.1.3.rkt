;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 21.1.3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; n-multiplier : number number -> number
;; produces n times x with additions only
(define (n-multiplier x n)
  (natural-f + 0 x n))

;; natural-f : (X Y -> Y) Y number -> Y
(define (natural-f f base-case x n)
  (cond
    [(zero? n) base-case]
    [else (f x
             (natural-f f
                        base-case
                        x
                        (sub1 n)))]))

;; copy : N X -> (listof X)
;; to create a list that contains
;; obj n times
(define (copy n obj)
  (natural-f cons empty obj n))

;; n-adder : N number -> number
;; to add n to x using
;; (+ 1 ...) only
(define (n-adder n x)
  (natural-f + x 1 n))

;; TESTS:
(= (n-multiplier 3 5) 15)
(equal? (copy 3 'b) (list 'b 'b 'b))
(= (n-adder 3 1) 4)