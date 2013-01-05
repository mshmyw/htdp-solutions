;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 11.5.2|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; add : N N -> N
;; adds two numbers without using Schemes + primitive
(define (add x y)
  (cond
    [(zero? y) x]
    [else (add1 (add x (sub1 y)))])) 

;; multiply-by-pi : N -> number
;; to multiply x by PI without using *
(define (multiply-by-pi x)
  (cond
    [(zero? x) 0]
    [else (+ 3.14 (multiply-by-pi (sub1 x)))]))
;; tests:
(= (multiply-by-pi 0) 0)
(= (multiply-by-pi 2) 6.28)
(= (multiply-by-pi 3) 9.42)

;; multiply : N N -> number
;; to multiply x by y without using * or +
(define (multiply x y)    
  (cond
    [(zero? y) 0]
    [else (add x (multiply x (sub1 y)))]))
;; tests:
(= (multiply 3 0) 0)
(= (multiply 5 2) 10)