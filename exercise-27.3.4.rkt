;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-27.3.4) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; NOTE: code given in the book was totally borked and didn't run.
;; What follows is incorporates my fixes.

;; find-root : (number -> number) number number -> number 
;; to determine a number R such that f has a 
;; root between R and (+ R TOLERANCE) 
;; 
;; ASSUMPTION: f is continuous and monotonic 
(define (find-root f left right)
  (local ((define (find-root-aux f left right fofleft fofright)
            (cond 
              [(<= (- right left) TOLERANCE) left] 
              [else 
               (local ((define mid (/ (+ left right) 2))
                       (define fofmid (f mid)))
                 (cond
                   [(or (<= fofleft 0 fofmid) (<= fofmid 0 fofleft))
                    (find-root-aux f left mid fofleft fofmid)]
                   [else
                    (find-root-aux f mid right fofmid fofright)]))])))
    (find-root-aux f left right (f left) (f right))))
     
;; poly : number -> number 
(define (poly x)
 (* (- x 2) (- x 4)))

;; TESTS
(define TOLERANCE 0.1)

(<= (- 2 TOLERANCE) (find-root poly 1 3) 2)
(<= (- 4 TOLERANCE) (find-root poly 3 5) 4)
