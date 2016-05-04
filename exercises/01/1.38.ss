(load "1.37.ss")

(define (get-e k)
  (+ 2
     (cont-frac (lambda (x) 1.0)
                (lambda (x)
                  (if (= (remainder x 3) 2)
                      (* (/ (+ x 1) 3) 2.0)
                      1.0))
                k)))

(define e (get-e 100))
