;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-29.2.1) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; a number tree, ntree is either
;; 1. a number, or
;; 2. (list a b)
;; where a and b are number trees

;; sum-tree : ntree -> number
;; sums the elements of a number tree
(define (sum-tree nt)
  (if (number? nt)
      nt
      (+ (sum-tree (first nt))
         (sum-tree (second nt)))))
;; abstract time on the order of 2^N

;; TEST
(=
 (sum-tree (list (list (list 4 3)
                       (list 2 1))
                 (list (list 5 3)
                       (list (list 0 2)
                             (list 1 2)))))
 23)