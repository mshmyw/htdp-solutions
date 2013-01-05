;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 9.5.2|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; a list-of-symbols is either
;; 1. the empty list, empty, or
;; 2. (cons s los) where s is a symbol and los is a list of symbols.

;; a list-of-numbers is either
;; 1. the empty list, empty, or
;; 2. (cons n lon) where n is a number and lon is a list of numbers.

;; how-many-symbols : list-of-symbols -> number
;; to consume a list of symbols and produce the number of items on the list
(define (how-many-symbols a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) 0]
    [else (+ (how-many-symbols (rest a-list-of-symbols)) 1)]))
;; test:
(= (how-many-symbols empty) 0)
(= (how-many-symbols (cons 'cheese empty)) 1)
(= (how-many-symbols (cons 'poo (cons 'bla (cons 'fudge empty)))) 3)

;; how-many-numbers : list-of-numbers -> number
;; to consume a list of numbers and produce the number of items on the list
(define (how-many-numbers a-list-of-numbers)
  (cond
    [(empty? a-list-of-numbers) 0]
    [else (+ (how-many-numbers (rest a-list-of-numbers)) 1)]))
;; test:
(= (how-many-numbers empty) 0)
(= (how-many-numbers (cons 54 empty)) 1)
(= (how-many-numbers (cons 2 (cons 5 (cons 6 empty)))) 3)