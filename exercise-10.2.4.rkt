;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.2.4|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define-struct pr (name phone-number))
;; a phone-record (short: pr) is a structure:
;; (make-ip s n)
;; where s is a symbol and n is a number.

;; An directory is either
;; 1. empty or
;; 2. (cons pr dir) where pr is a phone-record and dir
;;    is a directory.

;; whose-number : directory number -> symbol
;; to produce the name that goes with a given phone number
(define (whose-number a-directory a-phone-number)
  (cond
    [ (empty? a-directory) 'notFound]
    [ (= (pr-phone-number (first a-directory)) a-phone-number)
      (pr-name (first a-directory))]
    [ else (whose-number (rest a-directory) a-phone-number)]))
;; tests:
(symbol=? (whose-number (cons (make-pr 'home 6513888031)
                              (cons (make-pr 'Sam 6518151697) empty))
                        6518151697)
          'Sam)
(symbol=? (whose-number (cons (make-pr 'home 6513888031)
                              (cons (make-pr 'Sam 6518151697) empty))
                        5550923532)

          'notFound)


;; phone-number : directory symbol -> number or symbol
;; to produce the phone number that goes with a given name
(define (phone-number a-directory a-name)
  (cond
    [ (empty? a-directory) 'notFound]
    [ (symbol=? (pr-name (first a-directory)) a-name)
      (pr-phone-number (first a-directory))]
    [ else (phone-number (rest a-directory) a-name)]))
;; tests:
(= (phone-number (cons (make-pr 'home 6513888031)
                       (cons (make-pr 'Sam 6518151697) empty))
                 'Sam)
   6518151697)
(symbol=? (phone-number (cons (make-pr 'home 6513888031)
                              (cons (make-pr 'Sam 6518151697) empty))
                        'Jeb)
          'notFound)