(load "1.3.1.ss")

(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

(define (integral f a b dx)
  (* (sum f
          (+ a (/ dx 2.0))
          (lambda (x) (+ x dx))
          b)
     dx))


(define (f x y)

  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))

  (f-helper (+ 1 (* y y))
            (- 1 y)))

(define (f x y)
  ((lambda (a b)
     (+ (* x (square a))
       (* y b)
       (* a b)))
   (+ 1 (* y y))
   (- 1 y)))

(define (f x y)
  (let ([a (+ 1 (* y y))]
        [b (- 1 y)])
    (+ (* x (square a))
       (* y b)
       (* a b))))

(define (f x y)
  (define a (+ 1 (* y y)))
  (define b (- y 1))
  (+ (* x (square a))
       (* y b)
       (* a b)))
