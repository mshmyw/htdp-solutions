;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 12.4.2|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A word is either
;; 1. empty, or
;; 2. (cons a w) where a is a symbol ('a, 'b, ..., 'z) and w is a word.
;; For example:
;; (cons 'p (cons 'o (cons 'o (cons 'p empty))))
;; (cons 'p (cons 'e (cons 'e empty)))
;; (cons 'b (cons 'a (cons 'r (cons 'f empty))))

;; A list-of-words is either
;; 1. empty, or
;; 2. (cons w low) where w is a word and low is a list of words
;; For example:
;; (cons (cons 'p (cons 'o (cons 'o (cons 'p empty))))
;;       (cons (cons 'p (cons 'e (cons 'e empty)))
;;             (cons (cons 'b (cons 'a (cons 'r (cons 'f empty))))
;;                   empty)))

;; arrangements : word -> list-of-words
;; to create a list of all rearrangements of the letters in a-word
(define (arrangements a-word)
  (cond
   [(empty? a-word) (cons empty empty)]
   [else (insert-everywhere/in-all-words (first a-word)
					 (arrangements (rest a-word)))]))

;; insert-everywhere/in-all-words : symbol list-of-words -> list-of-words
;; inserts the first argument between all letters and at the beginning
;; and the end of all words of the second argument.
(define (insert-everywhere/in-all-words aletter alow)
  (cond
    [ (empty? alow) empty]
    [ else (append (insert-everywhere aletter (first alow))
                   (insert-everywhere/in-all-words aletter (rest alow)))]))

;; insert-everywhere : symbol word -> list-of-words
;; produces a list of words, each of which has the given symbol inserted
;; at a different positions. All possible positions are produced.
(define (insert-everywhere aletter aword)
  (cond
    [ (empty? aword) (cons (cons aletter empty) empty)]
    [ else (cons (cons aletter aword)
                 (prepend-list (first aword)
                               (insert-everywhere aletter (rest aword))))]))
           
;; prepend-list : symbol list-of-words
;; prepends a given symbol before each word in the given list
(define (prepend-list aletter alow)
  (cond
    [ (empty? alow) empty]
    [ else (cons (cons aletter (first alow))
                 (prepend-list aletter (rest alow)))]))

;; TEST SUITE
(arrangements (cons 'y (cons 'e (cons 's empty))))
(insert-everywhere/in-all-words
 'x
 (cons (cons 'p (cons 'o (cons 'o (cons 'p empty))))
       (cons (cons 'p (cons 'e (cons 'e empty)))
             (cons (cons 'b (cons 'a (cons 'r (cons 'f empty))))
                   empty))))
(insert-everywhere 'x (cons 'p (cons 'o (cons 'p empty))))
(prepend-list 'x (cons (cons 'e (cons 'd empty))
                       (cons (cons 'j (cons 'i (cons 'm empty)))
                             empty)))
