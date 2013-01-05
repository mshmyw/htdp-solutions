;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 21.4.5|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "arrow.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "arrow.ss" "teachpack" "htdp")))))
(define-struct rectangle (nw width height color))
;; A rectangle is a structure:
;; (make-rectangle (u x y z))
;; where u is a posn, x y are numbers, z a symbol

(define-struct circle (center radius color))
;; A circle is a structure:
;; (make-circle (x y z))
;; where x is a posn, y a number, z a symbol

(define-struct line (start end color))
;; A line is a structure:
;; (make-line (s e c))
;; where s and e are posns and c is a symbol

;; A shape is either
;; 1. a circle
;; 2. a rectangle, or
;; 3. a line.

(define LUNAR (list (make-circle (make-posn 150 20) 30 'darkgray)
                    (make-rectangle (make-posn 115 50) 70 40 'darkblue)
                    (make-line (make-posn  115 50) (make-posn 80 160) 'yellow)
                    (make-line (make-posn  185 50) (make-posn 220 160) 'yellow)
                    (make-line (make-posn  150 90) (make-posn 150 160) 'yellow)))

;; lunar-lander : number (listof shape) -> (listof boolean)
(define (lunar-lander x distance alosh)
  (cond
    [(= distance 0) alosh]
    [else (cond
            [(and (cons? (draw-losh alosh))
                  (sleep-for-a-while .0001)
                  (cons? (clear-losh alosh)))
             (lunar-lander x (sub1 distance) (translate-losh alosh x))])]))

;; process-shape : (shape -> X) shape -> X
(define (process-shape f a-shape)
  (cond
    [(circle? a-shape) (f (circle-center a-shape)
                          (circle-radius a-shape)
                          (circle-color a-shape))]
    [(rectangle? a-shape) (f (rectangle-nw a-shape)
                             (rectangle-width a-shape)
                             (rectangle-height a-shape)
                             (rectangle-color a-shape))]
    [(line? a-shape) (f (line-start a-shape)
                        (line-end a-shape)
                        (line-color a-shape))]))

;; draw-losh : (listof shape) -> (listof boolean)
(define (draw-losh alosh)
  (map draw-shape alosh))

;; clear-losh : (listof shape) -> (listof boolean)
(define (clear-losh alosh)
  (map clear-shape alosh))

;; translate-losh : (listof shape) -> (listof shape)
(define (translate-losh alosh offset)
  (local ((define (translate-by-offset ashape)
            (translate-shape ashape offset)))
    (map translate-by-offset alosh)))

;; draw-shape : shape -> boolean
(define (draw-shape a-shape)
  (cond
    [(circle? a-shape) (process-shape draw-solid-disk a-shape)]
    [(rectangle? a-shape) (process-shape draw-solid-rect a-shape)]
    [(line? a-shape) (process-shape draw-solid-line a-shape)]))

;; clear-shape : shape - boolean
(define (clear-shape a-shape)
  (cond
    [(circle? a-shape) (process-shape clear-solid-disk a-shape)]
    [(rectangle? a-shape) (process-shape clear-solid-rect a-shape)]
    [(line? a-shape) (process-shape clear-solid-line a-shape)]))

;; translate-shape : shape -> shape
(define (translate-shape a-shape offset)
  (local ((define (apply-offset-circle c r co)
            (make-circle (make-posn (posn-x c) (+ offset (posn-y c)))
                         r
                         co))
          (define (apply-offset-rectangle nw w h co)
            (make-rectangle (make-posn (posn-x nw) (+ offset (posn-y nw)))
                         w
                         h
                         co))
          (define (apply-offset-line s e co)
            (make-line (make-posn (posn-x s) (+ offset (posn-y s)))
                       (make-posn (posn-x e) (+ offset (posn-y e)))
                       co)))
    (cond
      [(circle? a-shape) (process-shape apply-offset-circle a-shape)]
      [(rectangle? a-shape) (process-shape apply-offset-rectangle a-shape)]
      [(line? a-shape) (process-shape apply-offset-line a-shape)])))

;; tests
(start 300 300)
(draw-losh (lunar-lander -1 145 (lunar-lander 1 145 LUNAR)))