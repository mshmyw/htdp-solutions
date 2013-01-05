;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 15.3.3|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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

;; occurs-doc : symbol document -> boolean
;; determines whether a symbol occurs in a document
(define (occurs-doc s a-doc)
  (cond
    [ (empty? a-doc) false]
    [ (symbol? (first a-doc)) (cond
                                [ (symbol=? s (first a-doc))
                                  true]
                                [ else (occurs-doc s (rest a-doc))])]
    [ else (or (occurs s (first a-doc))
               (occurs-doc s (rest a-doc)))]))
                              
;; occurs : symbol WP -> boolean
;; determines whether the given symbol is anywhere in the given WP
;; or its embedded pages
(define (occurs s a-wp)
  (or (symbol=? s (wp-header a-wp))
      (occurs-doc s (wp-body a-wp))))
;; tests
(boolean=? (occurs 'Gibson my-page) true)
(boolean=? (occurs 'Jackson my-page) false)
