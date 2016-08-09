(define (exponentiation? x)
  (and (pair? x) (eq? (car x) 'expt)))
(define (base x) (cadr x))
(define (exponent x) (caddr x))
(define (make-exponentiation m n)
  (cond [(=number? n 0) 1]
        [(=number? n 1) m]
        [(and (number? m) (number? n)) (expt m n)]
        [else `(expt ,m ,n)]))

(define (deriv exp var)
  (cond [(number? exp) 0]
        [(varaible? exp)
         (if (same-variable? exp var) 1 0)]
        [(sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var))]
        [(product? exp)
         (make-sum (make-product (multiplier exp)
                                 (deriv (multiplicand exp) var))
                   (make-product (deriv (multiplier exp) var)
                                 (multiplicand exp)))]
        [(exponentiation? exp)
         (make-product
          (make-product (exponent exp)
                        (make-exponentiation (base exp) (- (exponent exp) 1)))
          (deriv (base exp) var))]
        [else
         (error "unknow expression type -- DERIV" exp)]))

(print (deriv '(+ (* 3 (expt x 2)) 1) 'x))
;;; => (* 3 (* 2 x))
