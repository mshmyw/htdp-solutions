;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 6.7.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define-struct word (l1 l2 l3))
;; A word is a structure: (make-word a b c) where a, b, and c
;; are symbols.

;; check-l1, -l2, and -l3 : word word symbol -> word
;; checks the specified letter of the chosen word, determines if it
;; matches the guess, then outputs a new status word
(define (check-l1 chosen status guess)
  (cond
    [(symbol=? guess (word-l1 chosen))
     (make-word guess
                (word-l2 status)
                (word-l3 status))]
     [else status]))

(define (check-l2 chosen status guess)    
  (cond
    [(symbol=? guess (word-l2 chosen))
     (make-word (word-l1 status)
                guess
                (word-l3 status))]
    [else status]))

(define (check-l3 chosen status guess)  
  (cond
    [(symbol=? guess (word-l3 chosen))
     (make-word (word-l1 status)
                (word-l2 status)
                guess)]
    [else status]))

;; reveal : word word symbol -> word
;; Takes the word that is to be guessed, the currently revealed portion
;; of that word, and a letter for a current guess. It produces an updated
;; currently revealed portion of the word to be guessed.
(define (reveal chosen status guess)
  (check-l1 chosen 
            (check-l2 chosen
                      (check-l3 chosen
                                status
                                guess)
                      guess)
            guess))
;; Tests:
(reveal (make-word 't 'e 'a) (make-word '_ 'e '_) 'u)
;;;; expected value:
(make-word '_ 'e '_)
(reveal (make-word 'a 'l 'e) (make-word 'a '_ '_) 'e)
;;;; expected value:
(make-word 'a '_ 'e)
(reveal (make-word 'a 'l 'l) (make-word '_ '_ '_) 'l)
;;;; expected value:
(make-word '_ 'l 'l)

; ;;;;;;;;;;;;;;;;;;; (UGLY) ALTERNATIVE SOLUTION ;;;;;;;;;;;;;;;;;;;;;;; 
; 
; ;; reveal : word word symbol -> word
; ;; Takes the word that is to be guessed, the currently revealed portion
; ;; of that word, and a letter for a current guess. It produces an updated
; ;; currently revealed portion of the word to be guessed.
; (define (reveal chosen status guess)
;   (cond
;     [(and (symbol=? guess (word-l1 chosen))
;           (symbol=? guess (word-l2 chosen))
;           (symbol=? guess (word-l3 chosen)))
;      (make-word guess
;                 guess
;                 guess)]
;     [(and (symbol=? guess (word-l1 chosen))
;           (symbol=? guess (word-l2 chosen)))
;      (make-word guess
;                 guess
;                 (word-l3 status))]
;     [(and (symbol=? guess (word-l1 chosen))
;           (symbol=? guess (word-l3 chosen)))
;      (make-word guess
;                 (word-l2 status)
;                 guess)] 
;     [(and (symbol=? guess (word-l2 chosen))
;           (symbol=? guess (word-l3 chosen)))
;      (make-word (word-l2 status)
;                 guess
;                 guess)]
;     [(symbol=? guess (word-l1 chosen))
;      (make-word guess
;                 (word-l2 status)
;                 (word-l3 status))]
;     [(symbol=? guess (word-l2 chosen))
;      (make-word (word-l1 status)
;                 guess
;                 (word-l3 status))]
;     [(symbol=? guess (word-l3 chosen))
;      (make-word (word-l1 status)
;                 (word-l2 status)
;                 guess)]
;     [else status]))
; ;; Tests:
; (reveal (make-word 't 'e 'a) (make-word '_ 'e '_) 'u)
; ;;;; expected value:
; (make-word '_ 'e '_)
; (reveal (make-word 'a 'l 'e) (make-word 'a '_ '_) 'e)
; ;;;; expected value:
; (make-word 'a '_ 'e)
; (reveal (make-word 'a 'l 'l) (make-word '_ '_ '_) 'l)
; ;;;; expected value:
; (make-word '_ 'l 'l)

(start 200 200)

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