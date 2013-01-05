;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 11.3.4|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A list of numbers is:
;; 1. empty, or
;; 2. (cons n lon) where n is a number and lon is a list-of-numbers

;; random-n-m : integer integer -> integer
;; to generate a random number between n and m-1
;; Assume: n < m
(define (random-n-m n m)
  (+ (random (- m n)) n))

;; create-prices : N -> list-of-numbers
;; to produce a list of n between $0.10 and $10.00 with increments
;; of a dime
(define (create-prices n)
  (cond
    [ (zero? n) empty]
    [ else (cons (* 0.10 (random-n-m 1 101))
                 (create-prices (sub1 n)))]))

;; a list-of-prices is either
;; 1. the empty list, empty, or
;; 2. (cons n lop) where n is a number and lop is a list of prices.

;; dolllar-store? : list-of-prices -> boolean
;; to consume a list of prices and check whether all of the prices are below 1
(define (dollar-store? a-list-of-prices)
  (cond
    [(empty? a-list-of-prices) true]
    [else (and (< (first a-list-of-prices) 1)
               (dollar-store? (rest a-list-of-prices)))]))
;; test:
(dollar-store? (create-prices 20))