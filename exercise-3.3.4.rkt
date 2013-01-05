(define PI 3.14)

(define (area-pipe ir l t)
  (+ (area-inner-length ir l) (area-outer-length ir l t) (* 2 (area-end ir t))))

(define (area-inner-length ir l)
  (area-length ir l))

(define (area-outer-length ir l t)
  (area-length (+ ir t) l))

(define (area-end ir t)
  (- (area-circle (+ ir t)) (area-circle ir)))

(define (area-length r l)
  (* 2 PI r l))

(define (area-circle r)
  (* PI r r))