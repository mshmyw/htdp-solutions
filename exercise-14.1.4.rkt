;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 14.1.4|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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

;; count-persons : ftn -> number
;; to produce the number of people in a given family tree
(define (count-persons a-ftree)
  (cond
    [ (empty? a-ftree) 0]
    [ else (+ 1
              (count-persons (child-father a-ftree))
              (count-persons (child-mother a-ftree)))]))

;; sum-ages : ftn -> number
;; to produce the sum of the ages of teh people in a given
;; family tree
(define (sum-ages year a-ftn)
  (cond
    [ (empty? a-ftn) 0]
    [ else (+ (- year (child-date a-ftn))
              (sum-ages 2010 (child-father a-ftn))
              (sum-ages 2010 (child-mother a-ftn)))]))
;; test:
(= (sum-ages 2010 Adam) 228)
   
;; average-age : ftn number -> number
;; to produce the average age of all people in the family tree
(define (average-age year a-ftn)
  (/ (sum-ages year a-ftn) (count-persons a-ftn)))
(= (average-age 2010 Adam) 76)