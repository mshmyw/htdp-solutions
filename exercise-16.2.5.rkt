;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 16.2.5|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; A file is a symbol.

(define-struct dir (name content))
;; A directory (short: dir) is a structure:
;; (make-dir n c)
;; where n is a symbol and c is a list of files and directories.

;; A list-of-files-and-directories (short: LOFD) is either
;; 1. empty;
;; 2. (cons f d) where f is a file and d is a LOFD; or
;; 3. (cons d1 d2) where d1 is a dir and d2 is a LOFD.

(define mydir (make-dir 'TS
                        (list (make-dir 'Text
                                        (list 'part1 'part2 'part3))
                              
                              (make-dir 'Libs
                                        (list (make-dir 'Code
                                                        (list 'hang 'draw))
                                              (make-dir 'Docs (list 'read!))))
                              'read!)))

;; count-files : LOFD -> number
;; produces number of files in given LOFD
(define (count-files a-lofd)
  (cond
    [ (empty? a-lofd) 0]
    [ (symbol? (first a-lofd)) (+ 1 (count-files (rest a-lofd)))]
    [ else (+ (how-many (first a-lofd)) (count-files (rest a-lofd)))]))

;; how-many : dir -> number
;; produces number of files in given dir tree
(define (how-many a-dir)
  (count-files (dir-content a-dir)))
;; test
(= (how-many mydir) 7)