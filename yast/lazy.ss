;;; lazy evaluation

(define lazy-car car)

(define (lazy-cdr ls)
  (force (cdr ls)))

(define-syntax lazy-cons
  (syntax-rules ()
    [(_ a b)
     (cons a (delay b))]))

(define (lazy-map fn . lss)
  (if (memq '() lss)
      '()
      (lazy-cons (apply fn (map lazy-car lss))
                 (apply lazy-map fn (map lazy-cdr lss)))))

(define (lazy-filter pred ls)
  (if (null? ls)
      '()
      (let ([obj (lazy-car ls)])
        (if (pred obj)
            (lazy-cons obj (lazy-filter pred (lazy-cdr ls)))
            (lazy-filter pred (lazy-cdr ls))))))

(define (lazy-ref ls n)
  (if (zero? n)
      (lazy-car ls)
      (lazy-ref (lazy-cdr ls) (1- n))))

(define (head ls n)
  (if (zero? n)
      '()
      (cons (lazy-car ls) (head (lazy-cdr ls) (1- n)))))
