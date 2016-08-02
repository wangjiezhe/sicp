(load "../helper.ss")
(load "1.3.3.ss")
(load "1.3.4.ss")

(define (cubic a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x )
       c)))

(define (cubic-root a b c)
  (newton-method (cubic a b c) 1.0))
