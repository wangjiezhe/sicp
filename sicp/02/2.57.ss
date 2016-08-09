(define (augend s)
  (if (null? (cdddr s))
      (caddr s)
      `(+ ,@(cddr s))))

(define (multiplicand p)
  (if (null? (cdddr p))
      (caddr p)
      `(* ,@(cddr p))))

(print (deriv '(* x y (+ x 3)) 'x))
;;; => (+ (* x y) (* y (+ x 3)))
