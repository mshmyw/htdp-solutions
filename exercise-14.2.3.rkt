;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 14.2.3|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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
(define my-tree (make-node 19
                           'd
                           (make-node 15
                                      'd
                                      false
                                      false)
                           (make-node 24
                                      'i                                    
                                      (make-node 21
                                                 'h
                                                 false
                                                 false)
                                      false)))

;; inorder : BT -> list
;; to produce an ordered list of all ssn numbers in given tree
(define (inorder a-bt)
  (cond
    [ (false? a-bt) empty]
    [ else (append (inorder (node-left a-bt))
                   (list (node-ssn a-bt))
                   (inorder (node-right a-bt)))]))
;; test:
(inorder my-tree)
;; should yield:
(list 15 19 21 24)