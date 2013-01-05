;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.8.11|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; list-pick : list-of-symbols N[>= 1] -> symbol
;; to determine the nth symbol from alos, counting from 1;
;; signals an error if there is no nth item
(define (list-pick alos n)
  (cond
    [(empty? alos) (error 'list-pick "list too short")]
    [(= n 1) (first alos)]
    [(> n 1) (list-pick (rest alos) (sub1 n))]))

;; test-list-pick : list-of-symbols N[>=1] symbol -> test-result
(define (test-list-pick alos n expected-result)
  (cond
    [(equal? (list-pick alos n) expected-result) true]
    [else (list "bad test result:" alos n expected-result)]))


;; TEST:
(test-list-pick (cons 'a empty) 1 'a)
(test-list-pick empty 1 (error 'list-pick "list too short"))
(test-list-pick empty 3 (error 'list-pick "list too short"))
(test-list-pick (cons 'a empty) 3 (error 'list-pick "list too short"))
