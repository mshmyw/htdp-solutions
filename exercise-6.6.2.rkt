;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 6.6.2|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp")))))
(define-struct circle (center radius color))
;; circle is a structure: (make-circle (c, r, pc)) where c is a posn,
;; r is a number, and pc is a symbol

;; draw-a-circle : circle -> boolean
(define (draw-a-circle circ)
  (draw-circle (circle-center circ)
               (circle-radius circ)
               (circle-color circ)))