;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.5.6|) (read-case-sensitive #t) (teachpacks ((lib "graphing.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "graphing.ss" "teachpack" "htdp")))))
;; d/dx : (num -> num) -> (num -> num) 
;; to compute the derivative function of f numerically 
(define (d/dx f epsilon)
  (local ((define (fprime x)
            (/ (- (f (+ x  epsilon)) (f (- x  epsilon)))
               (* 2  epsilon))))
    fprime))

;; line-from-point+slope : posn number -> (number -> number)
(define (line-from-point+slope point slope)
  (local ((define (y x)
            (+ (* slope
                  (- x (posn-x point)))
               (posn-y point))))
    y))

(define (f x)
  (+ (* 1/60 (* x x x))
     (* -1/10 (* x x))
     5))

(define fprime_1 (d/dx f 2))
(define fprime_2 (d/dx f 1))
(define fprime_3 (d/dx f .5))

(fprime_1 4)
(fprime_2 4)
(fprime_3 4)
(fprime_1 7)
(fprime_2 7)
(fprime_3 7)

(graph-fun f 'black)
(graph-line (line-from-point+slope (make-posn 4 (f 4))
                                   (fprime_1 4))
            'red)
(graph-line (line-from-point+slope (make-posn 4 (f 4))
                                   (fprime_2 4))
            'blue)
(graph-line (line-from-point+slope (make-posn 4 (f 4))
                                   (fprime_3 4))
            'green)
(graph-line (line-from-point+slope (make-posn 7 (f 7))
                                   (fprime_1 7))
            'red)
(graph-line (line-from-point+slope (make-posn 7 (f 7))
                                   (fprime_2 7))
            'blue)
(graph-line (line-from-point+slope (make-posn 7 (f 7))
                                   (fprime_3 7))
            'green)