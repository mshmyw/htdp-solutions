;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 5.1.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp")))))
;; check-guess3 : number number -> symbol
(define (check-guess3 c b a target)
  (cond 
    [(< (guess c b a) target) 'TooSmall]
    [(> (guess c b a) target) 'TooLarge]
    [(= (guess c b a) target) 'Perfect]))

;; guess : number number number -> number     
(define (guess c b a)
  (+ (* a 100) (* b 10) c))