;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 21.2.1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 1.
(local ((define (ident x) x))
  (build-list 4 ident))
(build-list 4 add1)

;; 2.
(local ((define (10^-x x) (/ 1 (x^y 10 (add1 x))))
        (define (x^y x y)
          (cond
            [(= y 0) 1]
            [else (* x (x^y x (sub1 y)))])))
  (build-list 4 10^-x))

;; 3.
;; evens : N -> (listof N)
;; consumes a natural number n and creates the list of the first n
;; even numbers
(define (evens n)
  (local ((define (times2 x) (* 2 x)))
    (build-list n times2)))
;; test:
(evens 4)

;; 4.
;; tabulate: (X -> Y) N -> (listof Y)
(define (tabulate f n)
  (build-list n f))
;; test:
(tabulate sqr 3)

;; 5
;; diagonal : N -> (listof (list of (0 or 1)))
;; consumes a natural number n and creates a list of lists of 0 and 1.
(define (diagonal n)
  (local ((define (build-a-row x)
            (build-row n (add1 x)))
          (define (build-row m x)
            (local ((define (zeroorone y)
                      (cond
                        [(= x (add1 y)) 1]
                        [else 0])))
              (build-list m zeroorone))))
    (build-list n build-a-row)))
;; test
(equal? (diagonal 3)
        (list
         (list 1 0 0)
         (list 0 1 0)
         (list 0 0 1)))
