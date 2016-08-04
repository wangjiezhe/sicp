(define zero
  (lambda (f)
    (lambda (x)
      x)))

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))


;;; (0 f) => (λ (x) x)
;;; ((0 f) x) => x
(define one
  (lambda (f)
    (lambda (x)
      (f x))))

;;; (1 f) => (λ (x) (f x))
;;; ((1 f) x) => (f x)
(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))


;;; (n f) => (λ (x) (fⁿ x))
;;; ((n f) x) => (fⁿ x)
(define (add n m)
  (lambda (f)
    (lambda (x)
      ((m f) ((n f) x)))))
