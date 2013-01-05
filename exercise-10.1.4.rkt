;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.1.4|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; a list-of-numbers is:
;; 1. the empty list, or
;; 2. (cons n lon) where n is a number and lon is a list of numbers

;; dollar->euro : number -> number
;; to convert a dollar amount into a euro amount at x exchange rate
(define (dollar->euro x d)
    (* x d))

;; convert-euro : list-of-numbers -> list-of-numbers
;; to convert a list of dollar amounts to a list of euro amounts
(define (convert-euro a-lon)
  (cond
    [(empty? a-lon) empty]
    [else (cons (dollar->euro 1.22 (first a-lon))
                (convert-euro (rest a-lon)))]))
;; test 1:
(convert-euro empty)
;; expected result:
empty
;; test 2:
(convert-euro (cons 2 (cons 5 (cons 3 empty))))
;; expected result:
(cons 2.44 (cons 6.1 (cons 3.66 empty)))

;; convert-euro-1 : list-of-numbers -> list-of-numbers
;; to convert a list of dollar amounts to a list of euro amounts
(define (convert-euro-1 rate a-lon)
  (cond
    [(empty? a-lon) empty]
    [else (cons (dollar->euro rate (first a-lon))
                (convert-euro-1 rate (rest a-lon)))]))
;; test 1:
(convert-euro-1 1.22 empty)
;; expected result:
empty
;; test 2:
(convert-euro-1 1.22 (cons 2 (cons 5 (cons 3 empty))))
;; expected result:
(cons 2.44 (cons 6.1 (cons 3.66 empty)))