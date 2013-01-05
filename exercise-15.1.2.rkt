;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 15.1.2|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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


;; min-removed : a-loc -> number or false
;; consumes a list of children and produces the removedness value
;; of the member least removed from a blue eyed descendant
(define (min-removed a-loc)
  (cond
    [ (empty? a-loc) false]
    [ (false? (how-far-removed (first a-loc)))
      (min-removed (rest a-loc))]
    [ (false? (min-removed (rest a-loc)))
      (how-far-removed (first a-loc))]
    [ else (min (how-far-removed (first a-loc))
                (min-removed (rest a-loc)))]))

;; how-far-removed : parent -> number or false
;; determines, if one exists, how far removed a blue-eyed descendant is from
;; a given parent.
(define (how-far-removed a-parent)
  (cond
    [ (symbol=? (parent-eyes a-parent) 'blue) 0]
    [ (empty? (parent-children a-parent)) false]
    [ (false? (min-removed (parent-children a-parent))) false]
    [ else (+ 1 (min-removed (parent-children a-parent)))]))
;; tests
(how-far-removed Gustav)
(how-far-removed Bettina)
(how-far-removed Eva)
(how-far-removed Dave)