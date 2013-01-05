;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise-29.4.5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; lr-vector-sum : (vectorof number) -> number
;; to sum up the numbers in v
(define (lr-vector-sum v)
  (local ((define length
            (vector-length v))
          (define (vector-sum-aux i)
            (cond
              [(= i length) 0]
              [else (+ (vector-ref v i) (vector-sum-aux (add1 i)))])))
    (vector-sum-aux 0)))

;; TESTS
(lr-vector-sum (vector -1 3/4 1/4))
