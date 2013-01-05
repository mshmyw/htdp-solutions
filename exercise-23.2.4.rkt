;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.2.4|) (read-case-sensitive #t) (teachpacks ((lib "gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.ss" "teachpack" "htdp")))))
;; seq-a-fives : N -> (listof number)
;; builds list up to nth term (inclusive) in above sequence (in the text)
(define (seq-a-fives n)
  (build-list (+ n 1) a-fives-closed))

;; a-fives-closed : N -> number
;; determines value of nth term in above sequence (in the text)
(define (a-fives-closed n)
  (+ (* 5 n) 8))
  
;; TEST
(equal? (seq-a-fives 3) (list 8 13 18 23))