(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define t (cons 1 2))
(print (car t))
;;; => 1
(print (cdr t))
;;; => 2
