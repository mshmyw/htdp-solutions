;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 9.5.6|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; a list-of-prices is either
;; 1. the empty list, or
;; 2. (cons p lop) where p is a price and lop is a list of prices

;; sum-prices : list-of-prices -> number
;; sums the elements of a given list
(define (sum-prices a-list-of-prices)
  (cond
    [(empty? a-list-of-prices) 0]
    [else (+ (first a-list-of-prices)
             (sum-prices (rest a-list-of-prices)))]))
;; tests
(= (sum-prices (cons 2 (cons 4 (cons 5 empty)))) 11)

;; delta : list-of-prices list-of-prices -> number
;; consumes a list representing an inventory at an initial time and a list
;; representing inventory at a final time and produces the change in price
(define (delta list1 list2)
  (- (sum-prices list2) (sum-prices list1)))
;; tests:
(= (delta (cons 3 (cons 4 (cons 2 empty))) (cons 2 (cons 5 (cons 2 empty)))) 0)
(= (delta (cons 3 (cons 4 (cons 2 empty))) (cons 2 (cons 5 (cons 4 empty)))) 2)
(= (delta (cons 3 (cons 4 (cons 5 empty))) (cons 2 (cons 5 (cons 4 empty)))) -1)