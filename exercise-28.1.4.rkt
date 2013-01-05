;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-28.1.4) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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

;; a route is a structure:
;; (make-route to from path)
;; where to and from are symbols and path is a list of nodes
(define-struct route (to from path))

;; test-on-all-nodes : graph -> (listof route)
;; calls find-route on all pairs in given graph
(define (test-on-all-nodes g)
  (local ((define (make-node-list g)
            (if (empty? g)
                empty
                (cons (first (first g))
                      (make-node-list (rest g)))))
          (define (test-node orig l)
            (if (empty? l)
                empty
                (cons (make-route orig
                                  (first l)
                                  (find-route orig (first l) g))
                      (test-node orig (rest l)))))
          (define (test-node-list orig-l)
            (if (empty? orig-l)
                empty
                (append (test-node (first orig-l) (make-node-list g))
                        (test-node-list (rest orig-l))))))
    (test-node-list (make-node-list g))))
    

    
                        
;; find-route : node node graph -> (listof node) or false
;; to create a path from origination to destination in G
;; if there is no path, the function produces false
(define (find-route origination destination G)
  (cond
    [(symbol=? origination destination) (list destination)]
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
(test-on-all-nodes Graph)