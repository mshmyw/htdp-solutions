;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 11.4.4|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A list-of-posns is either
;; 1. empty, or
;; 2. (cons p lop) where p is a posn and lop is a list-of-posns

;; f : number -> number
(define (f x)
  (+ (* 3 (* x x))
     (+ (* -6 x)
        -1)))

;; tabulate-f20 : N [> 20] -> list-of-posns
;; to tabulate values of f for N greater than 20
(define (tabulate-f20 n)
  (cond
    [ (= n 20) empty]
    [ else (cons (make-posn n (f n))
                 (tabulate-f20 (sub1 n)))]))
;; test:
(tabulate-f20 24)
;; should yield
(cons (make-posn 24 1583)
      (cons (make-posn 23 1448)
            (cons (make-posn 22 1319)
                  (cons (make-posn 21 1196) empty))))


