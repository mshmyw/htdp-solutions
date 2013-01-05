;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 14.2.1|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct node (ssn name left right))
;; a node is a structure
;; (make-node s n l r)
;; where s is a number n is a symbol, and l and r are BTs
 
 ;; A binary-tree (short: BT)
;; is either
;; 1. false; or
;; 2. (make-node soc pn lft rgt)
;; where soc is a number, pn is a symbol, and lft and rgt are BTs.
;; Example:
(define my-tree (make-node 15
                           'd
                           (make-node 19
                                      'd
                                      false
                                      false)
                           (make-node 24
                                      'i
                                      false
                                      (make-node 87
                                                 'h
                                                 false
                                                 false))))

;; contains-bt : number BT -> boolean
(define (contains-bt n a-bt)
  (cond
    [ (false? a-bt) false]
    [ else (or (= (node-ssn a-bt) n)
               (contains-bt n (node-left a-bt))
               (contains-bt n (node-right a-bt)))]))
;; test:
(boolean=? (contains-bt 22 my-tree) false)
(boolean=? (contains-bt 19 my-tree) true)