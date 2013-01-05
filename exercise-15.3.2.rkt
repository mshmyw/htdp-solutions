;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 15.3.2|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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

;; list-symbols : document -> list-of-symbols
;; produces a list of all symbols in the given document
(define (list-symbols a-doc)
  (cond
    [ (empty? a-doc) empty]
    [ (symbol? (first a-doc))
      (cons (first a-doc) (list-symbols (rest a-doc)))]
    [ else (cons (wp-header (first a-doc)) (list-symbols (rest a-doc)))]))

;; wp-to-file : WP -> list-of-symbols
;; produces list of body and headers of given web page
(define (wp-to-file a-wp)
  (list-symbols (wp-body a-wp)))
;; example:
(wp-to-file my-page) ;; should yield
(list 'Common 'guitars 'include:
      'Stratocaster
      'LesPaul
      'RG
      'and 'many 'more)
