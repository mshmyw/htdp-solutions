;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-28.2.1) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; a tile is either true or false

;; a row is a (listof tile)

;; a board is a (listof row) where the number of tiles in each
;; row is equal to the number of rows in the board
(define chess-board
  (list (list true true true true true true true true)
        (list true true true true true true true true)
        (list true true true true true true true true)
        (list true true true true true true true true)
        (list true true true true true true true true)
        (list true true true true true true true true)
        (list true true true true true true true true)
        (list true true true true true true true true)))




