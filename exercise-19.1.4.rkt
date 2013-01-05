;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 19.1.4|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; above : lon number -> lon
(define (above alon t)
  (local ((define (>t? x) (> x t)))
    (filter1 >t? alon)))
  
;; below : lon number -> lon
(define (below alon t)
  (local ((define (<t? x) (< x t)))
    (filter1 <t? alon)))

(define (filter1 predicate alon)
  (cond
    [(empty? alon) empty]
    [else (cond
            [(predicate (first alon))
             (cons (first alon)
                   (filter predicate (rest alon)))]
            [else
             (filter predicate (rest alon))])]))

;; TESTS:
(equal? (above (list 1 2 3 4 5) 3) (list 4 5))
(equal? (below (list 1 2 3 4 5) 3) (list 1 2))