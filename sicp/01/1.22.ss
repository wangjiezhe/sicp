(load "1.2.6.ss")

(define (runtime)
  (get-time (current-time)))

(define (get-time now)
  (+ (time-second now)
     (exact->inexact (/ (time-nanosecond now)
                        (expt 10 9)))))

(define (timed-prime-test n)
  (display n)
  (start-prime-test n (runtime))
  (newline))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes a b)
  (cond
   [(>= a b) (void)]
   [(even? a) (search-for-primes (+ a 1) b)]
   [else (timed-prime-test a)
         (search-for-primes (+ a 2) b)]))

(define (search-for-primes-count start count)
  (cond
   [(= count 0) (void)]
   [(prime? start)
    (timed-prime-test start)
    (search-for-primes-count (+ start 1) (- count 1))]
   [else (search-for-primes-count (+ start 1) count)]))
