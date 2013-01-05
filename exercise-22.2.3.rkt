;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 22.2.3|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "arrow.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "arrow.ss" "teachpack" "htdp")))))
;; fold : X (X -> Y) -> ((listof X) -> Y)
(define (fold base f)
  (local ((define (combine alon)
            (cond
              [(empty? alon) base]
              [else (f (first alon)
                       (combine (rest alon)))])))
    combine))

;; sum : (listof number) -> number 
;; to compute the sum of alon 
(define sum (fold 0 +))

;; product : (listof number) -> number 
;; to compute the product of alon 
(define product (fold 1 *))

;; test
(= (sum (list 2 3 4)) 9)
(= (product (list 1 2 3)) 6)