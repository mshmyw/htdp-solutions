;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.6.2|) (read-case-sensitive #t) (teachpacks ((lib "dir.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "dir.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; a letter is a symbol a' or 'b or ... or 'z and '_ 

;; a word is either
;; 1. (cons l empty) where l is a letter or
;; 2. (cons l w) where l is a letter and w is a word.

;; reveal-list : word word letter -> word
;; consumes three arguments:
;; 1. the chosen word, which is the word that we have to guess;
;; 2. the status word, which states how much of the word we have guessed so far; and
;; 3. a letter, which is our current guess.
;; and produces an updated status word
(define (reveal-list chosen status guess)
  (cond
    [ (empty? (rest chosen))
      (cond
        [ (symbol=? guess (first chosen))
          (cons guess empty)]
        [ else status])]
    [ else (cond
             [ (symbol=? (first chosen) guess)
               (cons guess
                     (reveal-list (rest chosen)
                                  (rest status)
                                  guess))]
             [ else (cons (first status)
                          (reveal-list (rest chosen)
                                       (rest status)
                                       guess))])]))
;; examples:
(reveal-list (list 't 'e 'a) (list '_ 'e '_) 'u) ;; should yield:
(list '_ 'e '_)
(reveal-list (list 'a 'l 'e) (list 'a '_ '_) 'e) ;; should yield:
(list 'a '_ 'e)
(reveal-list (list 'a 'l 'l) (list '_ '_ '_) 'l) ;; should yield:
(list '_ 'l 'l)

;; draw-next-part : symbol -> boolean
;; draws pieces of a hangman figure
(define (draw-next-part part)
  (cond
    [(symbol=? part 'right-leg)
     (draw-solid-line (make-posn 100 125)
                      (make-posn 140 190))]
    [(symbol=? part 'left-leg)
     (draw-solid-line (make-posn 100 125)
                      (make-posn 60 190))]
    [(symbol=? part 'left-arm)
     (draw-solid-line (make-posn 100 75)
                      (make-posn 60 125))]
    [(symbol=? part 'right-arm)
     (draw-solid-line (make-posn 100 75)
                      (make-posn 140 125))]
    [(symbol=? part 'body)
     (draw-solid-line (make-posn 100 65)
                      (make-posn 100 125))]
    [(symbol=? part 'head)
     (and (draw-solid-disk (make-posn 100 45)
                  20
                  'black)
          (draw-solid-disk (make-posn 100 56)
                  2
                  'white)
          (draw-solid-disk (make-posn 92 40)
                  5
                  'white)
          (draw-solid-disk (make-posn 108 40)
                  5
                  'white))]
    [(symbol=? part 'noose)
     (and (draw-circle (make-posn 100 67)
                  7
                  'black)
          (draw-solid-line (make-posn 100 0)
                           (make-posn 100 60)))]))

(start 200 200)
(hangman-list reveal-list draw-next-part)