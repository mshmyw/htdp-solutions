;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 7.2.2|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define-struct bus (driver seats))
(define-struct limo (driver length))
(define-struct car (driver horsepower))
(define-struct subway (driver seats))
;; A vehicle is either
;; 1. A structure: (make-bus d s)
;; where d is a symbol and s is a number;
;; 2. A structure: (make-limo d l)
;; where d is a symbol and l is a number;
;; 3. A structure: (make-car d h)
;; where d is a symbol and h is a number;
;; 4. A structure: (make-car d s)
;; where d is a symbol and s is a number;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Template:
;;
;; (define (f a-vehicle)
;;   (cond
;;     [(bus? a-vehicle)
;;      ... (bus-driver a-vehicle) ...
;;      ... (bus-seats a-vehicle) ...]
;;     [(limo? a-vehicle)
;;      ... (limo-driver a-vehicle) ...
;;      ... (limo-length a-vehicle) ...]
;;     [(car? a-vehicle)
;;      ... (car-driver a-vehicle) ...
;;      ... (car-horsepower a-vehicle) ...]
;;     [(subway? a-vehicle)
;;      ... (subway-driver a-vehicle) ...
;;      ... (subway-seats a-vehicle) ...]


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