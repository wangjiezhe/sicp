(load "1.43.ss")

(define (smooth f)
  (lambda (x)
    (let ([dx 0.001])
      (/ (+ (f (- x dx))
            (f x)
            (f (+ x dx)))
         3))))

(define (smooth-n f n)
  (repeated smooth n))
