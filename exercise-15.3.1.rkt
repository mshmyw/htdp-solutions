;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 15.3.1|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct wp (header body))
;; A Web-page (short: WP) is a structure:
;; (make-wp h p)
;; where h is a symbol and p is a (Web) document.

;; A (Web) document is either
;; 1. empty,
;; 2. (cons s p)
;;    where s is a symbol and p is a document, or
;; 3. (cons w p)
;;    where w is a Web page and p is a document.

(define my-page (make-wp 'Guitars
                         (list 'Common 'guitars 'include:
                               (make-wp 'Stratocaster
                                        (list 'by 'Fender))
                               (make-wp 'LesPaul
                                        (list 'by 'Gibson))
                               (make-wp 'RG
                                        (list 'by 'Ibanez))
                               'and 'many 'more)))

;; count-symbols : document -> number
;; counts the number of symbols in a given document
(define (count-symbols a-doc)
  (cond
    [ (empty? a-doc) 0]
    [ (symbol? (first a-doc)) (+ 1 (count-symbols (rest a-doc)))]
    [ else (+ (size (first a-doc))
              (count-symbols (rest a-doc)))]))

;; size : WP -> number
;; produce the number of symbols a web page contains
(define (size a-wp)
  (cond
    [ (empty? (wp-body a-wp)) 1]
    [ else (+ 1 (count-symbols (wp-body a-wp)))]))
;; tests:
(= (size my-page) 16)