;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.4.2|) (read-case-sensitive #t) (teachpacks ((lib "gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.ss" "teachpack" "htdp")))))
(define R 10000)

;; integrate : (number -> number) number number -> number 
;; to compute the area under the graph of f between a and b 
(define (integrate f a b)
  (local ((define dx (/ (- b a) R))
          (define (fxdx_i n)
            (* (f (mp_i n)) dx))
          (define (mp_i n)
            (/ (+ (x_i n)
                  (x_i (- n 1)))
               2))
          (define (x_i n)
            (+ a (* n dx))))
    (exact->inexact (series R fxdx_i))))
          
(define (series n a-term)
  (cond
    [(= n 0) (a-term n)]
    [else (+ (a-term n)
        (series (- n 1) a-term))]))

(define (f x)
  (sqr x))

(integrate f 1 5)
(exact->inexact 124/3)

(integrate f 1 2)
(exact->inexact 7/3)

(integrate sin 0 pi)