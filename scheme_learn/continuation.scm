;;; Continuation

(define (find-leaf obj tree)
  (call/cc
   (lambda (cc)
     (letrec ([iter
               (lambda (tree)
                 (cond
                  [(null? tree) #f]
                  [(pair? tree)
                   (iter (car tree))
                   (iter (cdr tree))]
                  (else
                   (if (eqv? obj tree)
                       (cc obj)))))])
       (iter tree)))))


(define-syntax block
  (syntax-rules ()
    [(_ tag e1 ...)
     (call-with-current-continuation
      (lambda (tag)
        e1 ...))]))
