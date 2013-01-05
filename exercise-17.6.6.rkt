;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 17.6.6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; DNAprefix : list-of-symbol list-of-symbol -> boolean
;; returns true of the pattern is a prefix of the search-string
(define (DNAprefix pattern search-string)
  (cond
    [ (empty? pattern) true]
    [ (empty? search-string) false]
    [ else (and (symbol=? (first pattern) (first search-string))
                (DNAprefix (rest pattern) (rest search-string)))]))

;; DNAprefix1 : list-of-symbols list-of-symbols -> symbol or boolean
;; returns the first item beyond the pattern in the search-string if the
;; pattern is a proper prefix of the search-string. If the lists do not match
;; or if the pattern is no shorter than the search-string, the modified function
;; should return false. If the lists are equally long and match, the result is true.
(define (DNAprefix1 pattern search-string)
  (cond
    [ (and (empty? pattern) (empty? search-string)) true]
    [ (and (cons? pattern) (empty? search-string)) false]
    [ (and (empty? pattern) (cons? search-string)) (first search-string)]
    [ else (cond
             [ (boolean? (DNAprefix1 (rest pattern) (rest search-string)))
               (DNAprefix1 (rest pattern) (rest search-string))]
             [ else
               (DNAprefix1 (rest pattern) (rest search-string))])]))
         
;; TESTS
(DNAprefix (list 'a 't) (list 'a 't 'c))
(not (DNAprefix (list 'a 't) (list 'a)))
(DNAprefix (list 'a 't) (list 'a 't))
(not (DNAprefix (list 'a 'c 'g 't) (list 'a 'g)))
(not (DNAprefix (list 'a 'a 'c 'c) (list 'a 'c)))


(symbol=? (DNAprefix1 (list 'a 't) (list 'a 't 'c))
'c)
(not (DNAprefix1 (list 'a 't) (list 'a)))
(DNAprefix1 (list 'a 't) (list 'a 't))
(not (DNAprefix1 (list 'a 'c 'g 't) (list 'a 'g)))
(not (DNAprefix1 (list 'a 'a 'c 'c) (list 'a 'c)))