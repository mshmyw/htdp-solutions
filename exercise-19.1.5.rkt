;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 19.1.5|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define (min1 alon)
  (extreme < alon))

(define (max1 alon)
  (extreme > alon))

(define (extreme rel-op alon)
  (cond
    [(empty? (rest alon)) (first alon)]
    [else (local ((define extreme-rest (extreme rel-op (rest alon)))
                  (define (pick x y) (cond
                                       [(rel-op x y) x]
                                       [else y])))
            (pick (first alon) extreme-rest))]))

(= (min1 (list 3 7 6 2 9 8)) 2)
(= (min1 (list 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1)) 1)
(= (min1 (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)) 1)

(= (max1 (list 3 7 6 2 9 8)) 9)
(= (max1 (list 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1)) 20)
(= (max1 (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)) 20)
