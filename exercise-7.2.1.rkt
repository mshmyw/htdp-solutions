;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 7.2.1|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define-struct spider (remaining-legs space))
(define-struct elephant (space))
(define-struct monkey (intelligence space))
;; A zoo-animal is either
;; 1. A structure: (make-spider l s)
;; where l and s are numbers;
;; 2. A structure: (make-elephant s)
;; where s is a number;
;; 3. A structure: (make-monkey i s)
;; where i and s are numbers.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Template:
;;
;; (define (f a-zoo-animal)
;;   (cond
;;     [(spider? a-zoo-animal)
;;      ... (spider-remaining-legs a-zoo-animal) ...
;;      ... (spider-space a-zoo-animal) ...]
;;     [(elephant? a-zoo-animal)
;;      ... (elephant-space a-zoo-animal) ...
;;     [(monkey? a-zoo-animal)
;;      ... (monkey-intelligence a-zoo-animal) ...
;;      ... (monkey-space a-zoo-animal) ...]

;; fits? : zoo-animal number -> boolean
;; consumes a zoo animal and volume of a cage and determines
;; whether the cage is large enough for the animal
(define (fits? a-zoo-animal vol)
  (cond
    [(spider? a-zoo-animal)
     (>= vol (spider-space a-zoo-animal))]
    [(elephant? a-zoo-animal)
     (>= vol (elephant-space a-zoo-animal))]
    [(monkey? a-zoo-animal)
     (>= vol (monkey-space a-zoo-animal))]))
;; Test 1
(fits? (make-spider 5 7) 5)
(fits? (make-spider 5 7) 8)
;; expected value:
false
true
;; Test 2
(fits? (make-elephant 7) 5)
(fits? (make-elephant 7) 8)
false
true
;; Test 3
(fits? (make-monkey 5 7) 5)
(fits? (make-monkey 5 7) 8)
false
true