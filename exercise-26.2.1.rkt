;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-26.2.1) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define (generative-recursive-fun problem) 
  (cond 
    [(empty? problem) (determine-solution problem)] 
    [else 
     (combine-solutions 
      problem 
      (generative-recursive-fun (rest problem)))]))

(define (determine-solution problem) 0)

(define (combine-solutions solution1 solution2)
  (+ 1 solution2))

;; TEST:
(equal? (generative-recursive-fun '(1 a 3 4)) 4)
(equal? (generative-recursive-fun '()) 0)