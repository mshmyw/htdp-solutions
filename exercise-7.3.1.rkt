;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 7.3.1|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;; VERSION 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct circle (center radius))
(define-struct square (nw length))
(define-struct rectangle (nw width height))
;; A shape is either
;; 1. a structure: (make-circle p s)
;; where p is a posn, s is a number
;; 2. a structure: (make-square p s)
;; where p is a posn, s is a number
;; 3. a structure: (make-rectangle p w h)
;; where p is a posn, w and h are numbers
;; perimeter: shape -> number
;; to compute the perimeter of a-shape
(define (perimeter a-shape)
  (cond
    [(circle? a-shape)
     (* (* 2 (circle-radius a-shape)) pi)]
    [(square? a-shape)
     (* (square-length a-shape) 4)]
    [(rectangle? a-shape)
     (+ (* 2 (rectangle-height a-shape)) (* 2 (rectangle-width a-shape)))]))
;; test 1:
(perimeter (make-circle (make-posn 0 0) 1))
;; expected result:
6.28
;; test 2:
(perimeter (make-square (make-posn 0 0) 2))
;; expected result:
8
;; test 3:
(perimeter (make-rectangle (make-posn 0 0) 2 3))
;; expected result:
10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; VERSION 2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct circle1 (center radius))
;; A circle1 is a structure:
;; (make-circle1 p s)
;; where p is a posn, s a number

(define-struct square1 (nw length))
;; A square1 is a structure:
;; (make-square1 p s)
;; where p is a posn, s a number

(define-struct rectangle1 (nw width height))
;; A rectangle1 is a structure:
;; (make-rectangle1 p w h)
;; where p is a posn, w and h are numbers

;; A shape1 is either
;; 1. a circle1,
;; 2. a square1, or
;; 3. a rectangle1

;; perimeter1 : shape1 -> number
;; to compute perimeter of a-shape1
(define (perimeter1 a-shape1)
  (cond
    [(circle1? a-shape1)
     (perimeter1-circle1 a-shape1)]
    [(square1? a-shape1)
     (perimeter1-square1 a-shape1)]
    [(rectangle1? a-shape1)
     (perimeter1-rectangle1 a-shape1)]))

;; perimeter1-circle1 : circle1 -> number
;; computes the perimeter of a-circle1
(define (perimeter1-circle1 a-circle1)
  (* (* 2 (circle1-radius a-circle1)) pi))

;; perimeter1-square1 : square1 -> number
;; computes the perimeter of a-square1
(define (perimeter1-square1 a-square1)
  (* (square1-length a-square1) 4))

;; perimeter1-rectangle1 : rectangle1 -> number
(define (perimeter1-rectangle1 a-rectangle1)
  (+ (* 2 (rectangle1-height a-rectangle1))
     (* 2 (rectangle1-width a-rectangle1))))

;; test 1:
(perimeter1 (make-circle1 (make-posn 0 0) 1))
;; expected result:
6.28
;; test 2:
(perimeter1 (make-square1 (make-posn 0 0) 2))
;; expected result:
8
;; test 3:
(perimeter1 (make-rectangle1 (make-posn 0 0) 2 3))
;; expected result:
10