(load "../helper.ss")

(define (iterative-improve good-enough? improve-method)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        ((iterative-improve good-enough? improve-method) (improve-method guess)))))

(define (sqrt x)
  ((iterative-improve
    (lambda (guess)
      (< (abs (- (square guess) x)) tolerance))
    (lambda (guess)
      (average guess (/ x guess))))
   1.0))

(define (fixed-point f first-guess)
  (f ((iterative-improve
       (lambda (guess)
         (< (abs (- guess (f guess))) tolerance))
       (lambda (guess)
         (f guess)))
      1.0)))
