;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 9.5.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
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
;; tests
(boolean=? (dollar-store? empty)
           true)
(boolean=? (not (dollar-store? (cons .75 (cons 1.95 (cons .25 empty)))))
           true)
(boolean=? (dollar-store? (cons .75 (cons .95 (cons .25 empty))))
           true)

;; gen-dollar-store? : list-of-prices threshold -> boolean
;; to consume a list of prices and a threshold price and check
;; that all prices in the list are below threshold
(define (gen-dollar-store? a-list-of-prices threshold)
  (cond
    [(empty? a-list-of-prices) true]
    [else (and (< (first a-list-of-prices) threshold)
               (gen-dollar-store? (rest a-list-of-prices) threshold ))]))
;; tests
(boolean=? (gen-dollar-store? empty 29)
           true)
(boolean=? (not (gen-dollar-store? (cons .75 (cons 1.95 (cons .25 empty))) .12))
           true)
(boolean=? (gen-dollar-store? (cons .75 (cons .95 (cons .25 empty))) 23)
           true)