;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.1.7|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; a list-of-symbols is:
;; 1. the empty list, or
;; 2. (cons s los) where s is a number and los is a list of numbers

;; recall : symbol list-of-symbols -> list-of-symbols
;; to consume a toy and a list of names and produce a list of names
;; with all instances of the toy removed
(define (recall ty lon)
  (cond
    [ (empty? lon) empty]
    [ (symbol=? (first lon) ty) (recall ty (rest lon))]
    [ else (cons (first lon) (recall ty (rest lon)))]))
;; test:
(recall 'robot (cons 'robot (cons 'doll (cons 'dress empty))))
;; expected value:
(cons 'doll (cons 'dress empty))
