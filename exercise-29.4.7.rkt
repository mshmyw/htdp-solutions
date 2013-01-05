;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise-29.4.7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; norm : (vectorof number) -> number
;; produces the sqrt of the sum of the squares of its numbers
(define (norm v)
  (local ((define length
            (vector-length v))
          (define (vector-sum-aux i)
            (cond
              [(= i length) 0]
              [else (+ (sqr (vector-ref v i)) (vector-sum-aux (add1 i)))])))
    (sqrt (vector-sum-aux 0))))

;; TESTS
(= (norm (vector 3 4)) 5)
