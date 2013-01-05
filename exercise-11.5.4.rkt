;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 11.5.4|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A deep-list is either
;; 1. s where s is some symbol, or
;; 2. (cons dl empty), where dl is a deep-list.

;; depth : deep-list -> number
;; determines how many times cons was used to construct given dl
(define (depth dl)
  (cond
    [ (symbol? dl) 0]
    [ else (add1 (depth (first dl)))]))

;; make-deep : symbol N -> deep-list
;; to produce a deep list containing s and constructed with n conses
(define (make-deep s n)
  (cond
    [ (zero? n) s]
    [ else (cons (make-deep s (sub1 n)) empty)]))

;; addDl deep-list : deep-list deep-list -> deep-list
;; adds two deep lists representing the natural numbers n and m
;; and produces a deep list representing n + m.
(define (addDl dl1 dl2)
  (cond
    [ (empty? dl2) dl1]
    [ else (addDl (cons dl1 empty) (first dl2))]))
;; test
(addDl (cons (cons (cons (cons empty empty) empty) empty) empty)
       (cons (cons empty empty) empty))
;; should yield:
(cons (cons (cons (cons (cons (cons empty empty) empty) empty) empty) empty) empty)
;; and
(addDl (cons (cons (cons (cons (cons empty empty) empty) empty) empty) empty)
       (cons (cons (cons (cons (cons empty empty) empty) empty) empty) empty))
;; should yield:
(cons (cons (cons (cons (cons (cons (cons (cons (cons (cons empty empty) empty) empty) empty) empty) empty) empty) empty) empty) empty)