(define (fringe tree)
  (let loop ([rem tree]
             [res '()])
    (cond [(null? rem) res]
          [(atom? (car rem))
           (loop (cdr rem)
                 (append res (list (car rem))))]
          [else
           (loop (cdr rem)
                 (append res (loop (car rem) '())))])))

(define x (list (list 1 2) (list 3 4)))
(print (fringe x))
;; => (1 2 3 4)
(print (fringe (list x x)))
;; => (1 2 3 4 1 2 3 4)
