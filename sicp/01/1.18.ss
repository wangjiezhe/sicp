(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (fast-prod a b)
  (fast-prod-iter a b 0))

(define (fast-prod-iter a b x)
  (cond
   [(= b 0) x]
   [(even? b)
    (fast-prod-iter (double a) (halve b) x)]
   [else (fast-prod-iter a (- b 1) (+ a x))]))
