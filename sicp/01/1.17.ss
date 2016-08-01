(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (fast-prod a b)
  (cond
   [(= b 0) 0]
   [(even? b) (* (double a) (halve b))]
   [else (+ a (fast-prod a (- b 1)))]))
