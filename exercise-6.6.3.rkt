;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 6.6.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp")))))
(define-struct circle (center radius color))
;; circle is a structure: (make-circle (c, r, pc)) where c is a posn,
;; r is a number, and pc is a symbol

;; in-circle? : circle posn -> symbol
(define (in-circle? circ pixel)
  (cond
    [(< (distance (circle-center circ) pixel)
        (circle-radius circ))
     'PixelInsideCircle]
    [else 'PixelNOTInsideCircle]))

;; x-dist : posn posn -> number
;; finds magnitude of distance between the x-coordinates of two posns
(define (x-dist posn1 posn2)
  (abs (- (posn-x posn1)
          (posn-x posn2))))

;; y-dist : posn posn -> number
;; finds magnitude of distance between the y-coordinates of two posns
(define (y-dist posn1 posn2)
  (abs (- (posn-y posn1)
          (posn-y posn2))))

;; distance : posn posn -> number
;; finds the distance between two posns
(define (distance posn1 posn2)
  (sqrt (+ (sqr (x-dist posn1 posn2)) 
           (sqr (y-dist posn1 posn2)))))