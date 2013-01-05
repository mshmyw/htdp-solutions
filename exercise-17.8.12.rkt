;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.8.12|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

;; evaluate-with-defs : s-exp list-of-fdefinitions -> value
;; consumes a s-exp and a list of fdefinitions, defs. Produces the number that
;; DrScheme would produce if we were to evaluate the actual s-exp expression in
;; the Interactions window and if the Definitions window contained the actual
;; definitions. For an application of the function P, evaluate-with-defs
;; 1. evaluates the argument;
;; 2. looks up the definition of P in defs;
;; 3. substitutes the value of the argument for the function parameter in the
;;    function's body; and
;; 4. evaluates the new expression via recursion. Signals an error for a function
;; application whose function name is not on the list and for (the representation
;; of) a variable.
(define (evaluate-with-defs asexp alod)
  (cond
    [ (empty? alod) (error 'evaluate-with-defs "function not found")]
    [ (fapplication? asexp)
      (cond
        [ (symbol=? (fapplication-name asexp)
                    (fdefinition-name (first alod)))
          (evaluate-with-defs (subst (fdefinition-parname (first alod))
                                     (evaluate-expression
                                      (fapplication-s-exp asexp))
                                     (fdefinition-body (first alod)))
                              alod)]
        [ else (evaluate-with-defs asexp (rest alod))])]
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

;; test-evaluate : s-exp list-of-fdefinitions s-exp -> test-result
(define (test-evaluate asexp alod expected-result)
  (cond
    [(equal? (evaluate-with-defs asexp alod) expected-result) true]
    [else (list "bad test result:" asexp alod expected-result)]))

;; TESTS:
(define my-defs
  (list (make-fdefinition 'g 'x 4)
        (make-fdefinition 'f 'x (make-add 3 'x))
        (make-fdefinition 'h 'x (make-add 5 'x))))
(test-evaluate (make-fapplication 'f 3)  my-defs 6)
(test-evaluate (make-fapplication 'g 123)  my-defs 4)
(test-evaluate (make-fapplication 'h (make-mul 2 5))  my-defs 15)
(test-evaluate (make-fapplication 'j (make-mul 2 5))  my-defs error) ;; should error