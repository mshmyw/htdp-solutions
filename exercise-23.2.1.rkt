;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.2.1|) (read-case-sensitive #t) (teachpacks ((lib "gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.ss" "teachpack" "htdp")))))
;; a-fives : N -> number
;; determines value of nth term in above sequence (in the text)
(define (a-fives n)
  (cond
    [(= n 0) 8]
    [else (+ 5 (a-fives (- n 1)))]))

;; TEST
(= (a-fives 3) 23)
(= (a-fives 2) 18)