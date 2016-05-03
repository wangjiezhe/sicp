(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter iter x)
  (if (good-enough? iter x)
      iter
      (cube-root-iter (improve iter x) x)))

(define (improve y x)
  (/ (+ (/ x (* y y))
        (* 2 y))
     3))

(define (good-enough? iter x)
  (< (abs (- (cube iter) x)) 0.000001))

(define (cube x)
  (* x x x))
