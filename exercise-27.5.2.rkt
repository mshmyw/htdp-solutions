;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-27.5.2) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; subtract: (listof num) (listof num) -> (listof num)
;; subtracts first list from second until 0 is in first position
(define (subtract l1 l2)
  (if (= (first l2) 0)
      (rest l2)
      (local ((define (scale-list list scalar)
                (if (empty? list)
                    empty
                    (cons (* scalar (first list))
                          (scale-list (rest list) scalar))))
              (define (subtract-lists l1 l2)
                (if (empty? l1)
                    empty
                    (cons (- (first l1) (first l2))
                          (subtract-lists (rest l1) (rest l2))))))
        
        (rest (subtract-lists l2
                        (scale-list l1 (/ (first l2) (first l1))))))))
        
;; TEST
(equal? 
 (subtract (list 4 2 3 5)
           (list 0 4 6 0))
 (list 4 6 0))
(equal? 
 (subtract (list 4 2 3 5)
           (list 4 4 6 0))
 (list 2 3 -5))
(equal? 
 (subtract (list 2 3 5 6)
           (list 4 10 3 5))
 (list 4 -7 -7))
(equal?
 (subtract (list 3 2 3 5)
           (list 2 3 5 2))
 (list 5/3 3 -4/3))
           
           
        