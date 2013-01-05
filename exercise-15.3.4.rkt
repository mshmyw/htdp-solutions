;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 15.3.4|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
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
                                        (list 'by
                                              (make-wp 'Gibson
                                                       (list 'We 'make 'guits!))))
                               (make-wp 'RG
                                        (list 'by 'Ibanez))
                               'and 'many 'more)))

;; search-doc : symbol document -> list-of-symbols or false
;; searches a document for symbols and produces all the headers
;; encountered on the way to a symbol, else false
(define (search-doc s a-doc)
  (cond
    [ (empty? a-doc) false]
    [ (symbol? (first a-doc)) (cond
                                [ (symbol=? s (first a-doc)) empty]
                                [ else (search-doc s (rest a-doc))])]
    [ (wp? (first a-doc)) (cond
                            [ (false? (find s (first a-doc)))
                              (search-doc s (rest a-doc))]
                            [ else (find s (first a-doc))])]))
                              

;; find : symbol WP -> list-of-symbols or false
;; if symbol occurs in web page, produces list of headers encountered
;; on the way to symbol, else false
(define (find s a-wp)
  (cond
    [ (empty? (wp-body a-wp)) false]
    [ (false? (search-doc s (wp-body a-wp))) false]
    [ else (cons (wp-header a-wp) (search-doc s (wp-body a-wp)))]))
  
;; test
(find 'guits! my-page) ;; should produce
(list 'Guitars 'LesPaul 'Gibson)
  

