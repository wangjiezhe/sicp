(define (atom? x)
  (and (not (pair? x))
       (not (null? x))))

(define (display-all . vs)
  (for-each (lambda (x)
              (display x)
              (newline))
            vs))

(define (build x y)
  (cons x (cons y '())))
