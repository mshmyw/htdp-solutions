;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 21.1.1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; tabulate-sin : number -> lon
;; to tabulate sin between n
;; and 0 (inclusive) in a list
(define (tabulate-sin n)
  (tabulate sin n))

;; tabulate-tan : number -> lon
;; to tabulate sqrt between n
;; and 0 (inclusive) in a list
(define (tabulate-tan n)
  (tabulate tan n))

;; tabulate-sqrt : number -> lon
;; to tabulate sqrt between n
;; and 0 (inclusive) in a list
(define (tabulate-sqr n)
  (tabulate sqr n))

;; tabulate-sqrt : number -> lon
;; to tabulate sqrt between n
;; and 0 (inclusive) in a list
(define (tabulate-sqrt n)
  (tabulate sqrt n))

;; tabulate : (number -> number) n -> (listof number)
;; or
;; tabulate: (X -> Y) N -> (listof Y)
(define (tabulate f n)
  (cond
    [(= n 0) (list (f 0))]
    [else
     (cons (f n)
           (tabulate f (sub1 n)))]))
   
;; TESTS
(equal? (tabulate-sin 4) (list (sin 4) (sin 3) (sin 2) (sin 1) (sin 0)))
(equal? (tabulate-tan 4) (list (tan 4) (tan 3) (tan 2) (tan 1) (tan 0)))
(equal? (tabulate-sqr 4) (list (sqr 4) (sqr 3) (sqr 2) (sqr 1) (sqr 0)))
(equal? (tabulate-sqrt 4) (list (sqrt 4) (sqrt 3) (sqrt 2) (sqrt 1) (sqrt 0)))