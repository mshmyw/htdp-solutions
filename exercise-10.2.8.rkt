;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.2.8|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define-struct ir (name price))
;; an inventory-record (short: ir) is a structure:
;; (make-ir s n) where s is a symbol and n is a (positive) number.

;; an inventory is either
;; 1. empty or
;; 2. (cons ir inv)
;; where ir is an inventory record and inv is an inventory.

;; recall : inventory -> inventory
;; to consume a toy and an inventory and produce an inventory
;; with all instances of the toy removed
(define (recall ty an-inv)
  (cond
    [ (empty? an-inv) empty]
    [ (symbol=? (ir-name (first an-inv)) ty)
      (recall ty (rest an-inv))]
    [ else (cons (first an-inv) (recall ty (rest an-inv)))]))
;; test:
(recall 'robot (cons (make-ir 'robot 22.30)
                     (cons (make-ir 'robot 22.30)
                           (cons (make-ir 'doll 12.50)
                                 (cons (make-ir 'dress 45.99)
                                       empty)))))
;; expected value:
(cons (make-ir 'doll 12.50)
      (cons (make-ir 'dress 45.99)
            empty))