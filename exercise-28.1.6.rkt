;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-28.1.6) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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

;; find-route : node node graph -> (listof node) or false
;; to create a path from origination to destination in G
;; if there is no path, the function produces false
(define (find-route origination destination G)
  (cond
    [(symbol=? origination destination) (list destination)]
    [else (local ((define (neighbors n g)
                    (local ((define (first-neighbors g)
                              (second (first g)))
                            (define (ismatch? l)
                              (symbol=? (first l) n)))
                      (cond
                        [(empty? g) false]
                        [(ismatch? (first g)) (first-neighbors g)]
                        [else (neighbors n (rest g))])))
                  (define (find-route/list lo-Os)
                    (cond
                      [(empty? lo-Os) false]
                      [else (local ((define possible-route 
                                      (find-route (first lo-Os)
                                                  destination
                                                  G)))
                              (cond
                                [(boolean? possible-route)
                                 (find-route/list (rest lo-Os) destination G)]
                                [else possible-route]))]))
                  (define possible-route
                    (find-route/list (neighbors origination G))))
            (cond
              [(boolean? possible-route) false]
              [else (cons origination possible-route)]))]))


;; TESTS
(equal? (find-route 'B 'C Graph) (list 'B 'E 'C))