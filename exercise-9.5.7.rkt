;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 9.5.7|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; a list-of-prices is either
;; 1. the empty list, or
;; 2. (cons p lop) where p is a price and lop is a list of prices

;; how-many-numbers : list-of-numbers -> number
;; to consume a list of numbers and produce the number of items on the list
(define (how-many-numbers a-list-of-numbers)
  (cond
    [(empty? a-list-of-numbers) 0]
    [else (+ (how-many-numbers (rest a-list-of-numbers)) 1)]))

;; sum-prices : list-of-prices -> number
;; sums the elements of a given list
(define (sum-prices a-list-of-prices)
  (cond
    [(empty? a-list-of-prices) 0]
    [else (+ (first a-list-of-prices)
             (sum-prices (rest a-list-of-prices)))]))

;; average-price : list-of-prices -> number
;; consumes a list of toy prices and produces the average price of the toys
(define (average-price a-list-of-prices)
  (cond
    [(empty? a-list-of-prices) 0]
    [else (/ (sum-prices a-list-of-prices)
             (how-many-numbers a-list-of-prices))]))
;; tests:
(= (average-price (cons 7 (cons 4 (cons 4 empty)))) 5)
(= (average-price empty) 0)