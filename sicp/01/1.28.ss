(load "1.2.6.ss")

(define (expmod base exp m)
  (cond
   [(= exp 0) 1]
   [(even? exp)
    (nontrival-sqrt?
     (remainder (square (expmod base (/ exp 2) m))
                m))]
   [else (remainder (* base (expmod base (- exp 1) m))
                    m)]))

(define (nontrival-sqrt? a)
  (if (= a 1)
      0
      a))

(define (miller-rabin-test n)

  (define (try-it a)
    (= (expmod a (- n 1) n) 1))

  (try-it (+ 1 (random (- n 2)))))

(define (fast-prime? n times)
  (cond
   [(= times 0) #t]
   [(miller-rabin-test n) (fast-prime? n (- times 1))]
   [else #f]))
