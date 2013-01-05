;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-27.2.3) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; A file of numbers (fon )is either  
;; 1.  empty , or  
;; 2.  (cons N F)  where  N  is a number and  F  is a file, or  
;; 3.  (cons 'NL F) , where  F  is a file.  

(define-struct rr (table costs)) 

(define (trigger hit-f miss-f)
  (local ((define (trigger l x)
            (cond
              ((empty? l) empty)
              ((equal? (first l) x) (hit-f (first l) (rest l)))
              (else (miss-f (first l) (trigger (rest l) x))))))
    trigger))

;; file->list-of-checks : fon -> (listof rr)
(define (file->list-of-checks fon)
  (local ((define nl 'NL)
          (define (first-line->rr fon nl)
            (local ((define first-line
                      ((trigger (lambda (x y) empty)
                                cons) 
                       fon nl)))
              (make-rr (first first-line) (rest first-line))))
          (define rest-lines
            (trigger (lambda (x y) y)
                     (lambda (x y) y))))
    (if (empty? fon)
        empty
        (cons (first-line->rr fon nl)
              (file->list-of-checks (rest-lines fon nl))))))
  
;; TEST
(define myfon (list 1 2.30 4.00 12.50 13.50 'NL 
                    2 4.00 18.00 'NL 
                    4 2.30 12.50))

;(equal? (first-line->rr myfon 'NL)
 ;       (make-rr 1 (list 2.30 4.00 12.50 13.50)))

;(equal? (rest-lines myfon 'NL)
;        (list 2 4.00 18.00 'NL 
;              4 2.30 12.50))


(equal? (file->list-of-checks myfon)
        (list (make-rr 1 (list 2.30 4.00 12.50 13.50)) 
              (make-rr 2 (list 4.00 18.00)) 
              (make-rr 4 (list 2.30 12.50))))
