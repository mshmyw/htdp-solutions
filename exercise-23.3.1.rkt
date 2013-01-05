;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.3.1|) (read-case-sensitive #t) (teachpacks ((lib "gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.ss" "teachpack" "htdp")))))
;; g-fives : N -> number
;; determines value of nth term in above sequence (in the text)
(define (g-fives n)
  (cond
    [(zero? n) 3]
    [else (* 5 (g-fives (sub1 n)))]))

;; TEST
(= (g-fives 3) 375)