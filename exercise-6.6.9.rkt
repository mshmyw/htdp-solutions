;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 6.6.9|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp")))))
(define-struct rectangle (corner width height color))
;; rectangle is a structure: (make-rectangle (c, w, h, cl)) where c is a posn,
;; w and h are numbers, and cl is a symbol

;; in-rectangle? : rectangle posn -> symbol
(define (in-rectangle? rect pixel)
  (cond
    [(and (< (x-dist pixel
                     (rectangle-corner rect))
             (rectangle-width rect))
          (< (posn-x (rectangle-corner rect))
             (posn-x pixel))
          (< (y-dist pixel
                     (rectangle-corner rect))
             (rectangle-height rect))
          (< (posn-y (rectangle-corner rect))
             (posn-y pixel)))
     'PixelInsideRectangle]
    [else 'PixelNOTInsideRectangle]))

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