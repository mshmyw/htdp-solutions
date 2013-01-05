;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.5.2|) (read-case-sensitive #t) (teachpacks ((lib "graphing.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "graphing.ss" "teachpack" "htdp")))))
;; line-from-point+slope : posn number -> (number -> number)
(define (line-from-point+slope point slope)
  (local ((define (y x)
            (+ (* slope
                  (- x (posn-x point)))
               (posn-y point))))
    y))

(define (line a b)
  (local ((define (y x)
            (+ (* a x) b)))
    y))

;; TEST
(graph-line (line-from-point+slope (make-posn 0 4) 1) 'blue)
(sleep-for-a-while 1)
(graph-line (line 1 4) 'red)