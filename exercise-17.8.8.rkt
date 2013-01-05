;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.8.8|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct node (ssn name left right))

;; A binary-tree (short: BT)
;: is either
;; 1. false; or
;; 2. (make-node soc pn lft rgt)
;; where soc is a number, pn is a symbol, and lft and rgt are BTs.

;; tree=? : binary-tree binary-tree -> boolean
;; determines whether two binary trees are equal
(define (tree=? bt1 bt2)
  (and (and (= (node-ssn bt1) (node-ssn bt2))
            (symbol=? (node-name bt1) (node-name bt2)))
       (cond
         [(false? (node-left bt1))
          (cond
            [(false? (node-right bt1))
             (and (false? (node-left bt2))
                  (false? (node-right bt2)))]
            [else
             (and (false? (node-left bt2))
                  (tree=? (node-right bt1) (node-right bt2)))])]
         [else (cond
                 [(false? (node-right bt1))
                  (and (tree=? (node-left bt1) (node-left bt2))
                       (false? (node-right bt2)))]
                 [else (and (tree=? (node-left bt1) (node-left bt2))
                            (tree=? (node-right bt1) (node-right bt2)))])])))

;; TESTS:
(tree=? (make-node 15
                   'd
                   (make-node 25 'a false false)
                   (make-node 24 'i false false))
        (make-node 15
                   'd
                   (make-node 25 'a false false)
                   (make-node 24 'i false false)))

(not (tree=? (make-node 15
                        'd
                        (make-node 24 'i false false)
                        false)
             (make-node 15
                        'd
                        (make-node 87 'h false false)
                        false)))
