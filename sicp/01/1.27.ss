(load "1.2.6.ss")

(define (fermat-test? n)
  (fermat-test-iter? n 0))

(define (fermat-test-iter? n a)
  (cond
   [(= n a) #t]
   [(= (expmod a (- n 1) n) 1)
    (fermat-test-iter? n (+ a 1))]
   [else #f]))
