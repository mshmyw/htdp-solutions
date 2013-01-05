;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-27.1.1) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; draw-triangle  posn posn posn -> true
(define (draw-triangle a b c)
  (and (draw-solid-line a b)
       (draw-solid-line b c)
       (draw-solid-line c a)))

;; too-small? : posn posn posn -> bool
(define (too-small? a b c)
  (local ((define threshold 1))
    (or (> threshold (distance a b))
        (> threshold (distance b c))
        (> threshold (distance c a)))))

;; distance : posn posn -> number
(define (distance a b)
  (sqrt (+ (sqr (- (posn-x a) (posn-x b)))
           (sqr (- (posn-y a) (posn-y b))))))

;; sierpinski : posn posn posn -> true 
;; to draw a Sierpinski triangle down at a, b, and c, 
;; assuming it is large enough 
(define (sierpinski a b c) 
  (cond 
    [(too-small? a b c) true] 
    [else  
      (local ((define a-b (mid-point a b)) 
         (define b-c (mid-point b c)) 
         (define c-a (mid-point a c))) 
   (and 
     (draw-triangle a b c)            
     (sierpinski a a-b c-a) 
     (sierpinski b a-b b-c) 
     (sierpinski c c-a b-c)))])) 
 
;; mid-point : posn posn -> posn 
;; to compute the mid-point between a-posn and b-posn 
(define (mid-point a-posn b-posn) 
  (make-posn 
    (mid (posn-x a-posn) (posn-x b-posn)) 
    (mid (posn-y a-posn) (posn-y b-posn)))) 
 
;; mid : number number -> number 
;; to compute the average of x and y 
(define (mid x y) 
  (/ (+ x y) 2)) 

;; TESTS
(define A (make-posn 200 0)) 
(define B (make-posn 27 300)) 
(define C (make-posn 373 300) )
 
(start 400 400)

;(draw-triangle A B C)
;(too-small? A B C)
(sierpinski A B C)