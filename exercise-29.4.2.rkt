;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise-29.4.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))

;; find-route : node node graph -> (listof node) or false
;; to create a path from origination to destination in G
;; if there is no path, the function produces false
(define (find-route origination destination G)
  (cond
    [(= origination destination) (list destination)]
    [else (local ((define possible-route
                    (find-route/list (neighbors origination G) destination
                                     G)))
            (cond
              [(boolean? possible-route) false]
              [else (cons origination possible-route)]))]))

;; find-route/list : (listof node) node graph -> (listof node) or false
;; to create a path from some node on lo-Os to D
;; if there is no path, the function produces false
(define (find-route/list lo-Os D G)
  (cond
    [(empty? lo-Os) false]
    [else (local ((define possible-route (find-route (first lo-Os) D G)))
            (cond
              [(boolean? possible-route) (find-route/list (rest lo-Os) D G)]
              [else possible-route]))]))

;; neighbors : node graph -> (listof node)
;; to lookup the node in a graph
(define (neighbors node graph)
  (vector-ref graph node))

;; test-on-all-nodes : graph -> (listof (listof (listof node)))
;; calls find-route on all pairs in given graph
(define (test-on-all-nodes g)
  (local ((define (find-routes-from node)
            (build-list (vector-length g) 
                        (lambda (to) (find-route node to g)))))
    (build-list (vector-length g) find-routes-from)))

(define (test-n-times n from to g)
  (if (= n 0)
      true
      (and (cons? (find-route from to g))
           (test-n-times (sub1 n) from to g))))

;TESTS:
(define Graph-as-vector
  (vector (list 1 4) ;; 0
          (list 4 5) ;; 1
          (list 3)   ;; 2
          empty      ;; 3
          (list 2 5) ;; 4
          (list 3 6) ;; 5
          empty))    ;; 6

(define Cyclic-graph-as-vector
  (vector (list 1 4)   ;; 0
          (list 4 5)   ;; 1
          (list 3)     ;; 2
          empty        ;; 3
          (list 2 5)   ;; 4
          (list 3 6 1) ;; 5
          empty))      ;; 6

(equal?
 (find-route 1 6 Graph-as-vector)
 (list 1 4 5 6))
(equal?
 (find-route 2 4 Graph-as-vector)
 false)
(test-on-all-nodes Graph-as-vector)
;; (find-route 1 0 Cyclic-graph-as-vector) should hang
(time (test-n-times 10000 0 4 Graph-as-vector))