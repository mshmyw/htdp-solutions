;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 19.2.3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct pair1 (left right))
;; A (pair1 X Y) is a structure:
;; (make-pair1 l r)
;; where l is an X and r is a Y.

;; lefts : (listof (pair1 X Y)) -> (listof X)
;; extracts the left part of each item in its input
(define (lefts alop)
  (cond
    [(empty? alop) empty]
    [else (cons (pair1-left (first alop)) (lefts (rest alop)))]))

;; TEST
(equal? (lefts (list (make-pair1 3 5)
                     (make-pair1 'f 4)
                     (make-pair1 'g 'h)))
        (list 3 'f 'g))
                     
