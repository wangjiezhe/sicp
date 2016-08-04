(load "../helper.ss")

(define (same-parity a . w)
  (cons a
        (let loop ([o w])
          (cond [(null? o) '()]
                [(even? (- a (car o)))
                 (cons (car o) (loop (cdr o)))]
                [else (loop (cdr o))]))))


(print (same-parity 1 2 3 4 5 6 7))
;;; => (1 3 5 7)
(print (same-parity 2 3 4 5 6 7))
;;; => (2 4 6)
