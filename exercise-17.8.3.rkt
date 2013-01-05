;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.8.3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; sym-list=? : list-of-symbols list-of-symbols -> boolean
;; to determine whether a-list and another-list
;; contain the same symbols in the same order
(define (sym-list=? a-list another-list)
  (cond
    [(empty? a-list) (empty? another-list)]
    [(cons? a-list)
     (and (cons? another-list)
          (and (symbol=? (first a-list) (first another-list))
               (sym-list=? (rest a-list) (rest another-list))))]))
;; TESTS:
(sym-list=? empty
            empty)
(not (sym-list=? empty
                 (cons 'a empty)))
(not (sym-list=? (cons 'a empty)
                 empty))
(sym-list=? (cons 'a (cons 'b (cons 'c empty)))
            (cons 'a (cons 'b (cons 'c empty))))
(not (sym-list=? (cons 'a (cons 'b (cons 'c empty)))
                 (cons 'a (cons 'c empty))))
