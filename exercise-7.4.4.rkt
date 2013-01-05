;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 7.4.4|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
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

;; clear-shape : shape - boolean
;; consumes a shape and clears it on the canvas
(define (clear-shape a-shape)
  (cond
    [(circle? a-shape)
     (clear-circle (circle-center a-shape)
                   (circle-radius a-shape)
                   (circle-color a-shape))]
    [(rectangle? a-shape)
     (clear-solid-rect (rectangle-nw a-shape)
                       (rectangle-width a-shape)
                       (rectangle-height a-shape)
                       (rectangle-color a-shape))]))
;; TESTS
(define test-circle (make-circle (make-posn 30 50) 10 'blue))
(define test-rectangle (make-rectangle (make-posn 60 90) 20 10 'red))
(start 200 200)
;; Test 1
(draw-circle (make-posn 30 50) 10 'blue)
(sleep-for-a-while 2)
(clear-shape test-circle)
;; Test 2
(draw-solid-rect (make-posn 60 90) 20 10 'red)
(sleep-for-a-while 2)
(clear-shape test-rectangle)