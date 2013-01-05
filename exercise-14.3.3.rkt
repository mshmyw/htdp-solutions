;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 14.3.3|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; A Web-page (short: WP) is either
;; 1. empty;
;; 2. (cons s wp)
;; where s is a symbol and wp is a Web page; or
;; 3. (cons ewp wp)
;; where both ewp and wp are Web pages.

;; replace : symbol symbol WP -> WP
;; replaces all occurences of old with new
(define (replace old new a-wp)
  (cond
    [ (empty? a-wp) empty]
    [ (symbol? (first a-wp))
      (cond
        [ (symbol=? (first a-wp) old)
          (cons new
                (replace old new (rest a-wp)))]
        [else (cons (first a-wp)
                    (replace old new (rest a-wp)))])]
    [ else (cons (replace old new (first a-wp))
                 (replace old new (rest a-wp)))]))
;; test 1
(replace 'for
         'BEENS
         '(The TeachScheme Web Page
               Here you can find:
               (LectureNotes for Teachers)
               (Guidance for (DrScheme: a Scheme programming environment))
               (Exercise Sets)
               (Solutions for Exercises)
               For further information: write to scheme@cs))
;; should yield
'(The TeachScheme Web Page
      Here you can find:
      (LectureNotes BEENS Teachers)
      (Guidance BEENS (DrScheme: a Scheme programming environment))
      (Exercise Sets)
      (Solutions BEENS Exercises)
      For further information: write to scheme@cs)
;; test 2
(replace 'Ace
         'Freely
         '(The TeachScheme Web Page
               Here you can find:
               (LectureNotes for Teachers)
               (Guidance for (DrScheme: a Scheme programming environment))
               (Exercise Sets)
               (Solutions for Exercises)
               for further information: you can write to scheme@cs))
;; should yield
'(The TeachScheme Web Page
      Here you can find:
      (LectureNotes for Teachers)
      (Guidance for (DrScheme: a Scheme programming environment))
      (Exercise Sets)
      (Solutions for Exercises)
      for further information: you can write to scheme@cs)