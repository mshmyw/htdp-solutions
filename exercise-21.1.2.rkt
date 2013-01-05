;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 21.1.2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; map : (X -> Y) (listof X) -> (listof Y)
(define (map1 f lon)
  (local ((define (consg x lox) (cons (f x) lox)))
    (fold consg empty lon)))

;; append1 : (listof X) (listof X) -> (listof X)
;; replaces empty of l1 with l2
(define (append1 l1 l2)
  (fold cons l2 l1))

;; sum : (listof number) -> number
;; to compute the sum of
;; the numbers on alon
(define (sum alon)
  (fold + 0 alon))

;; product : (listof number) -> number
;; to compute the product of
;; the numbers on alon
(define (product alon)
  (fold * 1 alon))

;; fold : (X Y -> Y) Y Y -> Y
(define (fold f base-case alon)
  (cond
    [(empty? alon) base-case]
    [else (f (first alon)
             (fold f base-case (rest alon)))]))

;; TESTS
(equal? (map1 sqr (list 1 2 3))
        (list 1 4 9))
(equal? (append1 (list 1 2 3) (list 4 5 6 7 8))
        (list 1 2 3 4 5 6 7 8))
(= (sum (list 1 2 3 4)) 10)
(= (product (list 1 2 3)) 6)