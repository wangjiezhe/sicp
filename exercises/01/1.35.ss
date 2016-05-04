(load "../../content/01/1.3.3.ss")

(define phi
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               1.0))
