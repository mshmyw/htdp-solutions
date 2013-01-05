;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 11.2.4|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A deep-list is either
;; 1. s where s is some symbol, or
;; 2. (cons dl empty), where dl is a deep-list.

;; depth : deep-list -> number
;; determines how many times cons was used to construct given dl
(define (depth dl)
  (cond
    [ (symbol? dl) 0]
    [ else (add1 (depth (first dl)))]))
;;test:
(= (depth (cons (cons (cons (cons 'poo empty) empty) empty) empty)) 4)

;; make-deep : symbol N -> deep-list
;; to produce a deep list containing s and constructed with n conses
(define (make-deep s n)
  (cond
    [ (zero? n) s]
    [ else (cons (make-deep s (sub1 n)) empty)]))
;; test:
(make-deep 'poo 4)
;; should yield:
(cons (cons (cons (cons 'poo empty) empty) empty) empty)