;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-27.1.5) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; bezier : posn posn posn -> bool
(define (bezier p1 p2 p3)
  (local ((define r2
            (midpoint p1 p2))
          (define q2
            (midpoint p2 p3))
          (define p
            (midpoint r2 q2)))
    (if (or (< (distance p1 p) 20)
            (< (distance p p3) 20))
        (and (draw-solid-line p1 p)
             (draw-solid-line p p3))
        (and (bezier p1 r2 p)
             (bezier p q2 p3)))))

(define (midpoint a b)
  (make-posn (/ (+ (posn-x a) (posn-x b)) 2)
             (/ (+ (posn-y a) (posn-y b)) 2)))

(define (distance a b)
  (sqrt (+ (sqr (- (posn-x a) (posn-x b)))
           (sqr (- (posn-y b) (posn-y b))))))


;; TEST
(define p1 (make-posn 50 50)) 
(define p2 (make-posn 150 150)) 
(define p3 (make-posn 250 100)) 

(start 300 200)

(bezier p1 p2 p3)