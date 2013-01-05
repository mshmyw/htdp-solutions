;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 14.4.2|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; An addition is a structure:
;; (make-add l r)
;; where l and r are numbers
(define-struct add (left right))

;; A multiplication is a structure:
;; (make-mul l r)
;; where l and r are numbers
(define-struct mul (left right))

;; A value (val) is either
;; 1. a number, or
;; 2. a symbol

;; A scheme expression (s-exp) is either
;; 1. a value;
;; 2. (make-add s-exp1 s-exp2)
;;    where s-exp1 and s-exp2 are scheme expressions; or
;; 3. (make-mul s-exp1 s-exp2)
;;    where s-exp1 and s-exp2 are scheme expressions

;; numeric? : s-exp -> boolean
;; determines if a representation of a scheme expression
;; is numeric
(define (numeric? a-sexp)
  (cond
    [ (number? a-sexp) true]
    [ (symbol? a-sexp) false]
    [ (add? a-sexp) (and (numeric? (add-left a-sexp))
                         (numeric? (add-right a-sexp)))]
    [ (mul? a-sexp) (and (numeric? (mul-left a-sexp))
                         (numeric? (mul-right a-sexp)))]))
;; tests:
(boolean=? (numeric? (make-add (make-mul 2 'x) 4)) false)
(boolean=? (numeric? (make-add (make-mul 2 3) 4)) true)