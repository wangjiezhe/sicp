(load "../helper.ss")
(load "2.18.ss")                        ; reverse

(define (deep-reverse tree)
  (let loop ([rem tree]
             [res '()])
    (cond [(null? rem) res]
          [(atom? (car rem))
           (loop (cdr rem)
                 (cons (car rem) res))]
          [else
           (loop (cdr rem)
                 (cons (loop (car rem) '()) res))])))


(define x (list (list 1 2) (list 3 4)))
(print x)
;; => ((1 2) (3 4))
(print (reverse x))
;; => ((3 4) (1 2))
(print (deep-reverse x))
;; => ((4 3) (2 1))
