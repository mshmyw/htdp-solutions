;; cost : number -> number
;; to compute the costs, given ticket-price
;; example: For ticket prices of 3.00, 4.00, and 5.00, the resulting
;; number of attendees should be 196.80, 190.80, and 184.80, respectively.
(define (cost ticket-price) ...)

;; revenue : number -> number
;; to compute the revenue, given ticket-price
;; example: For ticket prices of 3.00, 4.00, and 5.00, the resulting
;; revenue should be 1260.00, 1080.00, and 600.00, respectively.
(define (revenue ticket-price) ...)

;; profit : number -> number
;; to compute the profit as the difference between revenue and costs
;; at some given ticket-price
;; example: For ticket prices of 3.00, 4.00, and 5.00, the resulting
;; profit should be 1063.20, 889.20, and 415.20, respectively.
(define (profit ticket-price) ...)