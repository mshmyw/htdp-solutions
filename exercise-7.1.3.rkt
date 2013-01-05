;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 7.1.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; a shape is either
(define-struct circle (center radius))
;; 1. a circle structure: (make-circle p s)
;; where p is a posn and s is a number
;; or
(define-struct square (nw length))
;; 2. a square structurer: (make-square p s)
;; where p posn and s is a number.

;; perimeter : shape -> number
;; to compute the area of a-shape
(define (area a-shape)
  (cond
    [(square? a-shape)
     (sqr (square-length a-shape))]
    [(circle? a-shape)
     (* 3.14 (sqr (circle-radius a-shape)))]))
;; Tests
(area (make-square (make-posn 0 0) 4))
;; expected result:
16
(area (make-circle (make-posn 0 0) 4))
;; expected result:
(* 3.14 16)