;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 18.2|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; max1 : non-empty-lon -> number
;; to determine the largest number on alon
(define (max1 alon)
  (cond
    [(empty? (rest alon)) (first alon)]
    [else (cond
            [(> (first alon) (max1 (rest alon))) (first alon)]
            [else (max1 (rest alon))])]))

;; max2 : non-empty-lon -> number
;; to determine the largest number on alon
(define (max2 alon)
  (cond
    [(empty? (rest alon)) (first alon)]
    [else (local ((define r (max2 (rest alon))))
            (cond
              [(> (first alon) r) (first alon)]
              [else r]))]))


;; TESTS
(max1 (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20))
(max2 (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20))

;; max1 is slower and consumes much more memory because it must unnecessarily step through a
;; long recursive sub process to test the first cond expression at each recursive iteration. max2
;; quickly defines r in terms of itself without needing to evaulate the second cond, THEN makes
;; a series non-recursive tests. Hopefuly, after SICP, my vocabulary with regard to recursion
;; will allow me to make a less half-assed explaination of that.