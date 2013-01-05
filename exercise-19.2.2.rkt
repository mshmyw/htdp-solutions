;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 19.2.2|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct ir (name price))

;; sort : (listof X) -> (listof X)
;; to construct a list with all items from alon in ascending (>) or
;; descending (<) order
(define (sort1 rel-op alon)
  (local ((define (sort alon)
            (cond
              [(empty? alon) empty]
              [else (insert (first alon) (sort (rest alon)))]))
          (define (insert an alon)
            (cond
              [(empty? alon) (list an)]
              [else (cond
                      [(rel-op an (first alon)) (cons an alon)]
                      [else (cons (first alon) (insert an (rest alon)))])])))
    (sort alon)))

;; ir< : IR number -> boolean
(define (ir< x y)
  (< (ir-price x) (ir-price y)))

;; ir> : IR number -> boolean
(define (ir> x y)
  (> (ir-price x) (ir-price y)))

;; TESTS:
(equal? (sort1 ir< (list (make-ir 'b 2)
                         (make-ir 'c 3)
                         (make-ir 'a 1)
                         (make-ir 'e 5)
                         (make-ir 'd 4)))
        (list (make-ir 'a 1)
              (make-ir 'b 2)
              (make-ir 'c 3)
              (make-ir 'd 4)
              (make-ir 'e 5)))

(equal? (sort1 ir> (list (make-ir 'b 2)
                         (make-ir 'c 3)
                         (make-ir 'a 1)
                         (make-ir 'e 5)
                         (make-ir 'd 4)))
               (list (make-ir 'e 5)
                     (make-ir 'd 4)
                     (make-ir 'c 3)
                     (make-ir 'b 2)
                     (make-ir 'a 1)))
