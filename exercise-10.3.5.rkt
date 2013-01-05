;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.3.5|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
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

;; draw-losh : list-of-shapes -> boolean
;; to consume a list-of-shapes and draw them on the screen
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
    [ else (error 'draw-losh "Please enter a list of shapes")]))

;; clear-losh : list-of-shapes -> boolean
;; to consume a list-of-shapes and clear them from the screen
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

;; draw-and-clear-picture : picture -> boolean
;; to draw picture, sleep for a while, then clear the picture
(define (draw-and-clear-picture a-losh)
  (and (draw-losh a-losh)
       (sleep-for-a-while 1)
       (clear-losh a-losh)))
;; test:
(start 300 100)
(draw-and-clear-picture FACE)