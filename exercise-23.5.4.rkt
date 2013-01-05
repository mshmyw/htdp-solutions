;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.5.4|) (read-case-sensitive #t) (teachpacks ((lib "graphing.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "graphing.ss" "teachpack" "htdp")))))
;; d/dx : (num -> num) -> (num -> num) 
;; to compute the derivative function of f numerically 
(define (d/dx f) 
  (local ((define (fprime x) 
            (/ (- (f (+ x  epsilon)) (f (- x  epsilon))) 
               (* 2  epsilon))) 
          (define epsilon .1)) 
    fprime))

(define (y x)
  (+ (sqr x) (* -4 x) 7))

(define yprime
  (d/dx y))

(yprime 2)