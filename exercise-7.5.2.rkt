;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 7.5.2|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define-struct circle (center radius))
(define-struct square (nw length))

;; profit : number -> number
;; computes the profit from a given ticket price
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))
(define (revenue ticket-price)
  (* (attendees ticket-price) ticket-price))
(define (cost ticket-price)
  (+ 180
     (* .04 (attendees ticket-price))))
(define (attendees ticket-price)
  (+ 120
     (* (/ 15 .10) (- 5.00 ticket-price))))

;; checked-profit : number -> number
(define (checked-profit ticket-price)
  (cond
    [(number? ticket-price) (profit ticket-price)]
    [else (error 'profit "expected a number")]))
;; Test 1
; (checked-profit 2)
;; expected result:
; (profit 2)
;; Test 2
; (checked-profit 'Cheese)
;; expected result:
; "expected a number"

;; is-between-5-6? : number -> boolean
;; to determine whether n is between 5 and 6 (exclusive)
(define (is-between-5-6? n)
(and (< 5 n) (< n 6)))

;; checked-is-between-5-6? : number -> boolean
(define (checked-is-between-5-6? n)
  (cond
    [(number? n) (is-between-5-6? n)]
    [else (error 'checked-is-between-5-6? "expected a number")]))
;; Test 1
; (checked-is-between-5-6? 2)
;; expected result:
; (is-between-5-6? 2)
;; Test 2
; (checked-is-between-5-6? 'Cheese)
;; expected result:
; "expected a number"

;; reply : symbol -> symbol
;; to determine a reply for the greeting s
(define (reply s)
  (cond
    [(symbol=? s 'GoodMorning) 'Hi]
    [(symbol=? s 'HowAreYou?) 'Fine]
    [(symbol=? s 'GoodAfternoon) 'INeedANap]
    [(symbol=? s 'GoodEvening) 'BoyAmITired]
    [else (error 'reply "not one of the available greetings")]))

;; checked-reply : symbol -> symbol
(define (checked-reply s)
  (cond
    [(symbol? s) (reply s)]
    [else (error 'checked-reply "expected a symbol")]))
;; Test 1
; (checked-reply 2)
;; expected result:
; "expected a symbol"
;; Test 2
; (checked-reply 'Cheese)
;; expected result:
; "not one of the available greetings"
;; Test 3
; (checked-reply 'HowAreYou?)
;; expected result:
; 'Fine

;; distance-to-0 : pixel-2 -> number
;; to compute the distance of a-pixel to the origin
(define (distance-to-0 a-pixel)
  (cond
    [(number? a-pixel) a-pixel]
    [(posn? a-pixel) (sqrt
                      (+ (sqr (posn-x a-pixel))
                         (sqr (posn-y a-pixel))))]))

;; checked-distance-to-0 : pixel-2 -> number
(define (checked-distance-to-0 a-pixel)
  (cond
    [(number? a-pixel) (distance-to-0 a-pixel)]
    [(posn? a-pixel) (distance-to-0 a-pixel)]
    [else (error 'checked-distance-to-0 "posn number expected")]))
;; TEST 1
(define my-pixel (make-posn 3 4))
; (checked-distance-to-0 my-pixel)
;; expected result:
; 5
;; TEST 2
; (checked-distance-to-0 'giblet)
;; expected result:
; "posn expected"
;; TEST 3
; (checked-distance-to-0 4)
;; expected result:
; 4

;; perimeter : shape -> number
;; to compute the perimeter of a-shape
(define (perimeter a-shape)
  (cond
    [(circle? a-shape)
     (* (* 2 (circle-radius a-shape)) pi)]
    [(square? a-shape)
     (* (square-length a-shape)
        4)]))

;; checked-perimeter : shape -> number
;; perimeter : shape -> number
;; to compute the perimeter of a-shape
(define (checked-perimeter a-shape)
  (cond
    [(circle? a-shape)
     (* (* 2 (circle-radius a-shape)) pi)]
    [(square? a-shape)
     (* (square-length a-shape)
        4)]
    [else (error 'checked-perimeter "expected a defined shape")]))
;; Test 1
; (checked-perimeter 'cheese)
;; expected result
; "expected a defined shape"