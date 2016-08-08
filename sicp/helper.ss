(define (print . vs)
  (for-each (lambda (x)
              (display x)
              (newline))
            vs))

(define (build x y)
  (cons x (cons y '())))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

(define (cube x) (* x x x))

(define tolerance 0.000001)

(define (inc x)
  (+ x 1))

(define nil '())
