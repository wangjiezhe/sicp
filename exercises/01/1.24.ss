(load "1.22.ss")

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))

(define (search-for-primes-count start count)
  (cond
   [(= count 0) (void)]
   [(fast-prime? start 10)
    (timed-prime-test start)
    (search-for-primes-count (+ start 1) (- count 1))]
   [else (search-for-primes-count (+ start 1) count)]))
