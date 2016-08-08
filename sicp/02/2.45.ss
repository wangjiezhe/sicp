(define right-split (split beside below))
(define up-split (split below beside))

(define (split op1 op2)
  (letrec ([iter
            (lambda (painter)
              (if (= n 0)
                  painter
                  (let ([smaller (iter painter (- n 1))])
                    (op1 painter (op2 smaller smaller)))))]))
  iter)
