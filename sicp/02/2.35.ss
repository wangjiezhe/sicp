(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x)
                     (if (atom? x)
                         1
                         (count-leaves x)))
                   t)))
