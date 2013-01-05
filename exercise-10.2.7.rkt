;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.2.7|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define-struct ir (name price))
;; an inventory-record (short: ir) is a structure:
;; (make-ir s n)
;; where s is a symbol and n is a (positive) number.

;; An inventory is either
;; 1. empty or
;; 2. (cons ir inv) where ir is an inventory-record and inv
;;    is an inventory.

;; raise-prices : inventory -> inventory
;; to consume an inventory and produce an inventory in
;; which all prices are raised by 5%
(define (raise-prices an-inv)
  (cond
    [ (empty? an-inv) empty]
    [ else (cons (make-ir (ir-name (first an-inv))
                          (* 1.05 (ir-price (first an-inv))))
                 (raise-prices (rest an-inv)))]))
;; test:
(raise-prices (cons (make-ir 'dagger .95)
                    (cons (make-ir 'Barbie 17.95)
                          (cons (make-ir 'key-chain .55)
                                (cons (make-ir 'robot 22.05)
                                      empty)))))
;; should yeild:
(cons (make-ir 'dagger .9975)
      (cons (make-ir 'Barbie 18.8475)
            (cons (make-ir 'key-chain .5775)
                  (cons (make-ir 'robot 23.1525)
                        empty))))