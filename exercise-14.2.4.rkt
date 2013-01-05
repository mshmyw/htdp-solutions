;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 14.2.4|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct node (ssn name left right))
;; a node is a structure
;; (make-node s n l r)
;; where s is a number n is a symbol, and l and r are BTs
 
 ;; A binary-tree (short: BT)
;; is either
;; 1. false; or
;; 2. (make-node soc pn lft rgt)
;; where soc is a number, pn is a symbol, and lft and rgt are BTs.

;; A binary-search-tree (short: BST) is a BT:
;; 1. false is always a BST;
;; 2. (make-node soc pn lft rgt) is a BST if
;;    a. lft and rgt are BSTs,
;;    b. all ssn numbers in lft are smaller than soc, and
;;    c. all ssn numbers in rgt are larger than soc.

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

;; search-bst : number BST -> number or false
;; to search a BST for n and return it if it's there
(define (search-bst n a-bst)
  (cond
    [ (false? a-bst) false]
    [ (= (node-ssn a-bst) n) n]
    [ (< n (node-ssn a-bst))
      (search-bst n (node-left a-bst))]
    [ (> n (node-ssn a-bst))
      (search-bst n (node-right a-bst))]))
;; test:
(boolean=? (search-bst 23 my-tree) false)
(= (search-bst 21 my-tree) 21)