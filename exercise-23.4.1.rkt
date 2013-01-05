;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.4.1|) (read-case-sensitive #t) (teachpacks ((lib "gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.ss" "teachpack" "htdp")))))
;; integrate : (number -> number) number number -> number 
;; to compute the area under the graph of f between a and b 
(define (integrate f a b)
  (local ((define midpoint (/ (+ a b) 2))
          (define area-trap-1 (* (/ (- b a) 2)
                                 (/ (+ (f a)
                                       (f midpoint))
                                    2)))
          (define area-trap-2 (* (/ (- b a) 2)
                                 (/ (+ (f midpoint)
                                       (f b))
                                    2))))
    (exact->inexact (+ area-trap-1 area-trap-2))))

(define (f x)
  (sqr x))

(integrate f 1 5)
(exact->inexact 124/3)

(integrate f 1 2)
(exact->inexact 7/3)
