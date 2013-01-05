;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 9.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; contains? : symbol list-of-symbols -> boolean
;; to determine whether a given symbol occurs on a-list-of-symbols
(define (contains? a-symbol a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) false]
    [else (or (symbol=? (first a-list-of-symbols) a-symbol)
              (contains? a-symbol (rest a-list-of-symbols)))]))
;; tests:
(boolean=? (contains? 'doll (cons 'bow (cons 'ax (cons 'ball empty))))
           false)
(boolean=? (contains? 'doll (cons 'arrow (cons 'doll (cons 'ball empty))))
           true)
