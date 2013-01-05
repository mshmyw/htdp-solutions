;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.5.1|) (read-case-sensitive #t) (teachpacks ((lib "graphing.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "graphing.ss" "teachpack" "htdp")))))
(define (line a b)
  (local ((define (y x)
            (+ (* a x) b)))
    y))

(graph-line (line 1 4) 'red)
(graph-line (line -1 4) 'blue)
(graph-line (line 1 10) 'green)
(graph-line (line -1 10) 'orange)
(graph-line (line 0 12) 'purple)