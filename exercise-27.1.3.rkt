;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-27.1.3) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct tri (a b c))
;; A tri is a structure:
;; (make-tri x y z)
;; where x, y, and z are structures

;; draw-triangle  tri -> true
(define (draw-triangle atri)
  (and (draw-solid-line (tri-a atri) (tri-b atri))
       (draw-solid-line (tri-b atri) (tri-c atri))
       (draw-solid-line (tri-c atri) (tri-a atri))))

;; too-small? : tri -> bool
(define (too-small? atri)
  (local ((define threshold 1))
    (or (> threshold (distance (tri-a atri) (tri-b atri)))
        (> threshold (distance (tri-b atri) (tri-c atri)))
        (> threshold (distance (tri-c atri) (tri-a atri))))))

;; distance : posn posn -> number
(define (distance a b)
  (sqrt (+ (sqr (- (posn-x a) (posn-x b)))
           (sqr (- (posn-y a) (posn-y b))))))

;; sierpinski : posn posn posn -> true 
;; to draw a Sierpinski triangle down at a, b, and c, 
;; assuming it is large enough 
(define (sierpinski atri) 
  (cond 
    [(too-small? atri) true] 
    [else  
     (local ((define a-b (mid-point (tri-a atri) (tri-b atri))) 
             (define b-c (mid-point (tri-b atri) (tri-c atri))) 
             (define c-a (mid-point (tri-a atri) (tri-c atri)))) 
       (and 
        (draw-triangle atri)
        (sierpinski (make-tri (tri-a atri) a-b c-a))
        (sierpinski (make-tri (tri-b atri) a-b b-c))
        (sierpinski (make-tri (tri-c atri) c-a b-c))))]))

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
(define my-tri (make-tri (make-posn 200 0)
                         (make-posn 27 300)
                         (make-posn 373 300)))
(define my-tris (list (make-tri (make-posn 200 0)
                                (make-posn 27 300)
                                (make-posn 373 300))
                      (make-tri (make-posn 93 144)
                                (make-posn 122 399)
                                (make-posn 23 3))
                      (make-tri (make-posn 299 400)
                                (make-posn 133 144)
                                (make-posn 3 23))))
 
(start 400 400)

;(draw-triangle my-tri)
;(too-small? my-tri)
(map sierpinski my-tris)