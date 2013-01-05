;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 11.3.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A list of numbers is:
;; 1. empty, or
;; 2. (cons n lon) where n is a number and lon is a list-of-numbers

;; random-n-m : integer integer -> integer
;; to generate a random number between n and m-1
;; Assume: n < m
(define (random-n-m n m)
  (+ (random (- m n)) n))

;; create-temps : N number number -> list-of-numbers
;; to produce a list of n numbers between low and high
(define (create-temps n low high)
  (cond
    [ (zero? n) empty]
    [ else (cons (random-n-m low (+ high 1)) 
                 (create-temps (sub1 n) low high))]))

;; check-range2 : list-of-temps num num -> boolean
;; consumes list of temperatures and checks whether all are with the interval
(define (check-range2 a-list-of-temps lower upper)
  (cond
    [(empty? a-list-of-temps) true]
    [(< lower upper) (and (> (first a-list-of-temps) lower)
                          (< (first a-list-of-temps) upper)
                          (check-range2 (rest a-list-of-temps) lower upper))]
    [else (error 'check-range2 "given illegal interval")]))
;; test:
(boolean=? (check-range2 (create-temps 40 20 120) 21 119) true)