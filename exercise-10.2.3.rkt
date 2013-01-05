;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.2.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define-struct ir (name price))
;; an inventory-record (short: ir) is a structure:
;; (make-ir s n)
;; where s is a symbol and n is a (positive) number.

;; An inventory is either
;; 1. empty or
;; 2. (cons ir inv) where ir is an inventory-record and inv
;;    is an inventory.

;; price-of : symbol inventory ->
;; to produce the price of a toy in a given inventory
(define (price-of name an-inv)
  (cond
    [ (empty? an-inv) 'notInInventory]
    [ (symbol=? (ir-name (first an-inv)) name)
      (ir-price (first an-inv))]
    [ else (price-of name (rest an-inv))]))
;; test
(= (price-of 'poo (cons (make-ir 'cheese 4.50)
                        (cons (make-ir 'poo 3.25)
                              empty))) 3.25)
(symbol=? (price-of 'poo (cons (make-ir 'cheese 4.50)
                               (cons (make-ir 'giblet 5.25)
                                     empty))) 'notInInventory)