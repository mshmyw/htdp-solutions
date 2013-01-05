;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-27.2.4) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; create-matrix : number (listof number) -> (listof (listof n))
;; given n and a list of length n^2, produces a list of n lists
;; of n numbers
(define (create-matrix n lon)
  (local ((define (head lon i)
            (cond
              ((or (empty? lon) (<= i 0)) empty)
              (else (cons (first lon)
                          (head (rest lon) (sub1 i))))))
          (define (tail lon i)
            (cond
              ((empty? lon) empty)
              ((> i 0) (tail (rest lon) (sub1 i)))
              (else lon))))
    (if (empty? lon)
        empty
        (cons (head lon n) (create-matrix n (tail lon n))))))
    
;; TEST
(equal? (create-matrix 3 (list 1 2 3 4 5 6 7 8 9)) 
        (list (list 1 2 3) 
              (list 4 5 6)
              (list 7 8 9)))