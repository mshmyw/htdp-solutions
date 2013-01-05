;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.3.1|) (read-case-sensitive #t) (teachpacks ((lib "dir.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "dir.ss" "teachpack" "htdp")))))
;; A natural number [>= 1] (N[>= 1]) is either
;; 1. 1 or
;; 2. (add1 n) if n is a N[>= 1].

;; A list-of-symbols is either
;; 1. the empty list, empty, or
;; 2. (cons s lof) where s is a symbol and lof is a list of symbols.

;; list-pick0 : list-of-symbols N[>=0] -> symbol
;; to determine the nth symbol from alos, counting from 0;
;; signals error if there is no nth item
(define (list-pick0 a-los n)
  (cond
    [ (and (= n 0) (empty? a-los))
      (error 'list-pick "expected non-empty list")]
    [ (and (> n 0) (empty? a-los))
      (error 'list-pick "expected non-empty list")]
    [ (and (= n 0) (cons? a-los))
      (first a-los)]
    [ (and (> n 0) (cons? a-los))
      (list-pick0 (rest a-los) (sub1 n))]))
;; Examples:
(symbol=? (list-pick0 (list 'a 'b 'c 'd) 3)
          'd)
(list-pick0 (list 'a 'b 'c 'd) 4)
;; expected behavior:
(error 'list-pick0 "the list is too short")

