;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 18.2.15|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; extract1 : inventory -> inventory
;; to create an inventory from an-inv for all
;; those items that cost less than $1
(define (extract1 an-inv)
  (cond
    [(empty? an-inv) empty]
    [else (local ((define a-price (first an-inv))
                  (define extracted-rest (extract1 (rest an-inv))))
            (cond
              [(<= (ir-price a-price) 1.00)
               (cons a-price extracted-rest)]
              [else extracted-rest]))]))