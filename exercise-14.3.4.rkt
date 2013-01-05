;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 14.3.4|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; A Web-page (short: WP) is either
;; 1. empty;
;; 2. (cons s wp)
;; where s is a symbol and wp is a Web page; or
;; 3. (cons ewp wp)
;; where both ewp and wp are Web pages.

;; depth : WP -> number
;; to measure the depth of a WP
(define (depth a-wp)
  (cond
    [ (empty? a-wp) 0]
    [ (symbol? (first a-wp)) (depth (rest a-wp))]
    [ else (max (+ 1 (depth (first a-wp)))
                (depth (rest a-wp)))]))
;; tests
(= 3 (depth '(The TeachScheme Web Page
                  Here you can find:
                  (LectureNotes for Teachers)
                  (Guidance for (DrScheme: (a Scheme programming environment)
                                           (a revalucion!!)))
                  (Exercise Sets)
                  (Solutions for: (Exercises
                                   All that ails ya))
                  For further information: you can write to scheme@cs)))