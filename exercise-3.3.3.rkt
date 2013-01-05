(define PI 3.14)

(define (area-cylinder r h)
  (+ (area-side r h) (* 2 (area-end r))))

(define (area-side r h)
  (* 2 PI r h))

(define (area-end r)
  (* PI r r))