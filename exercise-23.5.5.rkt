;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |exercise 23.5.5|) (read-case-sensitive #t) (teachpacks ((lib "graphing.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "graphing.ss" "teachpack" "htdp")))))
;; line-from-two-points : posn posn -> (number -> number)
(define (line-from-two-points p1 p2)
  (cond
    [(zero? (- (posn-x p1) (posn-x p2)))
     (error 'line-from-two-points "slope is undefined")]
    [else (local ((define slope (/ (- (posn-y p1) (posn-y p2))
                                   (- (posn-x p1) (posn-x p2))))
                  (define (f x)
                    (+ (* slope (- x (posn-x p1)))
                       (posn-y p1))))
            f)]))

;; TEST
(graph-line (line-from-two-points (make-posn 5 0)
                                  (make-posn 7 0))
            'green)
(graph-line (line-from-two-points (make-posn 0 5)
                                  (make-posn 0 7))
            'blue)
