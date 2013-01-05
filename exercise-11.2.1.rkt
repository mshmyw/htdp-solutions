;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 11.2.1|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A list of symbols is either
;; 1. empty, or
;; 2. (cons s los) where s is a symbol and los is a list of symbols

;; repeat : N 'symbol -> a-list-of-symbols
;; to consume a number n and a symbol and produce a list with n
;; occurences of the symbol
(define (repeat n s)
  (cond
    [ (zero? n) empty]
    [ else (cons s (repeat (sub1 n) s))]))
;; test:
(repeat 0 'poo)
(repeat 3 'poo)
;; should yeild:
empty
(cons 'poo (cons 'poo (cons 'poo empty)))