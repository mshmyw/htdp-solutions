;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-27.5.5) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; triangulate: (listof (listof num)) -> (listof (listof num))
;; takes a rectangular system of equations and produces a triangulated version
(define (triangulate system)
  (local ((define (swap-first-rows system)
            (cons (second system)
                  (cons (first system)
                        (rest (rest system))))))
    (cond ((empty? (rest system)) system)
          ((= (first (first system)) 0)
           (triangulate (swap-first-rows system)))
          (else (cons (first system)
                      (triangulate (subtract-from-system (first system)
                                                         (rest system))))))))


;; subtract-from-system: (listof (listof num)) (listof num) -> 
;;                       (listof (listof num))
;; subtracts a given row from all rows of a system
(define (subtract-from-system row system)
  (if (empty? system)
      empty
      (cons (subtract row (first system))
            (subtract-from-system row (rest system)))))

;; subtract: (listof num) (listof num) -> (listof num)
;; subtracts first list from second until 0 is in first position
(define (subtract l1 l2)
  (if (= (first l2) 0)
      (rest l2)
      (local ((define (scale-list list scalar)
                (if (empty? list)
                    empty
                    (cons (* scalar (first list))
                          (scale-list (rest list) scalar))))
              (define (subtract-lists l1 l2)
                (if (empty? l1)
                    empty
                    (cons (- (first l1) (first l2))
                          (subtract-lists (rest l1) (rest l2))))))
        (rest (subtract-lists l2
                              (scale-list l1 (/ (first l2) (first l1))))))))
        
;;TESTS
(triangulate (list (list 0  3  3 8)
                   (list 3  3 -2 3)
                   (list 0 -0  2 4)))

                  
