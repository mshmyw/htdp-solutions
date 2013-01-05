(define CM-PER-IN 2.54)
(define IN-PER-FT 12)
(define FT-PER-YD 3)
(define YD-PER-RD (+ 5 (/ 1 2)))
(define RD-PER-FL 40)
(define FL-PER-MI 8)

(define (inches->cm in)
  (* in CM-PER-IN))

(define (feet->inches ft)
  (* ft IN-PER-FT))

(define (yards->feet yd)
  (* yd FT-PER-YD))

(define (rods->yards rd)
  (* rd YD-PER-RD))

(define (furlongs->rods fl)
  (* fl RD-PER-FL))

(define (miles->furlongs mi)
  (* mi FL-PER-MI))

(define (feet->cm ft)
  (inches->cm (feet->inches ft)))

(define (yards->cm yd)
  (feet->cm (yards->feet yd)))

(define (rods->inches rd)
  (feet->inches (yards->feet (rods->yards rd))))

(define (miles->feet mi)
  (yards->feet (rods->yards (furlongs->rods (miles->furlongs mi)))))