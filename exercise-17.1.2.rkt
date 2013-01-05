;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.1.2|) (read-case-sensitive #t) (teachpacks ((lib "dir.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "dir.ss" "teachpack" "htdp")))))
;; prepend : s list -> list
;; produces (list (list s i_1) (list s i_2) ... (list s i_n))
(define (prepend s a-list)
  (cond
    [ (empty? a-list) empty]
    [ else (append (list (list s (first a-list)))
                   (prepend s (rest a-list)))]))
;; test:
(prepend 'a (list 1 2 3 4)) ;; should yield:
(list (list 'a 1) (list 'a 2) (list 'a 3) (list 'a 4))
                 

;; cross : list-of-symbols list-of-numbers -> list
;; produces all possible pairs of symbols and numbers
(define (cross l1 l2)
  (cond
    [ (or (empty? l1)
          (empty? l2))
      empty]
    [ else (append (prepend (first l1) l2)
                   (cross (rest l1) l2))]))

    
    
                   
         

(cross '(a b c) '(1 2))
;; expected value:
(list (list 'a 1) (list 'a 2) (list 'b 1) (list 'b 2) (list 'c 1) (list
'c 2))
