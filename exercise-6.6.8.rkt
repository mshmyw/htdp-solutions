;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 6.6.8|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp")))))
(define-struct rectangle (corner width height color))
;; rectangle is a structure: (make-rectangle (c, w, h, cl)) where c is a posn,
;; w and h are numbers, and cl is a symbol

;; draw-a-rectangle: rectangle -> boolean
(define (draw-a-rectangle rect)
  (draw-solid-rect (rectangle-corner rect)
                   (rectangle-width rect)
                   (rectangle-height rect)
                   (rectangle-color rect)))