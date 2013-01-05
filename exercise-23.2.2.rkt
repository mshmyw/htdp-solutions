;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.2.2|) (read-case-sensitive #t) (teachpacks ((lib "gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.ss" "teachpack" "htdp")))))
;; a-fives-closed : N -> number
;; determines value of nth term in above sequence (in the text)
(define (a-fives-closed n)
  (+ (* 5 n) 8))
  
;; TEST
(= (a-fives-closed 3) 23)
(= (a-fives-closed 2) 18)