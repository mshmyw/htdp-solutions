;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 12.2.2|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A list-of-numbers is either
;; 1. empty or
;; 2. (cons n lon) where n is a number and lon is a list-of-numbers

;; search-sorted : list-of-numbers -> boolean
;; to search sorted list for a given number
(define (search-sorted n a-lon)
  (cond
    [ (empty? a-lon) empty]
    [ else (cond
             [ (= (first a-lon) n) true]
             [ (< (first a-lon) n) false]
             [ (> (first a-lon) n) (search-sorted n (rest a-lon))])]))
;; test:
(boolean=? (search-sorted 3 (cons 5 (cons 4 (cons 3 (cons 2 (cons 1 empty))))))
           true)
(boolean=? (search-sorted 8 (cons 5 (cons 4 (cons 3 (cons 2 (cons 1 empty))))))
           false)