;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 20.1.3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; a-function=? : function function -> boolean
;; Determines whether two functions from numbers to numbers produce
;; the same results for 1.2, 3, and -5.7
(define (a-function=? f1 f2)
  (and (= (f1 1.2) (f2 1.2))
       (= (f1 3) (f2 3))
       (= (f1 -5.7) (f2 -5.7))))

;; TESTS:
(define (f x) (+ x 3))
(define (g x) (+ x (/ 9 3)))
(define (h x) (+ x 2))

(a-function=? f g)
(not (a-function=? g h))