;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.1.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; a list-of-numbers is:
;; 1. the empty list, or
;; 2. (cons n lon) where n is a number and lon is a list of numbers

;; Fahrenheit->Celsius : number -> number
;; to convert a measurement in Fahrenheit to Celsius
(define (Fahrenheit->Celsius F)
    (* (/ 5 9) (- F 32)))

;; convertFC : list-of-numbers -> list-of-numbers
;; to convert a list of Fahrenheit measurements to a list of
;; Celsius measurements
(define (convertFC a-lon)
  (cond
    [(empty? a-lon) empty]
    [else (cons (Fahrenheit->Celsius (first a-lon))
          (convertFC (rest a-lon)))]))
;; tests:
(convertFC (cons 32 (cons 212 empty)))
;; expected result:
(cons 0 (cons 100 empty))