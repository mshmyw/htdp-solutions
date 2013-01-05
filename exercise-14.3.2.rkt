;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 14.3.2|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; A Web-page (short: WP) is either
;; 1. empty;
;; 2. (cons s wp)
;; where s is a symbol and wp is a Web page; or
;; 3. (cons ewp wp)
;; where both ewp and wp are Web pages.

;; occurs1 : WP symbol -> number
;; produces number of times given symbol occurs
;; in the Web page, ignoring nested WPs
(define (occurs1 a-wp s)
  (cond
    [ (empty? a-wp) 0]
    [ (and (symbol? (first a-wp))
           (symbol=? (first a-wp) s))
      (+ 1 (occurs1 (rest a-wp) s))]
    [ else (occurs1 (rest a-wp) s)]))
;; tests
(= 0 (occurs1 '(The TeachScheme Web Page
                    Here you can find:
                    (LectureNotes for Teachers)
                    (Guidance for (DrScheme: a Scheme programming environment))
                    (Exercise Sets)
                    (Solutions for Exercises)
                    For further information: write to scheme@cs)
              'Exercise))
(= 2 (occurs1 '(The TeachScheme Web Page
                    Here you can find:
                    (LectureNotes for Teachers)
                    (Guidance for (DrScheme: a Scheme programming environment))
                    (Exercise Sets)
                    (Solutions for Exercises)
                    For further information: you can write to scheme@cs)
              'can))

;; occurs2 : WP symbol -> number
;; produces number of times given symbol occurs in
;; web page and nested web page
(define (occurs2 a-wp s)
  (cond
    [ (empty? a-wp) 0]
    [ (symbol? (first a-wp)) (cond
                               [ (symbol=? (first a-wp) s)
                                 (+ 1 (occurs2 (rest a-wp) s))]
                               [ else (occurs2 (rest a-wp) s)])]
    [ else (+ (occurs2 (first a-wp) s)
              (occurs2 (rest a-wp) s))]))
;; tests
(= 0 (occurs2 '(The TeachScheme Web Page
                    Here you can find:
                    (LectureNotes for Teachers)
                    (Guidance for (DrScheme: a Scheme programming environment))
                    (Exercise Sets)
                    (Solutions for Exercises)
                    For further information: write to scheme@cs)
              'Poo))
(= 4 (occurs2 '(The TeachScheme Web Page
                    Here you can find:
                    (LectureNotes for Teachers)
                    (Guidance for (DrScheme: a Scheme programming environment))
                    (Exercise Sets)
                    (Solutions for Exercises)
                    for further information: you can write to scheme@cs)
              'for))