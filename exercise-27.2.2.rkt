;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-27.2.2) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; file->list-of-lines : file -> (listof (listof symbol)) 
;; to convert a file into a list of lines 
(define (file->list-of-lines afile)
  (local ((define NEWLINE 'NL) 
          (define first-line
            (local ((define (return-empty first rest)
                      empty))
              (trigger return-empty cons)))
          (define remove-first-line
            (local ((define (return-rest first rest)
                      rest))
              (trigger return-rest return-rest))))
    (cond 
      [(empty? afile) empty] 
      [else 
       (cons (first-line afile NEWLINE) 
             (file->list-of-lines (remove-first-line afile NEWLINE)))])))

;; trigger : (X (listof X) -> Y) (X (listof X) -> Y) -> ((listof X) X -> Y)
;; takes two functions and produces a function that checks each element of a
;; given list against a specified item. If the element is a match, the first
;; and rest of the list are given as arguments to the first function supplied
;; to trigger. Else, the second function processes the first of the list and
;; the recursively processed rest of the list.
(define (trigger hit-f miss-f)
  (local ((define (trigger l x)
            (cond
              ((empty? l) empty)
              ((equal? (first l) x) (hit-f (first l) (rest l)))
              (else (miss-f (first l) (trigger (rest l) x))))))
    trigger))

             
;; TESTS
(define myfile (list 'how 'are 'you 'NL 
                     'doing '? 'NL 
                     'any 'progress '?))
  
;(equal? (first-line myfile 'NL)
;        (list 'how 'are 'you))

;(equal? (remove-first-line myfile 'NL)
;        (list 'doing '? 'NL 
;              'any 'progress '?))
  
(equal? (file->list-of-lines myfile)
        (list (list 'how 'are 'you) 
              (list 'doing '?) 
              (list 'any 'progress '?))) 