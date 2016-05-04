(define (sum term a next b)

  (define (iter a res)
    (if (> a b)
        res
        (iter (next a) (+ (term a) res))))

  (iter a 0))
