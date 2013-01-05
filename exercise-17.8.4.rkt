;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.8.4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; contains-same-numbers? : list-of-numbers list-of-numbers -> boolean
;; determines whether two lists of numbers contain the same numbers
;; regardless of the ordering
(define (contains-same-numbers? alon1 alon2)
  (list=? (sortnum alon1) (sortnum alon2)))

;; list=? : list-of-numbers list-of-numbers -> boolean
;; to determine whether a-list and another-list
;; contain the same numbers in the same order
(define (list=? a-list another-list)
  (cond
    [(empty? a-list) (empty? another-list)]
    [(cons? a-list)
     (and (cons? another-list)
          (and (= (first a-list) (first another-list))
               (list=? (rest a-list) (rest another-list))))]))

;; sortnum : list-of-numbers -> list-of-numbers (sorted)
;; to create a list of numbers with the same numbers as
;; alon sorted in descending order
(define (sortnum alon)
  (cond
    [(empty? alon) empty]
    [(cons? alon) (insert (first alon) (sortnum (rest alon)))]))

;; insert : number list-of-numbers (sorted) -> list-of-numbers (sorted)
;; to create a list of numbers from n and the numbers on
;; alon that is sorted in descending order; alon is sorted
(define (insert n alon)
  (cond
    [(empty? alon) (cons n empty)]
    [else (cond
            [(>= n (first alon)) (cons n alon)]
            [(< n (first alon)) (cons (first alon) (insert n (rest
                                                              alon)))])]))
         
;; TESTS         
(contains-same-numbers? (list 1 2 3) (list 3 2 1))
(not (contains-same-numbers? (list 1 2 3) (list 3 2 5)))
(not (contains-same-numbers? (list 1 2 3) (list 3 2 5 7)))