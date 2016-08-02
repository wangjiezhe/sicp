(load "../helper.ss")

(define (double f)
  (lambda (x)
    (f (f x))))

(((double (double double)) inc) 5)
;;; => 21 (= 5 + (2 ^ 2) ^ 2)
