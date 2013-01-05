;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.8.2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; list=? : list-of-numbers list-of-numbers -> boolean
;; to determine whether a-list and another-list
;; contain the same numbers in the same order
(define (list=? a-list another-list)
  (cond
    [(and (empty? a-list) (empty? another-list)) true]
    [(not (and (cons? a-list) (cons? another-list)))
     false]
    [else (and (= (first a-list) (first another-list))
               (list=? (rest a-list) (rest another-list)))]))

;; TESTS:
(list=? empty
        empty)
(not (list=? empty
             (cons 1 empty)))
(not (list=? (cons 1 empty)
             empty))
(list=? (cons 1 (cons 2 (cons 3 empty)))
        (cons 1 (cons 2 (cons 3 empty))))
(not (list=? (cons 1 (cons 2 (cons 3 empty)))
             (cons 1 (cons 3 empty))))
