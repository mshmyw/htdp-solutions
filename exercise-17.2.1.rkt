;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.2.1|) (read-case-sensitive #t) (teachpacks ((lib "dir.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "dir.ss" "teachpack" "htdp")))))
(define-struct employee (name ssn pay-rate))
;; an employee is a structure:
;; (make-employee n s p)
;; where n is a symbol, s and p are numbers

(define-struct work (name hours))
;; a work is a structure:
;; (make-work n h)
;; where n is a symbol and h is a number

(define-struct wage (name pay))
;; a wage is a structure:
;; (make-wage n p)
;; where n is a symbol and p is a number

(define peeps (list (make-employee 'Ed 12341 12)
                    (make-employee 'Mo 23141 13)
                    (make-employee 'Ty 52341 15)))

(define grind (list (make-work 'Ed 13)
                    (make-work 'Mo 24)
                    (make-work 'Ty 40)))

;; weekly-wage : number number -> number
;; to compute the weekly wage from pay-rate and hours-worked
(define (weekly-wage pay-rate hours-worked)
  (* pay-rate hours-worked))

;; hours->wages : list-of-employees list-of-works -> list-of-structures
;; to construct a new list by multiplying the corresponding items on
;; alon1 and alon2
;; ASSUMPTION: the two lists are of equal length
(define (hours->wages alon1 alon2)
  (cond
    ((empty? alon1) empty)
    (else (cons (make-wage (employee-name (first alon1))
                           (weekly-wage (employee-pay-rate (first alon1))
                                        (work-hours (first alon2))))
                (hours->wages (rest alon1) (rest alon2))))))
;; test:
(hours->wages peeps grind) ;; should yield
(list (make-wage 'Ed (* 12 13))
      (make-wage 'Mo (* 13 24))
      (make-wage 'Ty (* 15 40)))