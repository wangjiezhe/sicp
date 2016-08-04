(load "../helper.ss")

(define (reverse items)
  (let loop ([rem items]
             [res '()])
    (if (null? rem)
        res
        (loop (cdr rem) (cons (car rem) res)))))

(print (reverse (list 1 4 9 16 25)))
;;; => (25 16 9 4 1)
