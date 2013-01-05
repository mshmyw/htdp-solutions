;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-28.1.2) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; a graph is list of
;; (list a b)
;; where is a node and b is a list of its neighbors (nodes)

(define Graph
  (list (list 'A (list 'B 'E))
        (list 'B (list 'E 'F))
        (list 'C (list 'D))
        (list 'D (list))
        (list 'E (list 'C 'F))
        (list 'F (list 'D 'G))
        (list 'G (list))))

;; neighbors: node graph -> (listof nodes)
;; produces a list of neighbors of the given node of the given graph
(define (neighbors n g)
  (local ((define (first-neighbors g)
            (second (first g)))
          (define (ismatch? l)
            (symbol=? (first l) n)))
    (cond
      [(empty? g) false]
      [(ismatch? (first g)) (first-neighbors g)]
      [else (neighbors n (rest g))])))


;; TESTS
(neighbors 'F Graph)
(neighbors 'D Graph)
(neighbors 'A Graph)
(neighbors 'mine-own Graph)