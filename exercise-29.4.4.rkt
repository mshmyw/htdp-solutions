;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise-29.4.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; vector-sum : (vectorof number) -> number
;; to compute the sum of the numbers in v
(define (vector-sum v)
  (local ((define (vector-sum-aux i)
            (cond
              [(zero? i) 0]
              [else (+ (vector-ref v (sub1 i))
                       (vector-sum-aux (sub1 i)))])))
    (vector-sum-aux (vector-length v))))

;; TESTS
(vector-sum (vector -1 3/4 1/4))
