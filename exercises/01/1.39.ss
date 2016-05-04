(load "../helper.ss")
(load "1.37.ss")

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (- (square x))))
             (lambda (i)
               (- (* i 2.0) 1.0))
             k))
