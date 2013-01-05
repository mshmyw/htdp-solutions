;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 11.2.2|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A list-of-posns is either
;; 1. empty, or
;; 2. (cons p lop) where p is a posn and lop is a list-of-posns

;; f : number -> number
(define (f x)
  (+ (* 3 (* x x))
     (+ (* -6 x)
        -1)))

;; tabulate-f : N -> list-of-posns
;; to consume a natural number n and produce a list of n posns
(define (tabulate-f n)
  (cond
    [ (< n 0) empty]
    [ else (cons (make-posn n (f n))
                 (tabulate-f (sub1 n)))]))
;; test:
(tabulate-f 4)
;; should yield
(cons (make-posn 4 23)
      (cons (make-posn 3 8)
            (cons (make-posn 2 -1)
                  (cons (make-posn 1 -4)
                        (cons (make-posn 0 -1) empty)))))