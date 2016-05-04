(load "../../content/01/1.2.5.ss")
(load "../../content/01/1.2.6.ss")
(load "../../content/01/1.3.1.ss")

(define (filtered-accumulate accumulate filter? null-value
                             term a next b)
  (cond
   [(> a b) null-value]
   [(filter? a)
    (accumulate (term a)
                (filtered-accumulate accumulate filter? null-value
                                     term (next a) next b))]
   [else (filtered-accumulate accumulate filter? null-value
                              term (next a) next b)]))


(define (sum-primes a b)
  (filtered-accumulate + prime? 0 identity a inc b))

(define (product-coprime n)

  (define (filter? x)
    (= (gcd x n) 1))

  (filtered-accumulate * filter? 1 identity 1 inc n))
