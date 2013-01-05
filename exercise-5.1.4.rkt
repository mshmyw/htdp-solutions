;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 5.1.4|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp")))))
;; what-kind : number number number -> symbol
;; consumes coefficients a, b, and c of a proper quadratic equation
;; and either tells if it's degenerate or produces the number of solutions
(define (how-many a b c)
  (cond [(> (* b b) (* 4 a c)) 'two]
	[(= (* b b) (* 4 a c)) 'one]
	[else 'degenerate]))