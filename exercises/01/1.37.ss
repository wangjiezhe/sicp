(define (cont-frac n d k)

  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i)
           (+ (d i)
              (iter (+ i 1))))))

  (iter 1))

(define (inverse-phi k)
  (cont-frac (lambda (x) 1.0)
             (lambda (x) 1.0)
             k))

(define (cont-frac n d k)

  (define (iter k res)
    (if (= k 0)
        res
        (iter (- k 1)
              (/ (n k)
                 (+ (d k) res)))))

  (iter k 0))
