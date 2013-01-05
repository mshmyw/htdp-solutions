;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 15.1.4|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct parent (children name date eyes))
;; A parent is a structure:
;; (make-parent loc n d e)
;; where loc is a list of children, n and e are symbols,
;; and d is a number

;; A list-of-children is a either
;; 1. empty or
;; 2. (cons p loc) where p is a parent and loc is a list
;;    of children

;; Youngest Generation:
(define Gustav (make-parent empty 'Gustav 1988 'blue))
(define Fred&Eva (list Gustav))
;; Middle Generation:
(define Adam (make-parent empty 'Adam 1950 'orange))
(define Dave (make-parent empty 'Dave 1955 'black))
(define Eva (make-parent Fred&Eva 'Eva 1965 'red))
(define Fred (make-parent Fred&Eva 'Fred 1966 'pink))
(define Carl&Bettina (list Eva Dave Adam))
;; Oldest Generation:
(define Carl (make-parent Carl&Bettina 'Carl 1926 'green))
(define Bettina (make-parent Carl&Bettina 'Bettina 1926 'green))

;; children-eyes : list-of-children -> list
;; produces all eye-colors of the members of the list as well as
;; the eye colors of their descendants
(define (children-eyes a-loc)
  (cond
    [ (empty? a-loc) empty]
    [ else (append (eye-colors (first a-loc))
                   (children-eyes (rest a-loc)))]))

;; eye-colors : parent -> list
;; consumes a parent and produces a list of all eye colors in the tree
(define (eye-colors a-parent)
  (cons (parent-eyes a-parent) (children-eyes (parent-children a-parent))))
;; test 1
(eye-colors Carl)
;; should yield
(list 'green 'red 'blue 'black 'orange)