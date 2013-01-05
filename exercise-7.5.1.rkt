;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 7.5.1|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; area-of-disk : number -> number
;; to compute the area of a disk with radius r
(define (area-of-disk r)
(* 3.14 (* r r)))

;; checked-area-of-disk : Scheme-value -> number
;; to compute the area of a disk with radius v,
;; if v is a number
(define (checked-area-of-disk v)
  (cond
    [(and (number? v) (>= v 0)) (area-of-disk v)]
    [else (error 'checked-area-of-disk "positive number expected")]))
;; TESTS
(define-struct circle (center radius))
;; TEST 1
; (checked-area-of-disk 5)
;; expected result:
; (* 25 3.14)
;; TEST 2
; (checked-area-of-disk 'giblet)
;; expected result:
; "number expected"
;; TEST 3
; (checked-area-of-disk (make-circle (make-posn 0 4) 3))
;; expected result:
; "number expected"
;; TEST 4
; (checked-area-of-disk -5)
;; expected result:
; "positive number expected"
