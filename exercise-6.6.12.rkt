;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 6.6.12|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp")))))
(define-struct rectangle (corner width height color))
;; rectangle is a structure: (make-rectangle (c, w, h, cl)) where c is a posn,
;; w and h are numbers, and cl is a symbol

; draw-a-rectangle: rectangle -> boolean
(define (draw-a-rectangle rect)
  (draw-solid-rect (rectangle-corner rect)
                   (rectangle-width rect)
                   (rectangle-height rect)
                   (rectangle-color rect)))

;; clear-a-rectangle: rectangle -> boolean
(define (clear-a-rectangle rect)
  (clear-solid-rect (rectangle-corner rect)
                    (rectangle-width rect)
                    (rectangle-height rect)
                    (rectangle-color rect)))

;; translate-rectangle : number rectangle -> rectangle
(define (translate-rectangle delta rect)
  (make-rectangle (make-posn (+ delta (posn-x (rectangle-corner rect)))
                             (posn-y (rectangle-corner rect)))
                  (rectangle-width rect)
                  (rectangle-height rect)
                  (rectangle-color rect)))

;; move-rectangle : number rectangle -> rectangle
;; to draw and clear a rectangle, translate it by delta pixels
(define (move-rectangle delta a-rectangle)
  (cond
    [(draw-and-clear-rectangle a-rectangle)
     (translate-rectangle delta a-rectangle)]
    [else a-rectangle]))

;; draw-and-clear-rectangle : rectangle -> boolean
(define (draw-and-clear-rectangle rect)
  (and (draw-a-rectangle rect)
       (sleep-for-a-while 5)
       (clear-a-rectangle rect)))

(define my-rectangle (make-rectangle (make-posn 0 10)
                                     20
                                     30
                                     'blue))

(start 300 300)

(draw-a-rectangle
 (move-rectangle 10
                 (move-rectangle 10
                                 (move-rectangle 10 my-rectangle))))