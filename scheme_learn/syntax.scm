;;; macros

(define-syntax when
  (syntax-rules ()
    [(_ pred b1 ...)
     (if pred (begin b1 ...))]))

(define-syntax while
  (syntax-rules ()
    [(_ pred b1 ...)
     (let loop ()
       (when pred b1 ...))]))

(define-syntax for
  (syntax-rules ()
    [(_ (i from to) b1 ...)
     (let loop ([i from])
       (when (< i to)
             b1 ...
             (loop (1+ i))))]
    [(_ (i from to step) b1 ...)
     (let loop ([i from])
       (when (< i to)
             b1 ...
             (loop (+ i step))))]))

(define-syntax if-not
  (syntax-rules ()
    [(_ pred b1 ...)
     (if pred #f (begin b1 ...))]))


(define-syntax my-and
  (syntax-rules ()
    [(_) #t]
    [(_ e) e]
    [(_ e1 e2 ...)
     (if e1
         (my-and e2 ...)
         #f)]))

(define-syntax my-or
  (syntax-rules ()
    [(_) #f]
    [(_ e) e]
    [(_ e1 e2 ...)
     (if e1
         e1
         (my-or e2 ...))]))

(define-syntax my-let*
  (syntax-rules ()
    [(_ ([p v]) b ...)
     (let ([p v]) b ...)]
    [(_ ([p1 v1] [p2 v2] ...) b ...)
     (let ([p1 v1])
       (my-let* ([p2 v2] ...) b ...))]))

(define-syntax my-cond
  (syntax-rules (else)
    [(_ (else e1 ...))
     (begin e1 ...)]
    [(_ (e1 e2 ...))
     (when e1 e2 ...)]
    [(_ (e1 e2 ...) c1 ...)
     (if e1
         (begin e2 ...)
         (cond c1 ...))]))
