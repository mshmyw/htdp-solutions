;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 9.5.5|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; a list-of-digits is either
;; 1. the empty list, or
;; 2. (cons d lod) where d is a digit and lod is a list of digits

;; convert : list-of-digits -> number
;; consumes a list of digits, least significant to most, and outputs number
(define (convert a-list-of-digits)
  (cond
    [(empty? a-list-of-digits) 0]
    [else (+ (first a-list-of-digits)
             (* 10 (convert (rest a-list-of-digits))))]))
;; tests:
(= (convert empty) 0)
(= (convert (cons 3 (cons 4 (cons 2 empty)))) 243)

;; check-guess-for-list : list-of-digits number -> symbol
;; consumes a guess and a number to be guessed and tells how they relate
(define (check-guess-for-list guess target)
  (cond
    [(< (convert guess) target) 'TooSmall]
    [(> (convert guess) target) 'TooLarge]
    [(= (convert guess) target) 'Perfect]))
;; tests:
(symbol=? (check-guess-for-list (cons 3 (cons 4 empty)) 42) 'TooLarge)
(symbol=? (check-guess-for-list (cons 1 (cons 5 (cons 9 empty))) 1000) 'TooSmall)
(symbol=? (check-guess-for-list (cons 3 (cons 2 empty)) 23) 'Perfect)