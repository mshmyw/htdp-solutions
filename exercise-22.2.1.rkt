;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 22.2.1|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "arrow.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "arrow.ss" "teachpack" "htdp")))))
(define-struct IR (name number))

;; map1 : ((listof X) -> (listof Y)) -> ((listof X) -> (listof Y))
(define (map1 f)
  (local ((define (convert l)
            (cond
              [(empty? l) empty]
              [else (cons (f (first l)) (convert (rest l)))])))
    convert))

;; C->F : number -> number
(define (C->F c)
  (+ (* 9/5 c) 32))

;; convertCF : lon -> lon 
(define convertCF (map1 C->F))

;; names : loIR -> los 
(define names (map1 IR-name))

;; test
(equal? (convertCF (list 0 100)) (list 32 212))
(equal? (names (list (make-IR 'Geb 23) (make-IR 'Ed 53))) (list 'Geb 'Ed))