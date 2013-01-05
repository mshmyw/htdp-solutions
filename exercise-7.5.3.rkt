;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 7.5.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define-struct vec (x y))
;; A speed-vecter (vec) is a structure:
;; (make-vec x y)
;; where both x and y are positive numbers

;; checked-make-vec : number number -> vector
;; ensures that arguments given to vector are positive numbers
(define (checked-make-vec x y)
  (cond
    [(and (number? x)
          (number? y)
          (>= x 0)
          (>= y 0))
     (make-vec x y)]
    [else (error 'checked-make-vec 
                 "expected a positive number for both inputs")]))
;; TESTS
; (checked-make-vec 20 30)
; (checked-make-vec 20 -30)
; (checked-make-vec 20 'a-symbol)
;; EXPECTED RESULTS:
; (checked-make-vec 20 30)
; "expected a positive number for both inputs"
; "expected a positive number for both inputs"