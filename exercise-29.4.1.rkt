;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise-29.4.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; neighbors : node graph -> (listof node)
;; to lookup the node in a graph
(define (neighbors node graph)
  (vector-ref graph node))


;; TESTS
(define Graph-as-vector
  (vector (list 1 4)
          (list 4 5)
          (list 3)
          empty
          (list 2 5)
          (list 3 6)
          empty))

(equal?
 (neighbors 2 Graph-as-vector)
 (list 3))
(equal?
 (neighbors 5 Graph-as-vector)
 (list 3 6))
(equal?
 (neighbors 3 Graph-as-vector)
 empty)
