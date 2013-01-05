;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 18.2.13|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct child (father mother name date eyes))
;; A child is a structure:
;; (make-child f m na da ec)
;; where f and m are child structures; na and ec are symbols; and da is a number.

;; A family-tree-node (short: ftn) is either
;; 1. empty; or
;; 2. (make-child f m na da ec)
;; where f and m are ftns, na
;; and ec are symbols, and da is a number.

;; A direction is either
;; 1. the symbol 'father or
;; 2. the symbol 'mother.

;; A path is either
;; 1. empty or
;; 2. (cons s los) where s is a direction and los is a path.

;; Oldest Generation:
(define Carl (make-child empty empty 'Carl 1926 'green))
(define Bettina (make-child empty empty 'Bettina 1926 'green))
;; Middle Generation:
(define Adam (make-child Carl Bettina 'Adam 1950 'yellow))
(define Dave (make-child Carl Bettina 'Dave 1955 'black))
(define Eva (make-child Carl Bettina 'Eva 1965 'blue))
(define Fred (make-child empty empty 'Fred 1966 'pink))
;; Youngest Generation:
(define Gustav (make-child Fred Eva 'Gustav 1988 'brown))
;; Hypothetical:
(define Hal (make-child Gustav Eva 'Gustav 1988 'hazel))

;; to-blue-eyed-ancestor : ftn -> path or false
;; to compute the path from a-ftn tree to a blue-eyed ancestor
(define (to-blue-eyed-ancestor a-ftn)
  (cond
    [(empty? a-ftn) false]
    [(symbol=? (child-eyes a-ftn) 'blue) empty]
    [else (local ((define pf (to-blue-eyed-ancestor (child-father a-ftn)))
                  (define pm (to-blue-eyed-ancestor (child-mother a-ftn))))
            (cond
              [(list? pf) (cons 'father pf)]
              [(list? pm) (cons 'mother pm)]
              [else false]))]))
                  
;; TESTS
(equal? (to-blue-eyed-ancestor Gustav) (list 'mother))
(false? (to-blue-eyed-ancestor Adam))
(equal? (to-blue-eyed-ancestor Hal) (list 'father 'mother))
