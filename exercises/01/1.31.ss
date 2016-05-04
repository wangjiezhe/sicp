(load "../../content/01/1.3.1.ss")

(define (product f a next b)
  (if (> a b)
      1
      (* (f a)
         (product f (next a) next b))))

(define (factorial n)
  (product identity 1 inc n))

(define (get-pi n)

  (define (pi-f x)
    (/ (* (- x 1.0) (+ x 1.0))
       (* x x)))

  (define (pi-next x)
    (+ x 2))

  (* 4.0 (product pi-f 3 pi-next n)))

(define (product f a next b)

  (define (iter a res)
    (if (> a b)
        res
        (iter (next a) (* (f a) res))))

  (iter a 1))
