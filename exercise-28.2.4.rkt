;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-28.2.4) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; a tile is either true or false

;; a row is a (listof tile)

;; a board is a (listof row) where the number of tiles in each
;; row is equal to the number of rows in the board

;; placement : N board -> board or bool
;; places n queens on board if possible, else false
(define (placement n b)
  (cond
    [(zero? n) b]
    [(empty? b) false]
    [else (local ((define available-tile
                    (find-available-tile b)))
            (if (posn? available-tile)
                (placement (sub1 n) 
                           (place-queen available-tile b))
                false))]))

;; find-available-tile
(define (find-available-tile b)
  (local ((define (find-in-row row j)
            (cond
              [(empty? row) false]
              [(first row) j]
               [else (find-in-row (rest row) (add1 j))]))
          (define (find-in-columns b i)
            (if (empty? b)
                false
                (local ((define potential-tile
                          (find-in-row (first b) 0)))
                  (if (number? potential-tile)
                      (make-posn i potential-tile)
                      (find-in-columns (rest b) (add1 i)))))))
    (find-in-columns b 0)))

;; place-queen
(define (place-queen queen-pos b)
  (local ((define (threaten i j)
            (and (board-ref b i j)
                 (not (threatened? queen-pos (make-posn i j))))))
    (build-board (length b) threaten)))

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
(define test-board (build-board 5 (lambda (i j) true)))
(define 1Q-board (place-queen (make-posn 0 0) test-board))
1Q-board
(define 2Q-board (place-queen (make-posn 1 2) 1Q-board))
2Q-board
(define 3Q-board (place-queen (make-posn 2 4) 2Q-board))
3Q-board
(define 4Q-board (place-queen (make-posn 3 1) 3Q-board))
4Q-board
(define 5Q-board (place-queen (make-posn 4 3) 4Q-board))
5Q-board

(equal? (placement 1 test-board) 1Q-board)
(equal? (placement 2 test-board) 2Q-board)
(equal? (placement 3 test-board) 3Q-board)
(equal? (placement 4 test-board) 4Q-board)
(equal? (placement 5 test-board) 5Q-board)
(not (placement 6 test-board))
