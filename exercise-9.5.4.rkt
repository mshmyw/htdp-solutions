;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 9.5.4|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; a list-of-temps is either
;; 1. the empty list, or
;; 2. (cons t lot) where t is a number and lot is a list of temps

;; check-range1 : list-of-temps -> boolean
;; consumes list of temperatures and checks whether all are between 5 C and 95 C
(define (check-range1 a-list-of-temps)
  (cond
    [(empty? a-list-of-temps) true]
    [else (and (> (first a-list-of-temps) 5)
               (< (first a-list-of-temps) 95)
               (check-range1 (rest a-list-of-temps)))]))
;; tests:
(boolean=? (check-range1 empty)
true)
(boolean=? (check-range1 (cons 32 (cons 26 (cons 89 empty))))
true)
(boolean=? (check-range1 (cons 54 (cons 2 (cons 43 empty))))
false)

;; check-range2 : list-of-temps num num -> boolean
;; consumes list of temperatures and checks whether all are with the interval
(define (check-range2 a-list-of-temps lower upper)
  (cond
    [(empty? a-list-of-temps) true]
    [(< lower upper) (and (> (first a-list-of-temps) lower)
                          (< (first a-list-of-temps) upper)
                          (check-range2 (rest a-list-of-temps) lower upper))]
    [else (error 'check-range2 "given illegal interval")]))
;; tests:
(boolean=? (check-range2 empty 23 54)
true)
(boolean=? (check-range2 (cons 32 (cons 26 (cons 89 empty))) 23 100)
true)
(boolean=? (check-range2 (cons 54 (cons 2 (cons 43 empty))) 3 34)
false)
(check-range2 (cons 34 (cons 35 empty)) 43 20) ;; should throw error