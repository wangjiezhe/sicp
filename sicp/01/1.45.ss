(load "1.3.4.ss")                       ; average-damp
(load "1.36.ss")                        ; fixed-point
(load "1.43.ss")                        ; repeated

(define (average-damp-n f n)
  ((repeated average-damp n) f))

(define (n-root-m x n m)
  (fixed-point (average-damp-n (lambda (y) (/ x (n-power y (- n 1)))) m)
               1.0))
;;; => m should be no smaller than ⌊log₂n⌋

(define (n-power x n)
  ((repeated (lambda (s) (* s x)) n) 1))

(define (n-root x n)
  (n-root-m x n (floor (log2 n))))

(define (log2 n)
  (/ (log n) (log 2)))
