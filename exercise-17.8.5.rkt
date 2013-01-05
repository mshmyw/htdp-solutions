;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.8.5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; list=? : list-of-atoms list-of-atoms -> boolean
;; to determine whether a-list and another-list
;; contain the same atoms in the same order
(define (list=? a-list another-list)
  (cond
    [(empty? a-list) (empty? another-list)]
    [(cons? a-list)
     (and (cons? another-list)
          (and (or (and (number? (first a-list))
                        (= (first a-list) (first another-list)))
                   (and (boolean? (first a-list))
                        (boolean=? (first a-list) (first another-list)))
                   (and (symbol? (first a-list))
                        (symbol=? (first a-list) (first another-list))))
               (list=? (rest a-list) (rest another-list))))]))

;; TESTS         
(list=? (list 'a 1 true) (list 'a 1 true))
(not (list=? (list 'a 1 false) (list 'a 1 true)))
(not (list=? (list 'a 1 false) (list 'a 1 false 1)))