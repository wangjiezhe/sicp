(define (make-segment p q) (cons p q))

(define (start-segment l) (car l))

(define (end-segment l) (cdr l))


(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))


(define (midpoint-segment l)
  (make-point (/ (+ (x-point (start-segment l))
                    (x-point (end-segment l)))
                 2)
              (/ (+ (y-point (start-segment l))
                    (y-point (end-segment l)))
                 2)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(define l1
  (make-segment (make-point 1 2)
                (make-point 3 4)))

(print-point (midpoint-segment l1))
;;; => (2,3)
(newline)
