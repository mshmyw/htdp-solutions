;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-26.1.2) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; merge-sort : (listof number) -> (listof number)
;; sorts a list of numbers in ascending order
(define (merge-sort l)
  (local ((define (merge-sort-singles l)
            (cond
              ((empty? l) l)
              ((empty? (rest l)) l)
              (else (merge-sort-singles (merge-all-neighbors l))))))
    (first (merge-sort-singles (make-singles l)))))
    
;; make-singles : (listof number) -> (listof (listof number))
;; constructs a list of one-item lists from given list of numbers
(define (make-singles l)
  (if (empty? (rest l))
      (cons l empty)
      (cons (cons (first l) empty)
            (make-singles (rest l)))))
  
;; merge-all-neighbors : (listof (listof number)) -> (listof (listof number)) 
;; merges neighboring lists with the lower value preceding the higher
(define (merge-all-neighbors l)
  (local ((define (merge-pair l1 l2)
            (cond
              ((empty? l1) l2)
              ((empty? l2) l1)
              ((<= (first l1) (first l2))
               (cons (first l1) (merge-pair (rest l1) l2)))
              (else (cons (first l2) (merge-pair l1 (rest l2)))))))
    (cond
      ((empty? l) l)
      ((empty? (rest l)) l)
      (else (cons (merge-pair (first l) (second l))
                  (merge-all-neighbors (rest (rest l))))))))

;; TESTS                     
(equal? (make-singles (list 2 5 9 3)) 
        (list (list 2) (list 5) (list 9) (list 3)))
(equal? (merge-all-neighbors (list (list 2) (list 5) (list 9) (list 3)))
        (list (list 2 5) (list 3 9)))
(equal? (merge-all-neighbors (list (list 2 5) (list 3 9))) 
        (list (list 2 3 5 9))) 
(equal? (merge-sort '(5 3 8 24))
        '(3 5 8 24))
