(define (make-segment v w)
  (cons v w))

(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))
