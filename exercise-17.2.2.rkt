;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.2.2|) (read-case-sensitive #t) (teachpacks ((lib "dir.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "dir.ss" "teachpack" "htdp")))))
(define-struct pr (name number))
;; A phone-record (pr) is a structure:
;; (make-phone-record s n)
;; where s is a symbol and n is a number

;; zip : list-of-symbols list-of-numbers -> list-of-prs
;; combines a list of names and a list of phone numbers
;; into a list of phone records
(define (zip a-los a-lon)
  (cond
    [ (empty? a-los) empty]
    [ else (cons (make-pr (first a-los) (first a-lon))
                 (zip (rest a-los) (rest a-lon)))]))
;; test:
(zip (list 'Jim
           'Ed
           'Mo)
     (list 5438583939
           3859034092
           3383903242)) ;; should yield:
(list (make-pr 'Jim 5438583939)
      (make-pr 'Ed  3859034092)
      (make-pr 'Mo  3383903242))