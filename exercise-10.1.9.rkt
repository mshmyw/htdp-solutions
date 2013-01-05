;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 10.1.9|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; controller : number -> list-of-symbols
;; to consume the number of cents a customer must pay and build a
;; list of dollars and cents
(define (controller cents)
  (cond
    [ (= 1 (quotient cents 100))
      (cond
        [ (= 1 (remainder cents 100))
          (cons 1
                (cons 'dollar
                      (cons 'and
                            (cons 1
                                  (cons 'cent empty)))))]
        [ else (cons 1
                     (cons 'dollar
                           (cons 'and
                                 (cons (remainder cents 100)
                                       (cons 'cents empty)))))])]
    [ else (cond
             [ (= 1 (remainder cents 100))
               (cons (quotient cents 100)
                     (cons 'dollars
                           (cons 'and
                                 (cons 1
                                       (cons 'cent empty)))))]
             [ else (cons (quotient cents 100)
                     (cons 'dollars
                           (cons 'and
                                 (cons (remainder cents 100)
                                       (cons 'cents empty)))))])]))
;; test
(controller 103)
;; expected value:
(cons 1 (cons 'dollar (cons 'and (cons 3 (cons 'cents empty)))))
