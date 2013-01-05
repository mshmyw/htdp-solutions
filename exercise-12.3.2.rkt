;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 12.3.2|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A polygon is either
;; 1. (cons p empty) where p is a posn, or
;; 2. (cons p lop) where p is a posn structure and lop is a polygon.

;; draw-polygon : polygon -> true
;; to draw the polygon specified by a-poly
(define (draw-polygon a-poly)
  (connect-dots (first a-poly) a-poly))

;; connect-dots : polygon -> true
;; to draw connections between the dots of a-poly and a
;; specified dot
(define (connect-dots a-posn a-poly)
  (cond
    [(empty? (rest a-poly)) (draw-solid-line (first a-poly) a-posn 'Red)]
    [else (and (draw-solid-line (first a-poly) (second a-poly) 'Red)
               (connect-dots a-posn (rest a-poly)))]))

;; last : polygon -> posn
;; to extract the last posn on a-poly
(define (last a-poly)
  (cond
    [(empty? (rest a-poly)) (first a-poly)]
    [else (last (rest a-poly))]))

(start 300 300)
(draw-polygon (cons (make-posn 5 5)
                    (cons (make-posn 50 50)
                          (cons (make-posn 5 50) empty))))