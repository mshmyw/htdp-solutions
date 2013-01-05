;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-27.1.2) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define CENTER (make-posn 200 200))
 
(define RADIUS 200)

;; cicrcle-pt : number -> posn 
;; to compute a position on the circle with CENTER 
;; and RADIUS as defined above 
(define (circle-pt factor)
  (local ((define factor->radians (* factor (* 2 3.14))))
    (make-posn (+ (posn-x CENTER) (* 200 (cos factor->radians)))
               (+ (posn-y CENTER) (* 200 (sin factor->radians))))))

;; draw-triangle  posn posn posn -> true
(define (draw-triangle a b c)
  (and (draw-solid-line a b)
       (draw-solid-line b c)
       (draw-solid-line c a)))

;; TESTS:

(define A (circle-pt 120/360))
(define B (circle-pt 240/360))
(define C (circle-pt 360/360))

(start 400 400)
(draw-triangle A B C)