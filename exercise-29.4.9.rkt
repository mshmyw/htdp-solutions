;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise-29.4.9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; binary-contains? : (vectorof N) N -> N or false
;; consumes sorted vector and key, produces index of key or false
(define (binary-contains? v key)
  (local ((define (aux from to)
            (cond
              [(= from to) false]
              [(= (vector-ref v from) key) from]
              [else (local ((define mid 
                              (floor (/ (+ from to) 2))))
                      (if (< key (vector-ref v mid))
                          (aux from mid)
                          (aux mid to)))])))
    (aux 0 (vector-length v))))

;; TESTS
(define test-vec (vector 2 3 4 5))
(= (binary-contains? test-vec 3) 1)
(not (binary-contains? test-vec -3))