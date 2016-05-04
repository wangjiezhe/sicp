(load "1.22.ss")

(define (find-divisor n test-divisor)
  (cond
   [(> (square test-divisor) n) n]
   [(divides? test-divisor n) test-divisor]
   [else (find-divisor n (next test-divisor))]))

(define (next x)
  (if (= x 2)
      3
      (+ x 2)))
