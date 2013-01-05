;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 14.2.6|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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

;; A list-of-number/name is either
;; 1. empty or
;; 2. (cons (list ssn nom) lonn)
;; where ssn is a number, nom a symbol,
;; and lonn is a list-of-number/name.
;; Example
(define sample
'((99 o)
(77 l) 
(24 i) 
(10 h) 
(95 g) 
(15 d)
(89 c) 
(29 b)
(63 a)))

;; create-bst: BST number symbol -> BST
;; to to add a node to a BST
(define (create-bst a-bst n s)
  (cond
    [ (false? a-bst) (make-node n s false false)]
    [ (<= n (node-ssn a-bst))
      (make-node (node-ssn a-bst)
                 (node-name a-bst)
                 (create-bst (node-left a-bst) n s)
                 (node-right a-bst))]
    [ (> n (node-ssn a-bst))
      (make-node (node-ssn a-bst)
                 (node-name a-bst)
                 (node-left a-bst)
                 (create-bst (node-right a-bst) n s))]))

;; create-bst-from-list : list-of-number/name -> BST
;; produces a BST from given list
(define (create-bst-from-list a-lonn)
  (cond
    [ (empty? a-lonn) false]
    [ else (create-bst (create-bst-from-list (rest a-lonn))
                       (first (first a-lonn))
                       (first (rest (first a-lonn))))]))
;; test
(create-bst-from-list sample)
;; should yield
(make-node 63
           'a
           (make-node 29
                      'b
                      (make-node 15
                                 'd
                                 (make-node 10 'h false false)
                                 (make-node 24 'i false false))
                      false)
           (make-node 89
                      'c
                      (make-node 77 'l false false)
                      (make-node 95
                                 'g
                                 false
                                 (make-node 99 'o false false))))


