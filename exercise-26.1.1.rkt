;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-26.1.1) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; tabulate-div : N -> (listof N)
;; tabulates list of divisors for given number
(define (tabulate-div n)
  (local ((define (tabulate x)
            (if (= x 1)
                (list n)
                (if ( = (remainder n x) 0)
                    (cons (/ n x) (tabulate (sub1 x)))
                    (tabulate (sub1 x))))))
    (tabulate n)))

;; test:
(equal? (tabulate-div 8) '(1 2 4 8))
(equal? (tabulate-div 11) '(1 11))