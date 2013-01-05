;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.5.3|) (read-case-sensitive #t) (teachpacks ((lib "graphing.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "graphing.ss" "teachpack" "htdp")))))
;; line-from-point+slope : posn number -> (number -> number)
(define (line-from-point+slope point slope)
  (local ((define (y x)
            (+ (* slope
                  (- x (posn-x point)))
               (posn-y point))))
    y))

(define (y x)
  (+ (sqr x) (* -4 x) 7))

(graph-fun y 'blue)
(graph-line (line-from-point+slope (make-posn 1 (y 1)) 0) 'red)
(graph-line (line-from-point+slope (make-posn 1.5 (y 1.5)) 0) 'green)
(graph-line (line-from-point+slope (make-posn 1.75 (y 1.75)) 0) 'blue)