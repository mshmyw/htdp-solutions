;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.3.5|) (read-case-sensitive #t) (teachpacks ((lib "gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.ss" "teachpack" "htdp")))))
;; series : N (N -> number) -> number
;; to sum up the first n numbers in the sequence a-term,
(define (series n a-term)
  (cond
    [(= n 0) (a-term n)]
    [else (+ (a-term n)
        (series (- n 1) a-term))]))

;; geometric-series : N number -> (N -> number)
;; generates a function representing an geometric series
;; whose start-point is start and whose multiplier is m
(define (geometric-series start m)
  (local ((define (f n)
            (cond
              [(zero? n) start]
              [else (* m (f (- n 1)))])))
    f))

;; geometric-series-closed : N number -> (N -> number)
;; generates a function representing an geometric series
;; whose start-point is start and whose multiplier is m
(define (geometric-series-closed start m)
  (local ((define (f n)
            (* start (expt m n))))
    f))

;; g-fives : N -> number
;; determines value of nth term in above sequence (in the text)
(define g-fives (geometric-series 3 5))

;; g-fives-closed : N -> number
;; determines value of nth term in above sequence (in the text)
(define g-fives-closed (geometric-series-closed 3 5))

(series 3 (geometric-series 1 .1))
(series 7 (geometric-series 1 .1))
(series 88 (geometric-series 1 .1))