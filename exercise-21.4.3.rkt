;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 21.4.3|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct rectangle (nw width height color))
;; A rectangle is a structure:
;; (make-rectangle (u x y z))
;; where u is a posn, x y are numbers, z a symbol

(define-struct circle (center radius color))
;; A circle is a structure:
;; (make-circle (x y z))
;; where x is a posn, y a number, z a symbol

;; A shape is either
;; 1. a circle, or
;; 2. a rectangle.

;; process-shape : (shape -> X) shape -> X
(define (process-shape f a-shape)
  (cond
    [(circle? a-shape) (f (circle-center a-shape)
                          (circle-radius a-shape)
                          (circle-color a-shape))]
    [(rectangle? a-shape) (f (rectangle-nw a-shape)
                             (rectangle-width a-shape)
                             (rectangle-height a-shape)
                             (rectangle-color a-shape))]))

;; draw-shape : shape -> boolean
(define (draw-shape a-shape)
  (cond
    [(circle? a-shape) (process-shape draw-solid-disk a-shape)]
    [(rectangle? a-shape) (process-shape draw-solid-rect a-shape)]))

;; clear-shape : shape - boolean
(define (clear-shape a-shape)
  (cond
    [(circle? a-shape) (process-shape clear-solid-disk a-shape)]
    [(rectangle? a-shape) (process-shape clear-solid-rect a-shape)]))

;; translate-shape : shape -> shape
(define (translate-shape a-shape offset)
  (local ((define (apply-offset-circle c r co)
            (make-circle (make-posn (+ offset (posn-x c)) (posn-y c))
                         r
                         co))
          (define (apply-offset-rectangle nw w h co)
            (make-rectangle (make-posn (+ offset (posn-x nw)) (posn-y nw))
                         w
                         h
                         co)))
    (cond
      [(circle? a-shape) (process-shape apply-offset-circle a-shape)]
      [(rectangle? a-shape) (process-shape apply-offset-rectangle a-shape)])))

;; tests
(define my-circle (make-circle (make-posn 34 53) 20 'blue))
(define my-rectangle (make-rectangle (make-posn 76 86) 23 57 'red))
(start 300 300)
(and (draw-shape my-circle) (draw-shape my-rectangle))
(sleep-for-a-while 1)
(and (clear-shape my-circle) (clear-shape my-rectangle))
(sleep-for-a-while 1)
(and (draw-shape (translate-shape my-circle 40)) (draw-shape (translate-shape my-rectangle 40)))