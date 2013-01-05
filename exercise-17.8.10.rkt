;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.8.10|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; replace-eol-with : list-of-numbers list-of-numbers -> list-of-numbers
;; to construct a new list by replacing empty in alon1 with alon2
(define (replace-eol-with alon1 alon2)
  (cond
    ((empty? alon1) alon2)
    (else (cons (first alon1) (replace-eol-with (rest alon1) alon2)))))

;; test-replace-eol-with : list-of-numbers
;;                         list-of-numbers
;;                         list-of-numbers -> test-result
(define (test-replace-eol-with list1 list2 expected-result)
  (cond
    [(equal? (replace-eol-with list1 list2) expected-result) true]
    [else (list "bad test result:" list1 list2 expected-result)]))

(test-replace-eol-with (list 1 2 3 4 5)
                       (list 6 7 8 9 10)
                       (list 1 2 3 4 5 6 7 8 9 10))

(test-replace-eol-with (list 1 2 3 4 5)
                       (list 6 7 8 9 11)
                       (list 1 2 3 4 5 6 7 8 9 10))