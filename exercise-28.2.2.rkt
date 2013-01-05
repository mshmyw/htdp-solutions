;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-28.2.2) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; a tile is either true or false

;; a row is a (listof tile)

;; a board is a (listof row) where the number of tiles in each
;; row is equal to the number of rows in the board

;; build-board : N (N N -> boolean) -> board
;; creates a board of size n x n, and fills
;; each position with indices i and j with (f i j)
(define (build-board n f)
  (if (zero? n)
      empty
      (local ((define (build-row i j)
                (if (= j n)
                    empty
                    (cons (f i j)
                          (build-row i (add1 j)))))
              (define (build-columns i)
                (if (= i n)
                    empty
                    (cons (build-row i 0)
                          (build-columns (add1 i))))))
        (build-columns 0))))

;; board-ref : board N N -> boolean
;; access position with indices i, j on given board
(define (board-ref b i j)
  (local ((define (row-ref row j)
            (if (zero? j)
                (first row)
                (row-ref (rest row) (sub1 j)))))
    (if (zero? i)
        (row-ref (first b) j)
        (board-ref (rest b) (sub1 i) j))))

;; TEST
(equal? (board-ref (list (list true false true)
                         (list false true false)
                         (list true true false))
                   2 2)
        false)
(equal? (board-ref (list (list true false true)
                         (list false true false)
                         (list true true false))
                   0 2)
        true)
(equal? (board-ref (list (list true false true)
                         (list false true false)
                         (list true true false))
                   1 0)
        false)
(equal? (build-board 4 (lambda (i j) (= j 2)))
        (list
         (list false false true false)
         (list false false true false)
         (list false false true false)
         (list false false true false)))
(equal? (build-board 4 (lambda (i j) (= i 3)))
        (list
         (list false false false false)
         (list false false false false)
         (list false false false false)
         (list true true true true)))
        