;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 19.1.6|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; sort : list-of-numbers -> list-of-numbers
;; to construct a list with all items from alon in ascending (>) or
;; descending (<) order
(define (sort1 rel-op alon)
  (local ((define (sort alon)
            (cond
              [(empty? alon) empty]
              [else (insert (first alon) (sort (rest alon)))]))
          (define (insert an alon)
            (cond
              [(empty? alon) (list an)]
              [else (cond
                      [(rel-op an (first alon)) (cons an alon)]
                      [else (cons (first alon) (insert an (rest alon)))])])))
    (sort alon)))

;; TESTS:
(equal? (sort1 < (list 2 3 1 5 4)) (list 1 2 3 4 5))
(equal? (sort1 > (list 2 3 1 5 4)) (list 5 4 3 2 1))