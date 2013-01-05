;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 16.3.3|) (read-case-sensitive #t) (teachpacks ((lib "dir.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "dir.ss" "teachpack" "htdp")))))
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

;; size-lof : list-of-files -> number
(define (size-lof a-lof)
  (cond
    [ (empty? a-lof) 0]
    [ else (+ (file-size (first a-lof)) (size-lof (rest a-lof)))]))
      

;; size-dir : list-of-directories -> number
;; computes the total size of all files in given directory
(define (size-lod a-lod)
  (cond
    [ (empty? a-lod) 0]
    [ else (+ (du-dir (first a-lod)) (size-lod (rest a-lod)))]))

;; du-dir : dir -> number
;; computes total size of all files in directory tree of given file
(define (du-dir a-dir)
  (+ 1 (size-lod (dir-dirs a-dir)) (size-lof (dir-files a-dir))))
;; test
(= (du-dir mydir) 106874407)