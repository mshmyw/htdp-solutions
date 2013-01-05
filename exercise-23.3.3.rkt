;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.3.3|) (read-case-sensitive #t) (teachpacks ((lib "gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.ss" "teachpack" "htdp")))))
;; seq-g-fives : N -> (listof number)
;; produces first n terms of above sequence (in the text)
(define (seq-g-fives n)
  (build-list n g-fives-closed))

;; g-fives-closed : N -> number
;; determines value of nth term in above sequence (in the text)
(define (g-fives-closed n)
  (* 3 (expt 5 n)))

;; TEST
(equal? (seq-g-fives 3) (list 3 15 75))