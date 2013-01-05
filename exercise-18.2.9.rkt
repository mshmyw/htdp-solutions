;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 18.2.9|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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
  (local ((define (insert-everywhere/in-all-words aletter alow)
            (cond
              [ (empty? alow) empty]
              [ else (append (insert-everywhere aletter (first alow))
                             (insert-everywhere/in-all-words aletter
                                                             (rest alow)))]))
          (define (insert-everywhere aletter aword)
            (cond
              [ (empty? aword) (cons (cons aletter empty) empty)]
              [ else (cons (cons aletter aword)
                           (prepend-list (first aword)
                                         (insert-everywhere aletter
                                                            (rest aword))))]))
          (define (prepend-list aletter alow)
            (cond
              [ (empty? alow) empty]
              [ else (cons (cons aletter (first alow))
                           (prepend-list aletter (rest alow)))])))
    (cond
      [(empty? a-word) (cons empty empty)]
      [else (insert-everywhere/in-all-words (first a-word)
                                            (arrangements (rest a-word)))])))

;; TEST SUITE
(arrangements (cons 'y (cons 'e (cons 's empty))))