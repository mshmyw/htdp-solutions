;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 20.2.3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; notcar : (listof symbol) -> (listof symbol)
;; extracts all symbols not equal to 'car
(define (notcar alos)
    (local ((define (symbol=/=? a b) (not (symbol=? a b))))
      (cond
        [(empty? alos) empty]
        [else (filter1 symbol=/=? alos 'car)])))

;; filter1 : (symbol symbol -> boolean) (listof symbol) symbol -> (listof symbol)
(define (filter1 rel-op alon t)
  (cond
    [(empty? alon) empty]
    [(rel-op (first alon) t)
     (cons (first alon)
           (filter1 rel-op (rest alon) t))]
    [else (filter1 rel-op (rest
                      alon) t)]))

;; TEST
(equal? 
 (notcar (list 'bum 'car 'edwardo 'car 'boob 'car))
 (list 'bum 'edwardo 'boob))