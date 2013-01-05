;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 11.4.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; product-from-minus-11 : N [>= -1] -> N
;; to produce product of the numbers between -11 (exclusive)
;; and n (incluseive
(define (product-from-minus-11 n)
  (cond
    [(= n -11) 1]
    [else (* n (product-from-minus-11 (sub1 n)))]))
;; test:
(= (product-from-minus-11 -8) -720)