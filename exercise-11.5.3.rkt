;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 11.5.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; add : N N -> N
;; adds two numbers without using Schemes + primitive
(define (add x y)
  (cond
    [(zero? y) x]
    [else (add1 (add x (sub1 y)))])) 

;; multiply : N N -> number
;; to multiply x by y without using * or +
(define (multiply x y)    
  (cond
    [(zero? y) 0]
    [else (add x (multiply x (sub1 y)))]))

;; exponent: number N -> number
;; computes x^n
(define (exponent x n)
  (cond
    [(zero? n) 1]
    [else (multiply x (exponent x (sub1 n)))]))
;; tests:
(= (exponent 3 0) 1)
(= (exponent 0 3) 0)
(= (exponent 2 3) 8)