;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise-29.4.8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;; vector-contains-doll? (vectorof symbol) -> num or false
;; produces the index of doll or false
(define (vector-contains-doll? v)
  (local ((define length
            (vector-length v))
          (define (aux i)
            (cond
              [(= i  length) false]
              [(symbol=? (vector-ref v i) 'doll) i]
              [else (aux (add1 i))])))
     (aux 0)))

;; TESTS
(define vector-w/-doll
  (vector 'cow 'pig 'horse 'LeonardEuler 'doll))
(define vector-w/o-doll
  (vector 'guitar 'fish 'guitarfish))

(= (vector-contains-doll? vector-w/-doll) 4)
(not (vector-contains-doll? vector-w/o-doll))