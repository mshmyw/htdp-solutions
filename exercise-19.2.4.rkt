;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 19.2.4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; A (non-empty-listof ITEM) is either
;; 1. (cons s empty), or
;; 2. (cons s l) where l is a (non-empty-listof ITEM)
;; and s is always an ITEM.

;; last : (non-empty-listof ITEM) -> ITEM
(define (last neloi)
  (cond
    [(empty? (rest neloi)) (first neloi)]
    [else (last (rest neloi))]))

;; TEST:
(equal? (last (list 'a 4 'b)) 'b)
(equal? (last (list 4 'b 5)) 5)
        