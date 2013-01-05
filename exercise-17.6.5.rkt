;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.6.5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; A word is either
;; 1. empty, or
;; 2. (cons a w) where a is a symbol ('a, 'b, ..., 'z) and w is a word.

;; A list-of-words is either
;; 1. empty, or
;; 2. (cons w low) where w is a word and low is a list of words

;; gift-pick: list-of-names -> list-of-names
;; to pick a ``random'' non-identity arrangement of names
(define (gift-pick names)
  (random-pick
   (non-same names (arrangements names))))

;; random-pick : list-of-list-of-names -> list-of-names
;; consumes a list of items and randomly picks one of them as the result
(define (random-pick lolon)
  (cond
   [ (empty? lolon) empty]
   [ else (cond
	   [ (= (random 5) 0)
	     (first lolon)]
	   [ else (random-pick (append (rest lolon)
				       (cons (first lolon) empty)))])]))

;; corresponds? : list-of-symbols list-of-symbols -> boolean
;; consumes two lists of symbols and sees if they correspond
;; at any position
(define (corresponds? alos1 alos2)
  (cond
   [ (and (cons? alos1) (cons? alos2))
     (cond
      [ (symbol=? (first alos1) (first alos2))
	true]
      [ else (corresponds? (rest alos1) (rest alos2))])]
   [ else false]))

;; non-same : list-of-names
;;            list-of-list-of-names -> list-of-list-of-names
;; consumes a list of names and a list of arrangements loa and
;; produces the list of those that do not agree with L at any position
(define (non-same alon aloa)
  (cond
   [ (and (cons? alon) (cons? aloa))
     (cond
      [ (corresponds? alon (first aloa))
	(non-same alon (rest aloa))]
      [ else (cons (first aloa) (non-same alon (rest aloa)))])]
   [ else empty]))

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

;; TESTS)
(gift-pick '(jim edward mel jill))
