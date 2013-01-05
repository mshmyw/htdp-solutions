;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.2.9|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define-struct ir (name price))
;; an inventory-record (short: ir) is a structure:
;; (make-ir s n) where s is a symbol and n is a (positive) number.

;; an inventory is either
;; 1. empty or
;; 2. (cons ir inv)
;; where ir is an inventory record and inv is an inventory.

;; name-robot : inventory -> inventory
;; to replace all occurrences of 'robot with 'r2d2
(define (name-robot an-inv)
  (cond
    [ (empty? an-inv) empty]
    [ (symbol=? (ir-name (first an-inv)) 'robot)
      (cons (make-ir 'r2d2
                     (ir-price (first an-inv)))
                     (name-robot (rest an-inv)))]
    [ else (cons (first an-inv)
                 (name-robot (rest an-inv)))])) 
;; test:
(name-robot (cons (make-ir 'truck 12.45)
                  (cons (make-ir 'game 23.45)
                        (cons (make-ir 'robot 23.34)
                              empty))))
;; expected result:
(cons (make-ir 'truck 12.45)
                  (cons (make-ir 'game 23.45)
                        (cons (make-ir 'r2d2 23.34)
                              empty)))

;; substitute : symbol symbol inventory -> inventory
;; to replace all occurrences of old with new
(define (substitute old new an-inv)
  (cond
    [ (empty? an-inv) empty]
    [ (symbol=? (ir-name (first an-inv)) old)
      (cons (make-ir new
                     (ir-price (first an-inv)))
            (substitute old new (rest an-inv)))]
    [ else (cons (first an-inv)
                 (substitute old new (rest an-inv)))])) 
;; test:
(substitute 'robot 'r2d2 (cons (make-ir 'truck 12.45)
                              (cons (make-ir 'game 23.45)
                                    (cons (make-ir 'robot 23.34)
                                          empty))))
;; expected result:
(cons (make-ir 'truck 12.45)
      (cons (make-ir 'game 23.45)
            (cons (make-ir 'r2d2 23.34)
                  empty)))