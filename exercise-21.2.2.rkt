;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 21.2.2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 1.
;; convert-euro : (listof number) -> (listof number)
(define (convert-euro alon)
  (local ((define (dollar-euro d)
            (* d 1.22)))
    (map dollar-euro alon)))
;; test
(equal? (convert-euro (list 10.00 20.00)) (list 12.20 24.40))

;; 2.
;; convertFC : (listof number) -> (listof number)
(define (convertFC alon)
  (local ((define (F->C f)
            (* 5/9 (- f 32))))
    (map F->C alon)))
;; test
(equal? (convertFC (list 32 212)) (list 0 100))

;; 3.
;; move-all : (listof posn) -> (listof posn)
(define (move-all alop)
  (local ((define (move-posn aposn)
            (make-posn (+ 3 (posn-x aposn)) (posn-y aposn))))
    (map move-posn alop)))
;; test
(equal? (move-all (list (make-posn 29 43) (make-posn 53 34)))
        (list (make-posn 32 43) (make-posn 56 34)))

