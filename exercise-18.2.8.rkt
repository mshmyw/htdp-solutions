;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 18.2.8|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; A polygon is either
;; 1. (cons p empty) where p is a posn, or
;; 2. (cons p lop) where p is a posn structure and lop is a polygon.

;; draw-polygon : polygon -> true
;; to draw the polygon specified by a-poly
(define (draw-polygon a-poly)
  (local ((define (connect-dots a-poly)
            (cond
              [(empty? (rest a-poly)) true]
              [else (and (draw-solid-line (first a-poly) (second a-poly) 'red)
                         (connect-dots (rest a-poly)))]))
          (define (last a-poly)
            (cond
              [(empty? (rest a-poly)) (first a-poly)]
              [else (last (rest a-poly))])))
    
    (connect-dots (cons (last a-poly) a-poly))))