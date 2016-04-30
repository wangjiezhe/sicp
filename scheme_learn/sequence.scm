;;; Sequence

(load "lazy.scm")

;;; infinite sequence represented by a_(n+1) = f(a_n)
(define (inf-seq a0 f)
  (lazy-cons a0 (inf-seq (f a0) f)))

;;; arithmetic sequence
(define (ari a0 d)
  (inf-seq a0 (lambda (x) (+ x d))))

;;; geometric sequence
(define (geo a0 r)
  (inf-seq a0 (lambda (x) (* x r))))


;;; fibonacci sequence
(define fib
  (lazy-cons 1
             (lazy-cons 1
                        (lazy-map + fib (lazy-cdr fib)))))
