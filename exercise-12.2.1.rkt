;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |exercise 12.2.1|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define-struct mail (from date message))
;; A mail-message is a structure:
;; (make-mail name n s)
;; where name is a string, n is a number, and s is a string.

;; A list-of-mail-messages is either
;; 1. empty or
;; 2. (cons mm lomm) where mm is a mail-message and lomm is
;;    a list-of-mail-messages

;; reformat-date : number -> number
;; to reformate a date given in mmddyyyy to yyyymmdd for sorting purposes
(define (reformat-date d)
  (+ (* (remainder d 10000)
        10000)
     (quotient (remainder d 1000000) 10000)
     (* (quotient d 1000000)
        100)))
;; test:
(= (reformat-date 01071986) 19860107)
(= (reformat-date 12312002) 20021231)

;; mail-insert-date : mail-message
;; list-of-mail-messages -> list-of-mail-messages (sorted by date)
;; to creat a list-of-mail-messages by inserting mm into an already
;; sorted (descending) list of mail-messages
(define (mail-insert-date mm lomm)
  (cond
    [ (empty? lomm) (cons mm empty)]
    [ else (cond
             [ (>= (reformat-date (mail-date mm))
                   (reformat-date (mail-date (first lomm))))
               (cons mm lomm)]
             [ else (cons (first lomm)
                          (mail-insert-date mm (rest lomm)))])]))
;; test:
(mail-insert-date (make-mail "Edwardo Riviero"
                             05301987
                             "Hola, Mundo! Soy aqui!")
                  (cons (make-mail "Ashley Johnson"
                                   01081988
                                   "OMG, I'm here!")                  
                        (cons (make-mail "Anne Larson"
                                         11041986
                                         "Hi, I was born today!")
                              (cons (make-mail "Sam Courtier"
                                               01071986
                                               "I now exist")
                                    empty))))
;; expected result:
(cons (make-mail "Ashley Johnson"
                 01081988
                 "OMG, I'm here!")
      (cons (make-mail "Edwardo Riviero"
                       05301987
                       "Hola, Mundo! Soy aqui!")
            (cons (make-mail "Anne Larson"
                             11041986
                             "Hi, I was born today!")
                  (cons (make-mail "Sam Courtier"
                                   01071986
                                   "I now exist")
                        empty))))

;; mail-insert-from : mail-message
;; list-of-mail-messages -> list-of-mail-messages (sorted by from)
;; to creat a list-of-mail-messages by inserting mm into an already
;; sorted (descending) list of mail-messages
(define (mail-insert-from mm a-lomm)
  (cond
    [(empty? a-lomm) (cons mm empty)]
    [else (cond
            [ (string<? (mail-from mm)
                        (mail-from (first a-lomm)))
              (cons mm a-lomm)]
            [ else (cons (first a-lomm) (mail-insert-from mm (rest a-lomm)))])]))
;; test:
(mail-insert-from (make-mail "Edwardo Riviero"
                             05301987
                             "Hola, Mundo! Soy aqui!")
                  (cons (make-mail "Ashley Johnson"
                                   01081988
                                   "OMG, I'm here!")
                        (cons (make-mail "Anne Larson"
                                         11041986
                                         "Hi, I was born today!")
                              
                              (cons (make-mail "Sam Courtier"
                                               01071986
                                               "I now exist")
                                    empty))))
;; should yield:
(cons (make-mail "Ashley Johnson"
                 01081988
                 "OMG, I'm here!")
      (cons (make-mail "Anne Larson"
                       11041986
                       "Hi, I was born today!")
            (cons (make-mail "Edwardo Riviero"
                             05301987
                             "Hola, Mundo! Soy aqui!")
                  (cons (make-mail "Sam Courtier"
                                   01071986
                                   "I now exist")
                        empty))))

;; sort-mail : list-of-mail-messages -> list-of-mail-messages
;; to sort a list of mail messages by from or date in descending order
(define (sort-mail selection a-lomm)
  (cond
    [ (empty? a-lomm) empty]
    [ (symbol=? selection 'date) (mail-insert-date (first a-lomm)
                                                   (sort-mail 'date (rest a-lomm)))]
    [ (symbol=? selection 'from) (mail-insert-from (first a-lomm)
                                                   (sort-mail 'from (rest a-lomm)))]))
;; test 1:
(sort-mail 'date (cons (make-mail "Ashley Johnson"
                                  01081988
                                  "OMG, I'm here!")
                       (cons (make-mail "Sam Courtier"
                                        01071986
                                        "I now exist")
                             (cons (make-mail "Anne Larson"
                                              11041986
                                              "Hi, I was born today!")
                                   empty))))
;; should yield:
(cons (make-mail "Ashley Johnson"
                 01081988
                 "OMG, I'm here!")
      (cons (make-mail "Anne Larson"
                       11041986
                       "Hi, I was born today!")
            (cons (make-mail "Sam Courtier"
                             01071986
                             "I now exist")
                  empty)))
;; test 2:
(sort-mail 'from (cons (make-mail "Ashley Johnson"
                                  01081988
                                  "OMG, I'm here!")
                       (cons (make-mail "Sam Courtier"
                                        01071986
                                        "I now exist")
                             (cons (make-mail "Anne Larson"
                                              11041986
                                              "Hi, I was born today!")
                                   empty))))
;; should yield:
(cons (make-mail "Anne Larson"
                 11041986
                 "Hi, I was born today!")
      (cons (make-mail "Ashley Johnson"
                       01081988
                       "OMG, I'm here!")
            (cons (make-mail "Sam Courtier"
                             01071986
                             "I now exist")
                  empty)))