;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 6.7.1|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp")))))
(start 200 200)

;; draw-next-part : symbol -> boolean
;; draws pieces of a hangman figure
(define (draw-next-part part)
  (cond
    [(symbol=? part 'right-leg)
     (draw-solid-line (make-posn 100 125)
                      (make-posn 140 190))]
    [(symbol=? part 'left-leg)
     (draw-solid-line (make-posn 100 125)
                      (make-posn 60 190))]
    [(symbol=? part 'left-arm)
     (draw-solid-line (make-posn 100 75)
                      (make-posn 60 125))]
    [(symbol=? part 'right-arm)
     (draw-solid-line (make-posn 100 75)
                      (make-posn 140 125))]
    [(symbol=? part 'body)
     (draw-solid-line (make-posn 100 65)
                      (make-posn 100 125))]
    [(symbol=? part 'head)
     (and (draw-solid-disk (make-posn 100 45)
                  20
                  'black)
          (draw-solid-disk (make-posn 100 56)
                  2
                  'white)
          (draw-solid-disk (make-posn 92 40)
                  5
                  'white)
          (draw-solid-disk (make-posn 108 40)
                  5
                  'white))]
    [(symbol=? part 'noose)
     (and (draw-circle (make-posn 100 67)
                  7
                  'black)
          (draw-solid-line (make-posn 100 0)
                           (make-posn 100 60)))]))
;; Tests:
(draw-next-part 'right-leg)
(draw-next-part 'left-leg)
(draw-next-part 'left-arm)
(draw-next-part 'right-arm)
(draw-next-part 'body)
(draw-next-part 'head)
(draw-next-part 'noose)