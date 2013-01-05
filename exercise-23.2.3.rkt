;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.2.3|) (read-case-sensitive #t) (teachpacks ((lib "gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.ss" "teachpack" "htdp")))))
;; a-fives-closed : N -> number
;; determines value of nth term in above sequence (in the text)
(define (a-fives-closed n)
  (+ (* 5 n) 8))
  
;; series : N (N -> number) -> number 
;; to sum up the first n numbers in the sequence a-term, 
(define (series n a-term)
  (cond
    [(= n 0) (a-term n)]
    [else (+ (a-term n)
        (series (- n 1) a-term))]))

;; TEST
(= (series 1 a-fives-closed) 21)

(series 2 a-fives-closed)
(series 87 a-fives-closed)