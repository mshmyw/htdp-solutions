;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.6.3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct card (number hours))
;; a card is a structure:
;; (make-card n h)
;; where n and h are numbers

(define-struct employee (name number pay-rate))
;; an employee is a strucuture:
;; (make-employee n m r)
;; where n is a symbol, m, and r are numbers

(define-struct wage (name number pay))
;; a wage is a structure:
;; (make-wage n m p)
;; where n is a symbol, m and r are numbers

;; A list-of-cards is either
;; 1. empty or
;; 2. (cons c loc) where c is a card and loc is a list-of-cards

;; A list-of-employees is either
;; 1. and employee or
;; 2. (cons e loe) where e is an employee and loe is a list-of-employees

;; A list-of-wages is either
;; 1. a wage or
;; 2. (cons w low) where w is a wage and low is a list-of-wages

;; insert : employee or card loe or loc (sorted) -> loe or loc (sorted)
;; inserts given employee or card into sorted loe or loc
(define (insert eoc aloec)
  (cond
    [ (empty? aloec) (cons eoc empty)]
    [ (employee? eoc)
      (cond
        [ (<= (employee-number eoc) (employee-number (first aloec)))
          (cons eoc aloec)]
        [ else (insert eoc (rest aloec))])]
    [ (card? eoc)
      (cond
        [ (<= (card-number eoc) (card-number (first aloec)))
          (cons eoc aloec)]
        [ else (insert eoc (rest aloec))])]))

;; sortnum : loe or loc -> loe or loc
;; sorts a list of employees or cards by number
(define (sortnum aloec)
  (cond
    [ (empty? aloec) empty]
    [ else (insert (first aloec) (sortnum (rest aloec)))]))

;; hours->wages2 : list-of-employees list-of-cards -> list-of-wages
;; computes weekly wage for each employee
(define (hours->wages2 aloe aloc)
  (cond
    [ (and (empty? aloe) (empty? aloc))
      empty]
    [ (not (and (cons? aloe) (cons? aloc)))
      (error 'hours->wages2 "given lists are of unequal length")]
    [ else (cond
	    [ (= (employee-number (first (sortnum aloe)))
		 (card-number (first (sortnum aloc))))
	      (cons (make-wage (employee-name (first (sortnum aloe)))
			       (employee-number (first (sortnum aloe)))
			       (* (employee-pay-rate (first (sortnum aloe)))
				  (card-hours (first (sortnum aloc)))))
		    (hours->wages2 (rest aloe) (rest aloc)))]
	    [ else (error 'hours->wages2 "card mismatch")])]))
;; example 1:
(hours->wages2 (list (make-employee 'Ed 1234 12)
                     (make-employee 'Mo 4321 15)
                     (make-employee 'Ty 2351 30))
               (list (make-card 1234 40)
                     (make-card 4321 34)
                     (make-card 2351 50)))
;; should yield:
(list (make-wage 'Ed 1234 (* 12 40))
      (make-wage 'Mo 4321 (* 15 34))
      (make-wage 'Ty 2351 (* 30 40)))
;; example 2:
(hours->wages2 (list (make-employee 'Ed 234234231134 12)
                     (make-employee 'Mo 4321 15)
                     (make-employee 'Ty 2351 30))
               (list (make-card 1234 40)
                     (make-card 4321 34)
                     (make-card 2351 50)))
;; should throw error