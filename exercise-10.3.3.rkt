;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.3.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
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

;; translate-losh : list-of-shapes number -> list-of-shapes
;; to consume a list-of-shapes and translate them delta pixels
;; in the x direction
(define (translate-losh delta a-losh)
  (cond
    [ (empty? a-losh) empty]
    [ (circle? (first a-losh))
      (cons (make-circle (make-posn (+ delta
                                       (posn-x (circle-center (first a-losh))))
                                    (posn-y (circle-center (first a-losh))))
                         (circle-radius (first a-losh))
                         (circle-color (first a-losh)))
            (translate-losh delta (rest a-losh)))]
    [ (rectangle? (first a-losh))
      (cons (make-rectangle (make-posn (+ delta
                                          (posn-x (rectangle-nw (first a-losh))))
                                       (posn-y (rectangle-nw (first a-losh))))
                            (rectangle-width (first a-losh))
                            (rectangle-height (first a-losh))
                            (rectangle-color (first a-losh)))
           (translate-losh delta (rest a-losh)))]
    [ else (error 'translate-losh "Please enter a list shapes")]))
;; test:
(translate-losh 10 FACE)
;; should yield:
FACE