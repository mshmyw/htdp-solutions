;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |exercise 25.2.5|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; quick-sort : (listof number) -> (listof number) 
;; to create a list of numbers with the same numbers as 
;; alon sorted in ascending order 
(define (quick-sort alon) 
  (cond 
    [(empty? alon) empty] 
    [(empty? (rest alon)) alon]
    [else (append  
           (quick-sort (smaller-items alon (first alon)))  
           (list (first alon))
           (quick-sort (larger-items (rest alon) (first alon))))])) 

;; larger-items : (listof number) number -> (listof number) 
;; to create a list with all those numbers on alon  
;; that are larger than threshold 
(define (larger-items alon threshold) 
  (filter (lambda (x) (>= x threshold)) alon))

;; smaller-items : (listof number) number -> (listof number) 
;; to create a list with all those numbers on alon  
;; that are smaller than threshold 
(define (smaller-items alon threshold) 
  (filter (lambda (x) (< x threshold)) alon))

;; TESTS
(equal? (quick-sort (list 6 4 9 9 9 3 11 64)) (list 3 4 6 9 9 9 11 64))