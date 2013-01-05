;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 11.4.6|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A list-of-posns is either
;; 1. empty, or
;; 2. (cons p lop) where p is a posn and lop is a list-of-posns

;; f : number -> number
(define (f x)
  (+ (* 3 (* x x))
     (+ (* -6 x)
        -1)))

;; tabulate-f-up-to-20 : N [<= 20] -> N
(define (tabulate-f-up-to-20 n-below-20)
  (cond
    [ (> n-below-20 20) empty]
    [ else (cons (make-posn n-below-20 (f n-below-20))
                 (tabulate-f-up-to-20 (add1 n-below-20)))]))
;; test:
(tabulate-f-up-to-20 17)
;; should yield
(cons (make-posn 17 764)
      (cons (make-posn 18 863)
            (cons (make-posn 19 968)
                  (cons (make-posn 20 1079) empty))))


