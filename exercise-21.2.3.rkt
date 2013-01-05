;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 21.2.3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 1.
(define-struct toy (name price))
;; eliminate-exp : number (listof toy) -> (listof toy)
;; produces a list of all toys cheaper than ua
(define (eliminate-exp ua alot)
  (local ((define (below-ua? atoy)
            (< (toy-price atoy) ua)))
    (filter below-ua? alot)))
;; test:
(equal? (eliminate-exp 40 (list (make-toy 'foo 32)
                                (make-toy 'bar 52)
                                (make-toy 'baz 49)))
        (list (make-toy 'foo 32)))

;; 2.
;; recall : symbol (listof symbol) -> (listof symbol)
;; produces a list with the given symbol omitted
(define (recall ty lon)
  (local ((define (not-ty? s)
            (not (symbol=? s ty))))
    (filter not-ty? lon)))
;; test
(equal? (recall 'bar (list 'foo 'bar 'baz))
        (list 'foo 'baz))

;; 3.
;; selection : (listof symbol) (listof symbol) -> (listof symbol)
;; produces alos1 ∩ alos2
(define (selection alos1 alos2)
  (local ((define (in-alos2? x)
            (in-list? x alos2))
          (define (in-list? x alos)
            (cond
              [(empty? alos) false]
              [(symbol=? x (first alos)) true]
              [else (in-list? x (rest alos))])))
    (filter in-alos2? alos1)))
;; test
(equal? (selection (list 'foo 'bar 'baz)
                   (list 'bar 'baz 'qux))
        (list 'bar 'baz))