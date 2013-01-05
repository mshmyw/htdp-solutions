;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.3.7|) (read-case-sensitive #t) (teachpacks ((lib "gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.ss" "teachpack" "htdp")))))
(define (ln x)
  (local ((define (ith i)
            (* (/ 2 (make-odd i))
               (expt (/ (- x 1)
                        (+ x 1))
                     (make-odd i))))
          (define (make-odd n)
            (+ (* 2 n) 1)))
    (exact->inexact (series 25 ith))))

(define (series n a-term) 
  (cond 
    [(= n 0) (a-term n)] 
    [else (+ (a-term n) 
        (series (- n 1) a-term))])) 

(ln 3)
(log 3)