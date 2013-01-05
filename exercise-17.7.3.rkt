;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.7.3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; An addition is a structure:
;; (make-add l r)
;; where l and r are numbers
(define-struct add (left right))

;; A multiplication is a structure:
;; (make-mul l r)
;; where l and r are numbers
(define-struct mul (left right))

;; An fapplication is a structure
;; (make-fapplication n e)
;; where n is a symbol and e is a s-exp
(define-struct fapplication (name s-exp))

;; A fdefinition is a structure
;; (make-fdefinition n p b)
;; where n and p are symbols, b is a s-exp
(define-struct fdefinition (name parname body))

;; A value (val) is either
;; 1. a number, or
;; 2. a symbol

;; A scheme-expression (s-exp) is either
;; 1. a value;
;; 2. (make-add s-exp1 s-exp2)
;;    where s-exp1 and s-exp2 are scheme expressions; or
;; 3. (make-mul s-exp1 s-exp2)
;;    where s-exp1 and s-exp2 are scheme expressions
                             
;; evaluate-with-one-def : s-exp fdefinition -> value
;; For (the representation of) a variable, the function signals an error.
;; For an application of the function P, evaluate-with-one-def
;; 1. evaluates the argument;
;; 2. substitutes the value of the argument for the function parameter in
;;    the function's body; and
;; 3. evaluates the new expression via recursion.
;; For all other function applications, evaluate-with-one-def signals an error.
(define (evaluate-with-one-def asexp P)
  (cond
    [ (fapplication? asexp)
      (evaluate-with-one-def (subst (fdefinition-parname P)
                                    (evaluate-expression (fapplication-s-exp asexp))
                                    (fdefinition-body P))
                             P)]
    [ else (evaluate-expression asexp)]))

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

;; subst : symbol number s-exp -> number
;; computes value of a scheme expression
(define (subst v n a-sexp)
  (cond
    [ (number? a-sexp) a-sexp]
    [ (symbol? a-sexp) (cond
                         [ (symbol=? a-sexp v) n]
                         [ else (error 'subst
                                       "undefined variable")])]
    [ (add? a-sexp) (+ (subst v n (add-left a-sexp))
                       (subst v n (add-right a-sexp)))]
    [ (mul? a-sexp) (* (subst v n (mul-left a-sexp))
                       (subst v n (mul-right a-sexp)))]))

;; TESTS
;; f(x) = x + (x * 3)
(define fofx (make-fdefinition 'f 'x (make-add 'x (make-mul 'x 3))))
;; f(f(2)) = 32
(= (evaluate-with-one-def (make-fapplication 'f (make-mul 2 3)) fofx) 24)
(= (evaluate-with-one-def 4 fofx) 4)
(evaluate-with-one-def 'x fofx) ;; should throw error
   



