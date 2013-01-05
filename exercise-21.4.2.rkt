;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 21.4.2|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct rectangle (center width height color))
;; A rectangle is a structure
;; (make-rectangle c w h co)
;; where c is a posn, w and h are numbers, and co is a symbol.

;; process-rectangle : (rectangle -> X) rectangle -> X
(define (process-rectangle f arectangle)
  (f (rectangle-center arectangle)
     (rectangle-width arectangle)
     (rectangle-height arectangle)
     (rectangle-color arectangle)))

;; draw-a-rectangle : rectangle -> boolean
(define (draw-a-rectangle arectangle)
  (process-rectangle draw-solid-rect arectangle))

;; clear-a-rectangle : rectangle -> boolean
(define (clear-a-rectangle arectangle)
  (process-rectangle clear-solid-rect arectangle))

;; translate-rectangle : rectangle -> rectangle
(define (translate-rectangle arectangle offset)
  (local ((define (apply-offset c w h co)
            (make-rectangle (make-posn (+ offset (posn-x c))
                                       (posn-y c))
                            w
                            h
                            co)))
    (process-rectangle apply-offset arectangle)))

;; tests
(define my-rectangle (make-rectangle (make-posn 30 40) 50 40 'blue))
(start 300 300)
(draw-a-rectangle my-rectangle)
(sleep-for-a-while 1)
(clear-a-rectangle my-rectangle)
(sleep-for-a-while 1)
(draw-a-rectangle (translate-rectangle my-rectangle 50))