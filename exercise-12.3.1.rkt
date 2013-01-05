;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 12.3.1|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A polygon is either
;; 1. (cons p empty) where p is a posn, or
;; 2. (cons p lop) where p is a posn structure and lop is a polygon.

;; add-to-end : posn polygon -> polygon
;; adds given item to end of given polygon
(define (add-to-end a-posn a-poly)
  (cond
    [(empty? a-poly) (cons a-posn empty)]
    [else (cons (first a-poly) (add-to-end a-posn (rest a-poly)))]))
;; test:
(add-to-end (make-posn 99 99)
            (cons (make-posn 5 5)
                  (cons (make-posn 15 15)
                        (cons (make-posn 5 15) empty))))
;; should yield:
(cons (make-posn 5 5)
      (cons (make-posn 15 15)
            (cons (make-posn 5 15)
                  (cons (make-posn 99 99) empty))))

;; add-first-to-end : polygon -> polygon
;; adds the first item a polygon to its end
(define (add-first-to-end a-poly)
  (add-to-end (first a-poly) a-poly))
;; tests:
(add-first-to-end (cons (make-posn 5 5)
                  (cons (make-posn 15 15)
                        (cons (make-posn 5 15) empty))))
;; should yield:
(cons (make-posn 5 5)
      (cons (make-posn 15 15)
            (cons (make-posn 5 15)
                  (cons (make-posn 5 5) empty))))

;; draw-polygon : polygon -> true
;; to draw the polygon specified by a-poly
(define (draw-polygon a-poly)
  (cond
    [(empty? (rest a-poly)) true]
    [else (and (draw-solid-line (first a-poly) (second a-poly))
               (draw-polygon (rest a-poly)))]))