;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.8.7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; posn=? : posn posn -> boolean
;; determines whether two posn structures are equal
(define (posn=? posn1 posn2)
  (cond
    [(empty? posn1) (empty? posn2)]
    [else (and (= (posn-x posn1) (posn-x posn2))
               (= (posn-y posn1) (posn-y posn2)))]))
;; TESTS
(posn=? (make-posn 23 43) (make-posn 23 43))
(not (posn=? (make-posn 23 43) (make-posn 32 43)))