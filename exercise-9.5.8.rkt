;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 9.5.8|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; a list-of-numbers is either
;; 1. the empty list, empty, or
;; 2. (cons n lon) where n is a number and lon is a list of numbers.

;; draw-circles : posn list-of-numbers -> boolean
;; consumes a list of radii and a center for all of them, then draws them
;; on the screen in red
(define (draw-circles list-of-radii center)
  (cond
    [(empty? list-of-radii) true]
    [else (and (draw-circle center (first list-of-radii) 'red)
               (draw-circles (rest list-of-radii) center))]))
;; test:
(start 300 300)
(draw-circles (cons 2 (cons 4 (cons 8 (cons 16 (cons 32 (cons 64 empty))))))
              (make-posn 150 150))