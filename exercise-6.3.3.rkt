;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 6.3.3|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp")))))
(define-struct jet-fighter (designation
                            acceleration
                            top-speed
                            range))

(define (within-range fighter-record target-distance)
  (cond
    [(<= target-distance
         (jet-fighter-range fighter-record))
     'WithinRange]
    [else 'NotWithinRange]))

(define (reduce-range fighter-record)
  (make-jet-fighter (jet-fighter-designation fighter-record)
                    (jet-fighter-acceleration fighter-record)
                    (jet-fighter-top-speed fighter-record)
                    (* 0.80 (jet-fighter-range fighter-record))))