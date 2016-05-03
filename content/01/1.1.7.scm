(load "1.1.4.scm")                      ; square

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (imporve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
