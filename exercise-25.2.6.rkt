;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |exercise 25.2.6|) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; general-quick-sort : (X X -> bool) (list X) -> (list X) 
(define (general-quick-sort a-predicate a-list)
  (local ((define (true-items a-list threshold) 
            (filter (lambda (x) (a-predicate x threshold)) a-list))
          (define (false-items a-list threshold) 
            (filter (lambda (x) (not (a-predicate x threshold))) a-list)))
    (cond 
      [(empty? a-list) empty] 
      [(empty? (rest a-list)) a-list]
      [else (append  
             (general-quick-sort a-predicate (true-items a-list (first a-list)))  
             (list (first a-list))
             (general-quick-sort a-predicate (false-items (rest a-list) (first a-list))))])))

;; TESTS
(equal? (general-quick-sort < (list 6 4 9 9 9 3 11 64)) (list 3 4 6 9 9 9 11 64))