;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.1.5|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; a list-of-numbers is:
;; 1. the empty list, or
;; 2. (cons n lon) where n is a number and lon is a list of numbers

;; eliminate-exp : number list-of-numbers -> list-of-numbers
;; to consume a number and a list of toy prices and produce
;; a list of toy prices are equal to or cheaper than the
;; given number
(define (eliminate-exp ua lotp)
  (cond
    [(empty? lotp) empty]
    [(<= (first lotp) ua) (cons (first lotp)
                               (eliminate-exp ua (rest lotp)))]
    [else (eliminate-exp ua (rest lotp))]))
;; test:
(eliminate-exp 1.0 (cons 2.95 (cons .95 (cons 1.0 (cons 5 empty)))))
;; expected value:
(cons .95 (cons 1.0 empty))