;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.2.5|) (read-case-sensitive #t) (teachpacks ((lib "gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.ss" "teachpack" "htdp")))))
;; arithmetic-series : N number -> (N -> number)
;; generates a function representing an arithmetic series
;; whose start-point is start and whose summand is s
(define (arithmetic-series start s)
  (local ((define (f n)
            (cond
              [(= n 0) (+ start s)]
              [else (+ s (f (- n 1)))])))
    f))

;; arithmetic-series-closed : N number -> (N -> number)
;; generates a function representing an arithmetic series
;; whose start-point is start and whose summand is s
(define (arithmetic-series-closed start s)
  (local ((define (f n)
            (+ (* s n) (+ start s))))
    f))

;; a-fives : N -> number
;; determines value of nth term in above sequence (in the text)
(define a-fives (arithmetic-series 3 5))

;; a-fives-closed : N -> number
;; determines value of nth term in above sequence (in the text)
(define a-fives-closed (arithmetic-series-closed 3 5))

;; TEST:
(= (a-fives 3) 23)
(= (a-fives-closed 3) 23)