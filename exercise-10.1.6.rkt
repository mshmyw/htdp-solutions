;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.1.6|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; a list-of-symbols is:
;; 1. the empty list, or
;; 2. (cons s los) where s is a number and los is a list of numbers

;; name-robot : list-of-symbols -> list-of-symbols
;; to replace all occurrences of 'robot with 'r2d2
(define (name-robot a-los)
  (cond
    [ (empty? a-los) empty]
    [ (symbol=? (first a-los) 'robot)
      (cons 'r2d2 (name-robot (rest a-los)))]
    [ else (cons (first a-los)
                 (name-robot (rest a-los)))])) 
;; test:
(name-robot (cons 'truck (cons 'game (cons 'robot empty))))
;; expected result:
(cons 'truck (cons 'game (cons 'r2d2 empty)))

;; substitute : symbol symbol list-of-symbols -> list-of-symbols
;; to replace all occurrences of old with new
(define (substitute old new a-los)
  (cond
    [ (empty? a-los) empty]
    [ (symbol=? (first a-los) old)
      (cons new (substitute old new (rest a-los)))]
    [ else (cons (first a-los)
                 (substitute old new (rest a-los)))])) 
;; test:
(substitute 'doll 'Barbie (cons 'robot (cons 'doll (cons 'dress empty))))
;; expected value:
(cons 'robot (cons 'Barbie (cons 'dress empty)))


