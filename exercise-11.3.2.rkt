;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 11.3.2|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A list of numbers is:
;; 1. empty, or
;; 2. (cons n lon) where n is a number and lon is a list-of-numbers

;; random-n-m : integer integer -> integer
;; to generate a random number between n and m-1
;; Assume: n < m
(define (random-n-m n m)
  (+ (random (- m n)) n))

;; draw-grid : number number -> boolean
;; draws n lines of length l in dividing the x-axis and n lines of width w
;; dividing the y-axis
(define (draw-grid l w n delta)
  (cond
    [ (zero? n) true]
    [ else (and (draw-solid-line (make-posn (* n delta) 0)
                                 (make-posn (* n delta) l))
                (draw-solid-line (make-posn 0 (* n delta))
                                 (make-posn w (* n delta)))
                (draw-grid l w (sub1 n) delta))]))


;; balloon-riot : N -> boolean
;; to visualize a student riot involving n balloons of size s
(define (balloon-riot n s)
  (cond
    [ (zero? n) true]
    [ else (and (draw-solid-disk (make-posn (random-n-m 0 301)
                                       (random-n-m 0 301))
                            s
                            'red)
                (balloon-riot (sub1 n) s))]))
;; test:
(start 300 300)
(draw-grid 300 300 6 50)
(balloon-riot 20 10)
(sleep-for-a-while 5)
(stop)