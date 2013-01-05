;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 14.2.5|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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
;; test 1
(create-bst false 66 'a)
;; should yield:
(make-node 66 'a false false)
;; test 2
(create-bst (create-bst false 66 'a) 53 'b)
;; should yield:
(make-node 66
           'a
           (make-node 53 'b false false)
           false)
;; test 3:
(create-bst
 (create-bst
  (create-bst
   (create-bst
    (create-bst
     (create-bst
      (create-bst
       (create-bst
        (create-bst false 63 'e)
        29 'd)
       89 'g)
      15 'b)
     77 'f)
    95 'h)
   10 'a)
  24 'c)
 99 'i)
;; should yield
(make-node 63
           'e
           (make-node 29
                      'd
                      (make-node 15
                                 'b
                                 (make-node 10 'a false false)
                                 (make-node 24 'c false false))
                      false)
           (make-node 89
                      'g
                      (make-node 77 'f false false)
                      (make-node 95
                                 'h
                                 false
                                 (make-node 99 'i false false))))




