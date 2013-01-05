;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise-17.6.1) (read-case-sensitive #t) (teachpacks ((lib "dir.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "dir.ss" "teachpack" "htdp")))))
;; merge : list-of-numbers (sorted ascending)
;;         list-of-numbers (sorted ascending)
;;         -> list-of-numbers (sorted ascending)
;; Produces a single list of sorted numbers by combining two
;; given lists
(define (merge alon1 alon2)
  (cond
    [ (empty? alon1) alon2]
    [ (empty? alon2) alon1]
    [ (<= (first alon1) (first alon2))
      (cons (first alon1) (merge (rest alon1) alon2))]
    [ else (cons (first alon2) (merge alon1 (rest alon2)))]))
      
;; Examples:
(merge (list 1 3 5 7 9) (list 0 2 4 6 8))
;; expected value:
(list 0 1 2 3 4 5 6 7 8 9)
(merge (list 1 8 8 11 12) (list 2 3 4 8 13 14))
;; expected value:
(list 1 2 3 4 8 8 8 11 12 13 14)
