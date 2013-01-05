;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 9.1.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; add-up-3 : list-of-3-numbers -> number
;; to add up the three numbers in a-list-of-3-numbers
(define (add-up-3 a-list-of-3-numbers)
  (+ (first a-list-of-3-numbers)
     (first (rest a-list-of-3-numbers))
     (first (rest (rest a-list-of-3-numbers)))))
;; tests
(= (add-up-3 (cons 2 (cons 1 (cons 3 empty)))) 6)
(= (add-up-3 (cons 0 (cons 1 (cons 0 empty)))) 1)

;; distance-to-0-for-3 : list-of-3-numbers -> number
;; find the distance to 0 of a three dimensional point
(define (distance-to-0-for-3 a-list-of-3-numbers)
  (sqrt (+ (sqr (first a-list-of-3-numbers))
           (sqr (first (rest a-list-of-3-numbers)))
           (sqr (first (rest (rest a-list-of-3-numbers)))))))
;; tests
(= (distance-to-0-for-3 (cons 0 (cons 3 (cons 4 empty)))) 5)
(= (distance-to-0-for-3 (cons 3 (cons 4 (cons 6 empty)))) (sqrt 61))
  