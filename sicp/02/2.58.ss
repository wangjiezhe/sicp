(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))
(define (addend s) (car s))
(define (make-sum a1 a2)
  (cond [(=number? a1 0) a2]
        [(=number? a2 0) a1]
        [(and (number? a1) (number? a2)) (+ a1 a2)]
        [else `(,a1 + ,a2)]))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))
(define (multiplier p) (car p))
(define (make-product m1 m2)
  (cond [(or (=number? m1 0) (=number? m2 0)) 0]
        [(=number? m1 1) m2]
        [(=number? m2 1) m1]
        [(and (number? m1) (number? m2)) (* m1 m2)]
        [else `(,m1 * ,m2)]))

(print (deriv '(x + (3 * (x + (y + 2)))) 'x))
;;; => 4


(define (sum? x)
  (and (pair? x) (memq '+ x)))

(define (addend s)
  (let ([t (front-of s '+)])
    (if (null? (cdr t))
        (car t)
        t)))

(define (front-of l x)
  (if (eq? x (car l))
      '()
      (cons (car l) (front-of (cdr l) x))))

(define (augend s)
  (let ([t (cdr (memq '+ s))])
    (if (null? (cdr t))
        (car t)
        t)))

(define (multiplicand p)
  (if (null? (cdddr p))
      (caddr p)
      (cddr p)))

(print (deriv '(x + 3 * (x + y + 2)) 'x))
;;; => 4
(print (deriv '(x + 3 * (y + 3 + x * 2 * x) + x * x) 'x))
;;; => (1 + ((3 * ((x * 2) + (2 * x))) + (x + x)))
