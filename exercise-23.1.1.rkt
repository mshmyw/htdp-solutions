;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.1.1|) (read-case-sensitive #t) (teachpacks ((lib "gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.ss" "teachpack" "htdp")))))
;; series-local : (N -> number) -> (number -> number)
(define (series-local a-term)
  (local ((define (series n)
            (cond
              [(= n 0) (a-term n)]
              [else (+ (a-term n)
                       (series (- n 1)))])))
    series))

;; make-even : N -> N[even] 
;; to compute the i-th even number
(define (make-even i)
  (* 2 i))
             
;; make-odd : N -> N[odd] 
;; to compute the i-th odd number
(define (make-odd i)
  (+ (* 2 i) 1))

(define series-even (series-local make-even))
(define series-odd (series-local make-odd))

;; TEST
(= (series-even 3) 12)
(= (series-odd 3) 16)