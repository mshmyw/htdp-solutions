;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 21.4.1|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct circle (center radius color))
;; A circle is a structure
;; (make-circle c r co)
;; where c is a posn, r is a number, and co is a symbol.

;; process-circle : (circle -> X) circle -> X
(define (process-circle f acircle)
  (f (circle-center acircle)
     (circle-radius acircle)
     (circle-color acircle)))

;; draw-a-circle : circle -> boolean
(define (draw-a-circle acircle)
  (process-circle draw-solid-disk acircle))

;; clear-a-circle : circle -> boolean
(define (clear-a-circle acircle)
  (process-circle clear-solid-disk acircle))

;; translate-circle : circle -> circle
(define (translate-circle acircle offset)
  (local ((define (apply-offset c r co)
            (make-circle (make-posn (+ offset (posn-x c))
                                    (posn-y c))
                         r
                         co)))
    (process-circle apply-offset acircle)))

;; tests
(define my-circle (make-circle (make-posn 30 40) 50 'blue))
(start 300 300)
(draw-a-circle my-circle)
(sleep-for-a-while 1)
(clear-a-circle my-circle)
(sleep-for-a-while 1)
(draw-a-circle (translate-circle my-circle 50))