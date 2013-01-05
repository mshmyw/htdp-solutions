;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 16.3.2|) (read-case-sensitive #t) (teachpacks ((lib "dir.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "dir.ss" "teachpack" "htdp")))))
(define mydir (make-dir
               '/home/scourtier/Dropbox/workspace/CPAMA/
               (list
                (make-dir
                 '/home/scourtier/Dropbox/workspace/CPAMA/chap_01
                 empty
                 (list
                  (make-file 'project_07.c~ 213 empty)
                  (make-file 'project_03.c~ 220 empty)
                  (make-file 'exercise_10 11854 empty)
                  (make-file 'project_04 11903 empty)
                  (make-file 'exercise_01 11852 empty))))
               (list (make-file '0393979504.pdf 106838363 empty))))

;; count-lof : list-of-files -> number
;; counts files in list of files
(define (count-lof a-lof)
  (cond
    [ (empty? a-lof) 0]
    [ else (+ 1 (count-lof (rest a-lof)))]))

;; count-lod : list-of-directories -> number
;; counts files in list of directories
(define (count-lod a-lod)
  (cond
    [(empty? a-lod) 0]
    [ else (+ (how-many (first a-lod)) (count-lod (rest a-lod)))]))

;; how-many : dir -> number
;; produces number of files in dir given dir tree
(define (how-many a-dir)
  (+ (count-lod (dir-dirs a-dir)) (count-lof (dir-files a-dir))))
;; test
(= (how-many mydir) 6)