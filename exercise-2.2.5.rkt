(define (f n)
    (+ (/ n 3) 2))
    
(f 2)
(f 5)
(f 9)

(define (g n)
    (+ (sqr n) 10))
    
(define (h n)
    (+ (* (/ 1 2) (sqr n)) 20))
    
(define (i n)
    (- 2 (/ 1 n)))
    
(g 2)
(g 9)
(h 2)
(h 9)
(i 2)
(i 9)
