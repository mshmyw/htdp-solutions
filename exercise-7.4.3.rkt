;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 7.4.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define-struct rectangle (nw width height color))
;; A rectangle is a structure:
;; (make-rectangle (u x y z))
;; where u is a posn, x y are numbers, z a symbol

(define-struct circle (center radius color))
;; A circle is a structure:
;; (make-circle (x y z))
;; where x is a posn, y a number, z a symbol

;; A shape is either
;; 1. a circle, or
;; 2. a rectangle.

;; translate-shape : shape -> boolean
;; consumes a shape and translates it delta pixels on the x-axis
(define (translate-shape delta a-shape)
  (cond
    [(circle? a-shape)
     (make-circle (make-posn (+ delta 
                                (posn-x (circle-center a-shape)))
                             (posn-y (circle-center a-shape)))
                   (circle-radius a-shape)
                   (circle-color a-shape))]
    [(rectangle? a-shape)
     (make-rectangle (make-posn (+ delta
                                   (posn-x (rectangle-nw a-shape)))
                                (posn-y (rectangle-nw a-shape)))
                     (rectangle-width a-shape)
                     (rectangle-height a-shape)
                     (rectangle-color a-shape))]))
;; TESTS
(define test-circle (make-circle (make-posn 0 0) 10 'blue))
(define test-rectangle (make-rectangle (make-posn 0 0) 20 10 'red))
;; Test 1
(posn-x (circle-center (translate-shape 10 test-circle)))
;; expected value:
10
;; Test 2
(posn-x (rectangle-nw (translate-shape 10 test-rectangle)))
;; expected value:
10

