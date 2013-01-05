;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.3.6|) (read-case-sensitive #t) (teachpacks ((lib "gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.ss" "teachpack" "htdp")))))
(define (e-power x)
  (local ((define (e-taylor i)
            (/ (expt x i) (! i)))
          (define (! n)
            (cond
              [(= n 0) 1]
              [else (* n (! (sub1 n)))])))
    (exact->inexact (series 16 e-taylor))))

(define (series n a-term) 
  (cond 
    [(= n 0) (a-term n)] 
    [else (+ (a-term n) 
        (series (- n 1) a-term))])) 


(e-power 1)
(exp 1)