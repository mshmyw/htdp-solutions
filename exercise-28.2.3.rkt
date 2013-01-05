;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-28.2.3) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; a tile is either true or false

;; a row is a (listof tile)

;; a board is a (listof row) where the number of tiles in each
;; row is equal to the number of rows in the board

;; threatened? : posn posn -> bool
;; computes whether a queen on the first given position
;; can threaten the second position
(define (threatened? o p)
  (or (= (posn-x o) (posn-x p))
      (= (posn-y o) (posn-y p))
      (= 1 (abs (/ (- (posn-y p) (posn-y o))
                   (- (posn-x p) (posn-x o)))))))

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
(threatened? (make-posn 2 3) (make-posn 2 6))
(threatened? (make-posn 2 3) (make-posn 2 1))
(threatened? (make-posn 2 3) (make-posn 4 3))
(threatened? (make-posn 2 3) (make-posn 0 5))
(threatened? (make-posn 2 3) (make-posn 4 5))
(threatened? (make-posn 2 3) (make-posn 0 1))

(threatened? (make-posn 2 3) (make-posn 0 2))


