;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.2.5|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define-struct ir (name price))
;; an inventory-record (short: ir) is a structure:
;; (make-ir s n)
;; where s is a symbol and n is a (positive) number.

;; An inventory is either
;; 1. empty or
;; 2. (cons ir inv) where ir is an inventory-record and inv
;;    is an inventory.

;; extract>1 : inventory -> inventory
;; to consume an inventory and produce an inventory from
;; those records whose prices are above one dollar
(define (extract>1 an-inv)
  (cond
    [ (empty? an-inv) empty]
    [ (> (ir-price (first an-inv)) 1)
      (cons (first an-inv) (extract>1 (rest an-inv)))]
    [else (extract>1 (rest an-inv))]))
;; test:
(extract>1 (cons (make-ir 'dagger .95)
                 (cons (make-ir 'Barbie 17.95)
                       (cons (make-ir 'key-chain .55)
                             (cons (make-ir 'robot 22.05)
                                   empty)))))
;; should yeild:
(extract>1 (cons (make-ir 'Barbie 17.95)
                 (cons (make-ir 'robot 22.05)
                       empty)))