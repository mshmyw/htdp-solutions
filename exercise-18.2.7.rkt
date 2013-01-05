;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 18.2.7|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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

;; A list-of-shapes is either
;; 1. empty, or
;; 2. (cons s los) where s is a shape and los is a list-of-shapes

;; A picture is a list-of-shapes

(define FACE (cons (make-circle (make-posn 50 50)
                                40
                                'red)
                   (cons (make-rectangle (make-posn 30 20)
                                         5
                                         5
                                         'blue)
                         (cons (make-rectangle (make-posn 65 20)
                                               5
                                               5
                                               'blue)
                               (cons (make-rectangle (make-posn 40 75)
                                                     20
                                                     10
                                                     'red)
                                     (cons (make-rectangle (make-posn 45 35)
                                                           10
                                                           30
                                                           'blue)
                                           empty))))))

;; move-picture : delta a-picture -> a-picture
;; to draw picture, sleep, clear, then produce translated picture
(define (move-picture delta a-picture)
  (local ((define (translate-losh delta a-losh)
            (cond
              [ (empty? a-losh) empty]
              [ (circle? (first a-losh))
                (cons (make-circle
                       (make-posn (+ delta
                                     (posn-x (circle-center (first a-losh))))
                                  (posn-y (circle-center (first a-losh))))
                       (circle-radius (first a-losh))
                       (circle-color (first a-losh)))
                      (translate-losh delta (rest a-losh)))]
              [ (rectangle? (first a-losh))
                (cons (make-rectangle
                       (make-posn (+ delta
                                     (posn-x (rectangle-nw (first a-losh))))
                                  (posn-y (rectangle-nw (first a-losh))))
                       (rectangle-width (first a-losh))
                       (rectangle-height (first a-losh))
                       (rectangle-color (first a-losh)))
                      (translate-losh delta (rest a-losh)))]
              [ else (error 'translate-losh "Please enter a list shapes")]))
          (define (draw-and-clear-picture a-picture)
            (and (draw-losh a-picture)
                 (sleep-for-a-while 0.1)
                 (clear-losh a-picture)))
          (define (clear-losh a-losh)
            (cond
              [ (empty? a-losh) true]
              [ (circle? (first a-losh))
                (and (clear-circle (circle-center (first a-losh))
                                   (circle-radius (first a-losh))
                                   (circle-color (first a-losh)))
                     (clear-losh (rest a-losh)))]
              [ (rectangle? (first a-losh))
                (and (clear-solid-rect (rectangle-nw (first a-losh))
                                       (rectangle-width (first a-losh))
                                       (rectangle-height (first a-losh))
                                       (rectangle-color (first a-losh)))
                     (clear-losh (rest a-losh)))]
              [ else (error 'clear-losh "Please enter a list of shapes")]))
          (define (draw-losh a-losh)
            (cond
              [ (empty? a-losh) true]
              [ (circle? (first a-losh))
                (and (draw-circle (circle-center (first a-losh))
                                  (circle-radius (first a-losh))
                                  (circle-color (first a-losh)))
                     (draw-losh (rest a-losh)))]
              [ (rectangle? (first a-losh))
                (and (draw-solid-rect (rectangle-nw (first a-losh))
                                      (rectangle-width (first a-losh))
                                      (rectangle-height (first a-losh))
                                      (rectangle-color (first a-losh)))
                     (draw-losh (rest a-losh)))]
              [ else (error 'draw-losh "Please enter a list of shapes")])))
    (cond
      [ (draw-and-clear-picture a-picture)
        (translate-losh delta a-picture)])))
;; test:
(start 500 100)
(move-picture 170
  (move-picture 128
    (move-picture 64
      (move-picture 32
        (move-picture 16
          (move-picture 8
            (move-picture 4
              (move-picture 2 FACE))))))))
(sleep-for-a-while 5)               
(stop)
