;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.2.1|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define-struct ir (name price))
;; an inventory-record (short: ir) is a structure:
;; (make-ir s n)
;; where s is a symbol and n is a (positive) number.

;; An inventory is either
;; 1. empty or
;; 2. (cons ir inv) where ir is an inventory-record and inv
;;    is an inventory.

;; contains-doll? : inventory -> boolean
;; to determine whether an-inv contains a record for 'doll
(define (contains-doll? an-inv)
  (cond
    [ (empty? an-inv) false]
    [ else (or (symbol=? (ir-name (first an-inv)) 'doll)
               (contains-doll? (rest an-inv)))]))
;; test
(boolean=? (contains-doll? (cons (make-ir 'cheese 12.13)
                                 (cons (make-ir 'poo 34.20)
                                       (cons (make-ir 'doll 0.30)
                                             empty))))
                           true)
(boolean=? (contains-doll? (cons (make-ir 'cheese 12.13)
                                 (cons (make-ir 'poo 34.20)
                                       (cons (make-ir 'doughnut 0.30)
                                             empty)))) 
                           false)

;; contains? : symbol inventory -> boolean
;; to determine whether inventory contains a record for asymbol
(define (contains? asymbol an-inv)
  (cond
    [ (empty? an-inv) false]
    [ else (or (symbol=? (ir-name (first an-inv)) asymbol)
               (contains? asymbol (rest an-inv)))]))
;; test
(boolean=? (contains? 'doll
                      (cons (make-ir 'cheese 12.13)
                            (cons (make-ir 'poo 34.20)
                                  (cons (make-ir 'doll 0.30)
                                        empty))))
           true)
(boolean=? (contains? 'doll
                      (cons (make-ir 'cheese 12.13)
                            (cons (make-ir 'poo 34.20)
                                  (cons (make-ir 'doughnut 0.30)
                                        empty)))) 
           false)