;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 16.3.4|) (read-case-sensitive #t) (teachpacks ((lib "dir.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "dir.ss" "teachpack" "htdp")))))
(define mydir (make-dir
               'CPAMA
               (list
                (make-dir
                 'chap_01
                 empty
                 (list
                  (make-file 'project_07.c~ 213 empty)
                  (make-file 'project_03.c~ 220 empty)
                  (make-file 'exercise_10 11854 empty)
                  (make-file 'project_04 11903 empty)
                  (make-file 'exercise_01 11852 empty)))
                (make-dir
                 'test
                 empty
                 (list (make-file 'exercise_01 11852 empty))))
               (list (make-file '0393979504.pdf 106838363 empty))))

;; in-lof? : symbol lof -> boolean
;; determine whether a file is present in a given lof
(define (in-lof? s a-lof)
  (cond
    [ (empty? a-lof) false]
    [ else (or (symbol=? (file-name (first a-lof)) s)
               (in-lof? s (rest a-lof)))]))

;; in-lod? : symbol lod -> boolean
;; determines whether a file is present in a given lod
(define (in-lod? s a-lod)
  (cond
    [ (empty? a-lod) false]
    [ else (or (find? s (first a-lod)) (in-lod? s (rest a-lod)))]))

;; find? : symbol dir -> boolean
;; deteremines if given file name is present in dir tree
(define (find? s a-dir)
  (or (in-lod? s (dir-dirs a-dir)) (in-lof? s (dir-files a-dir))))
;; test:
(boolean=? (find? 'project_04 mydir) true)
(boolean=? (find? 'project_23 mydir) false)

;; A list-of-paths is either
;; 1. empty or
;; 2. (cons p lop)
;; where p is a path and lop is a list of paths.

;; add-to-lop : symbol list-of-paths -> list-of-paths
;; adds given symbol to the beggining of each path in given list
(define (add-to-lop s a-lop)
  (cond
    [ (empty? a-lop) a-lop]
    [ else  (cons (cons s (first a-lop))
                  (add-to-lop s (rest a-lop)))]))

;; find-in-lop : s list-of-paths -> list-of-paths
;; produces a list of paths that lead to given file
(define (find-in-lop s a-lop)
  (cond
    [ (empty? a-lop) empty]
    [ (false? (find? s (first a-lop)))
      (find-in-lop s (rest a-lop))]
    [ else (append (find s (first a-lop))
                   (find-in-lop s (rest a-lop)))]))
;; find : symbol dir -> list-of-paths or false
;; produces a list-of-paths to a given file if present, else false
(define (find s a-dir)
  (cond
    [ (in-lof? s (dir-files a-dir))
      (cond
        [ (in-lod? s (dir-dirs a-dir))
          (append (list (dir-name a-dir))
                  (add-to-lop (dir-name a-dir (find-in-lop s (dir-dirs a-dir)))))]
        [ else (list (list (dir-name a-dir)))])]
    [ (in-lod? s (dir-dirs a-dir)) (add-to-lop (dir-name a-dir)
                                               (find-in-lop s (dir-dirs a-dir)))]
    [ else false]))

;; clean-find : list-of-paths or false -> path list-of-paths or false
(define (clean-find s a-lop)
  (cond
    [ (false? (find s a-lop)) false]
    [ (empty? (rest (find s a-lop))) (first (find s a-lop))]
    [ else (find s a-lop)]))
;;tests:
(boolean=? (find 'poo mydir) false)
(clean-find 'exercise_01 mydir) ;; should yield:
(list (list 'CPAMA
            'chap_01)
      (list 'CPAMA
            'test))
(clean-find 'exercise_10 mydir) ;; should yield:
(list 'CPAMA
            'chap_01)