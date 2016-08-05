(load "../helper.ss")

(define (repeated f n)
  (lambda (x)
    (if (> n 0)
        ((repeated f (- n 1)) (f x))
        x)))

((repeated square 2) 5)
;;; => 625
