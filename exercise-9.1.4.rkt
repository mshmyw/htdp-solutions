;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 9.1.4|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A list-of-2-symbols is
;; (cons a (cons b empty))
;; where a and b are symbols

;; contains-2-doll? : list-of-2-symbols -> boolean
;; to consume two symbols and determine if one is 'doll
(define (contains-2-doll? a-list-of-2-symbols)
  (or (symbol=? (first a-list-of-2-symbols) 'doll)
      (symbol=? (first (rest a-list-of-2-symbols)) 'doll)))
;; tests
(boolean=? (contains-2-doll? (cons 'jesus (cons 'poo empty))) false)
(boolean=? (contains-2-doll? (cons 'jesus (cons 'doll empty))) true)