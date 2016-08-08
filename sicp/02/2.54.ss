(define (equal? a b)
  (cond [(and (null? a) (null? b)) #t]
        [(or (null? a) (null? b) #f)]
        [(and (atom? a) (atom? b))
         (eq? a b)]
        [(or (atom? a) (atom? b)) #f]
        [else (and (equal (car a) (car b))
                   (equal (cdr a) (cdr b)))]))
