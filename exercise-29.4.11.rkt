;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise-29.4.11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; id-vector : N -> vector
;; produces a vector of n 1s
(define (id-vector n)
  (build-vector n (lambda (i) 1)))

;; TESTS
(equal? (id-vector 0) (vector))
(equal? (id-vector 3) (vector 1 1 1))