(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (max-integer-power p n)
  (let loop ([e 0]
             [p-to-e p])
    (if (= (remainder n p-to-e) 0)
        (loop (+ e 1) (* p-to-e p))
        e)))

(define (car z)
  (max-integer-power 2 z))

(define (cdr z)
  (max-integer-power 3 z))

(define t (cons 1 2))
(print (car t))
;;; => 1
(print (cdr t))
;;; => 2
