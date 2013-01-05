;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |exercise 25.2.3|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; quick-sort : (listof number) -> (listof number) 
;; to create a list of numbers with the same numbers as 
;; alon sorted in ascending order 
(define (quick-sort alon threshold) 
  (cond 
    [(empty? alon) empty] 
    [(empty? (rest alon)) alon]
    [(<= (length alon) threshold) (sort1 alon)]
    [else (append  
       (quick-sort (smaller-items alon (first alon)) threshold)  
       (list (first alon))  
       (quick-sort (larger-items alon (first alon)) threshold))])) 
 
;; larger-items : (listof number) number -> (listof number) 
;; to create a list with all those numbers on alon  
;; that are larger than threshold 
(define (larger-items alon threshold) 
  (cond 
    [(empty? alon) empty] 
    [else (if (> (first alon) threshold)  
         (cons (first alon) (larger-items (rest alon) threshold)) 
         (larger-items (rest alon) threshold))])) 
 
;; smaller-items : (listof number) number -> (listof number) 
;; to create a list with all those numbers on alon  
;; that are smaller than threshold 
(define (smaller-items alon threshold) 
  (cond 
    [(empty? alon) empty] 
    [else (if (< (first alon) threshold)  
         (cons (first alon) (smaller-items (rest alon) threshold)) 
         (smaller-items (rest alon) threshold))])) 

;; sort : list-of-numbers -> list-of-numbers 
(define (sort1 alon) 
  (local ((define (sort alon) 
       (cond 
         [(empty? alon) empty] 
         [(cons? alon) (insert (first alon) 
                                    (sort (rest alon)))])) 
     (define (insert an alon) 
       (cond 
         [(empty? alon) (list an)] 
         [else (cond 
                [(< an (first alon)) (cons an alon)] 
                [else (cons (first alon)  
                                  (insert an (rest alon)))])]))) 
    (sort alon))) 

;; TESTS
(equal? (quick-sort (list 6 4 9 3 11 64) 5) (list 3 4 6 9 11 64))