;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 12.4.1|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A word is either
;; 1. empty, or
;; 2. (cons a w) where a is a symbol ('a, 'b, ..., 'z) and w is a word.
;; For example:
;; (cons 'p (cons 'o (cons 'o (cons 'p empty))))
;; (cons 'p (cons 'e (cons 'e empty)))
;; (cons 'b (cons 'a (cons 'r (cons 'f empty))))

;; A list-of-words is either
;; 1. empty, or
;; 2. (cons w low) where w is a word and low is a list of words
;; For example:
;; (cons (cons 'p (cons 'o (cons 'o (cons 'p empty))))
;;       (cons (cons 'p (cons 'e (cons 'e empty)))
;;             (cons (cons 'b (cons 'a (cons 'r (cons 'f empty))))
;;                   empty)))
