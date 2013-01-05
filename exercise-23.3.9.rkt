;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.3.9|) (read-case-sensitive #t) (teachpacks ((lib "gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.ss" "teachpack" "htdp")))))
(define (greg n)
  (local ((define (taylor-greg-ith i)
            (* (* 4 (sign i))
               (/ 1 (make-odd i))))
          (define (sign i)
            (cond
              [(zero? (remainder i 2)) 1]
              [else (- 1)]))
          (define (make-odd i)
            (+ (* 2 i) 1)))
    (exact->inexact (series 10000 taylor-greg-ith))))

(define (series n a-term) 
  (cond 
    [(= n 0) (a-term n)] 
    [else (+ (a-term n) 
        (series (- n 1) a-term))])) 

(greg 4)
pi