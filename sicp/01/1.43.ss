(load "../helper.ss")

(define (repeated f n)
  (lambda (x)
    (if (> n 1)
        ((repeated f (- n 1)) (f x))
        (f x))))

((repeated square 2) 5)
;;; => 625
