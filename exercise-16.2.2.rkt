;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 16.2.2|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; A file is a symbol.

;; A directory (short: dir) is either
;; 1. empty;
;; 2. (cons f d) where f is a file and d is a dir; or
;; 3. (cons d1 d2) where d1 and d2 are dirs.

(define mydir '((part1 part2 part3)
                ((hang draw)
                 (read!))
                read!))

;; how-many : dir -> number
;; produces number of files in given directory
(define (how-many a-dir)
  (cond
    [ (empty? a-dir) 0]
    [ (symbol? (first a-dir)) (+ 1 (how-many (rest a-dir)))]
    [ else (+ (how-many (first a-dir)) (how-many (rest a-dir)))]))
;; test
(= (how-many mydir) 7)