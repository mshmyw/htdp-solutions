;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 14.1.5|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct child (father mother name date eyes))
;; A child is a structure:
;; (make-child f m na da ec)
;; where f and m are child structures; na and ec are symbols; and da is a number.

;; A family-tree-node (short: ftn) is either
;; 1. empty; or
;; 2. (make-child f m na da ec)
;; where f and m are ftns, na
;; and ec are symbols, and da is a number.
;; Example:
(define Carl (make-child empty empty 'Carl 1926 'green))
(define Bettina (make-child empty empty 'Bettina 1926 'green))
;; Middle Generation:
(define Adam (make-child Carl Bettina 'Adam 1950 'yellow))
(define Dave (make-child Carl Bettina 'Dave 1955 'black))
(define Eva (make-child Carl Bettina 'Eva 1965 'blue))
(define Fred (make-child empty empty 'Fred 1966 'pink))
;; Youngest Generation:
(define Gustav (make-child Fred Eva 'Gustav 1988 'brown))

;; eye-colors : ftn -> list-of-symbols
;; to produce a list of all eye colors in a family tree
(define (eye-colors a-ftn)
  (cond
    [ (empty? a-ftn) empty]
    [ else (append (cons (child-eyes a-ftn)
                         (eye-colors (child-father a-ftn)))
                   (eye-colors (child-mother a-ftn)))]))
;; test:
(eye-colors Adam)
;; should-yield:
'(yellow green green)