;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.1.8|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; quadratic-roots : number number number -> ?
;; to consume the coefficients a, b, and c and produce
;; the solution to the quadratic equation
(define (quadratic-root a b c)
  (cond
    [(= a 0) 'degenerate]
    [(< (sqr b) (* 4 a c)) 'none]
    [(= (sqr b) (* 4 a c)) (/ (- b) (* 2 a))]
    [else (cons (/ (+ (- b)
                      (sqrt(- (sqr b)
                              (* 4 a c))))
                   (* 2 a))
                (cons (/ (- (- b)
                            (sqrt(- (sqr b)
                                    (* 4 a c))))
                         (* 2 a))
                      empty))]))
;; tests:
(symbol=? (quadratic-root 0 3 4) 'degenerate)
(symbol=? (quadratic-root 2 2 3) 'none)
(= (quadratic-root 1 2 1) -1)
(quadratic-root 1 3 1) ;; expected result (approximate):
(cons -0.382 (cons -2.618 empty))