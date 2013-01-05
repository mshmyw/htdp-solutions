;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 14.4.3|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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

;; evaluate-expression : s-exp -> number
;; computes value of a scheme expression
(define (evaluate-expression a-sexp)
  (cond
    [ (number? a-sexp) a-sexp]
    [ (symbol? a-sexp) (error 'evaluate-expression "undefined variable")]
    [ (add? a-sexp) (+ (evaluate-expression (add-left a-sexp))
                       (evaluate-expression (add-right a-sexp)))]
    [ (mul? a-sexp) (* (evaluate-expression (mul-left a-sexp))
                       (evaluate-expression (mul-right a-sexp)))]))
;; tests
(= (evaluate-expression (make-add (make-mul 2 3) 4)) 10)
(evaluate-expression (make-add (make-mul 2 'x) 4)) ;; should throw error