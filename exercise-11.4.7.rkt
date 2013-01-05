;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 11.4.7|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; is-not-divisible-by<=i : N[>= 1] N[i < m] : -> boolean
;; to determine whether m is not divisible by any number in (1, i]
(define (is-not-divisible-by<=i i m)
  (cond
    [ (= i 1) true]
    [ (= (remainder m i) 0) false]
    [ else (is-not-divisible-by<=i (sub1 i) m)]))
;; test:
(boolean=? (is-not-divisible-by<=i 3 9) false)
(boolean=? (is-not-divisible-by<=i 10 13) true)