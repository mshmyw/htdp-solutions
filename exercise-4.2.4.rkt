(define (Fahrenheit->Celsius F)
    (* (/ 5 9) (- F 32)))
;; test expressions:
(= (Fahrenheit->Celsius 32) 0)
(= (Fahrenheit->Celsius 212) 100)

(define (dollar->euro d)
    (* d 0.7161))
;test expression:
(= (dollar->euro 1) 0.7161)

(define (triangle l h)
    (* (/ 1 2) l h))
;test expression:
(= (triangle 4 2) 4)

(define (convert3 a b c)
    (+ (* c 10 10) (* b 10) a))
;test expression:
(= (convert3 2 3 4) 432)