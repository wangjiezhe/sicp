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

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) 0.0001))

(define phi-inverse
  (/ (- (sqrt 5) 1) 2))

(let loop ([k 1])
  (if (close-enough? (inverse-phi k) phi-inverse)
      (print k)
      (loop (+ k 1))))
;;; => 10
