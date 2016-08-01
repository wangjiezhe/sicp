(load "../helper.ss")

(define (fixed-point f first-guess)

  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ([next (f guess)])
      (cond
       [(close-enough? guess next)
        (print guess next)]
       [else
        (print guess)
        (try next)])))

  (try first-guess))

(define (find-root)
  (fixed-point (lambda (x) (/ (log 1000) (log x)))
               2.0))

(define (find-root-damping)
  (fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
               2.0))
