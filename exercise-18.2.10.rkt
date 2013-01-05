;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 18.2.10|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct parent (children name date eyes))
;; A parent is a structure:
;; (make-parent loc n d e)
;; where loc is a list of children, n and e are symbols,
;; and d is a number

;; A list-of-children is a either
;; 1. empty or
;; 2. (cons p loc) where p is a parent and loc is a list
;;    of children

;; how-far-removed : parent -> number or false
;; determines, if one exists, how far removed a blue-eyed descendant is from
;; a given parent.
(define (how-far-removed a-parent)
  (local ((define (min-removed a-loc)
            (cond
              [ (empty? a-loc) false]
              [ (false? (how-far-removed (first a-loc)))
                (min-removed (rest a-loc))]
              [ (false? (min-removed (rest a-loc)))
                (how-far-removed (first a-loc))]
              [ else (min (how-far-removed (first a-loc))
                          (min-removed (rest a-loc)))])))
    (cond
      [ (symbol=? (parent-eyes a-parent) 'blue) 0]
      [ (empty? (parent-children a-parent)) false]
      [ (false? (min-removed (parent-children a-parent))) false]
      [ else (+ 1 (min-removed (parent-children a-parent)))])))


;; count-proper-descendants : parent -> number
;; produces number of descendants not including parent
(define (count-proper-descendants a-parent)
  (local ((define (count-descendants a-parent)
            (cond
              [ (empty? (parent-children a-parent)) 1]
              [ else (+ 1 (total-descendants (parent-children a-parent)))]))
          (define (total-descendants a-loc)
            (cond
              [ (empty? a-loc) 0]
              [ else (+ (count-descendants (first a-loc))
                        (total-descendants (rest a-loc)))])))
    (cond
      [ (empty? (parent-children a-parent)) 0]
      [ else (total-descendants (parent-children a-parent))])))

;; eye-colors : parent -> list
;; consumes a parent and produces a list of all eye colors in the tree
(define (eye-colors a-parent)
  (local ((define (children-eyes a-loc)
            (cond
              [ (empty? a-loc) empty]
              [ else (append (eye-colors (first a-loc))
                             (children-eyes (rest a-loc)))])))
    (cons (parent-eyes a-parent) (children-eyes (parent-children a-parent)))))