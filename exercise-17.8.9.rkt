;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.8.9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; A Slist is either
;; 1. empty
;; 2. (cons s sl) where s is a Sexpr and sl is a Slist.

;; A Sexpr is either
;; 1. a number
;; 2. a boolean
;; 3. a symbol
;; 4. a Slist

;; Slist=? : Slist Slist -> boolean
;; determines whether two Slists are equal
(define (Slist=? slist1 slist2)
  (cond
    [(empty? slist1) (empty? slist2)]
    [else (and (Sexpr=? (first slist1) (first slist2))
               (Slist=? (rest slist1) (rest slist2)))]))

;; Sexpr=? : Sexpr Sexpr -> boolean
;; determines whether two Sexprs are equal
(define (Sexpr=? sexpr1 sexpr2)
  (cond
    [(number? sexpr1)
     (and (number? sexpr2)
          (= sexpr1 sexpr2))]
    [(boolean? sexpr1)
     (and (boolean? sexpr2)
          (boolean=? sexpr1 sexpr2))]
    [(symbol? sexpr1)
     (and (symbol? sexpr2)
          (symbol=? sexpr1 sexpr2))]
    [else (Slist=? sexpr1 sexpr2)]))
          
;; TESTS:
(Slist=? (list 3 false 'b (list 5 true (list false) 'a) true)
         (list 3 false 'b (list 5 true (list false) 'a) true))
(not (Slist=? (list 3 false 'b (list 5 true 'a) true)
              (list 3 false 'b (list 4 true 'a) true)))