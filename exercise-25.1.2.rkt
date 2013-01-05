;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |exercise 25.1.2|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct ball (x y delta-x delta-y)) 
;; A ball is a structure: 
;; (make-ball number number number number)

;; move-balls : (listof ball) -> true
;; moves each ball until all are out of bounds
(define (move-balls alob)
  (local ((define in-bounds-balls
            (filter (lambda (a-ball) (not (out-of-bounds? a-ball)))
                    alob)))
    (cond
      [(empty? in-bounds-balls) true]
      [else (and (draw-and-clear in-bounds-balls)
                 (move-balls (map move-ball in-bounds-balls)))])))

;; out-of-bounds? : a-ball -> boolean 
;; to determine whether a-ball is outside of the bounds 
;; domain knowledge, geometry 
(define (out-of-bounds? a-ball) 
  (not 
   (and 
     (<= 0 (ball-x a-ball) WIDTH) 
     (<= 0 (ball-y a-ball) HEIGHT)))) 

;; draw-and-clear : alob -> true 
;; draw, sleep, clear a list of disks from the canvas 
;; structural design, Scheme knowledge 
(define (draw-and-clear alob)
  (local ((define (draw-ball a-ball)
            (draw-solid-disk (make-posn (ball-x a-ball) (ball-y a-ball)) 5 'red))
          (define (clear-ball a-ball)
            (clear-solid-disk (make-posn (ball-x a-ball) (ball-y a-ball)) 5 'red)))
    (and (andmap draw-ball alob)
         (sleep-for-a-while DELAY) 
         (andmap clear-ball alob))))
 
;; move-ball : ball -> ball 
;; to create a new ball, modeling a move by a-ball 
;; structural design, physics knowledge 
(define (move-ball a-ball)  
  (make-ball (+ (ball-x a-ball) (ball-delta-x a-ball)) 
             (+ (ball-y a-ball) (ball-delta-y a-ball)) 
             (ball-delta-x a-ball) 
             (ball-delta-y a-ball))) 
 
;; Dimension of canvas 
(define WIDTH 100) 
(define HEIGHT 100) 
(define DELAY .1)

;; TEST:
(define ma-balls (list (make-ball 20 20 10 10)
                       (make-ball 90 20 -30 0)
                       (make-ball 50 20 -5 -3)))

(start WIDTH HEIGHT)
(move-balls ma-balls)