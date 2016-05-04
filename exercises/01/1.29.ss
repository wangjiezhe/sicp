(load "../../content/01/1.3.1.ss")

(define (simpson-integral f a b n)

  (define h (/ (- b a) n))

  (define (coeffienct k)
    (cond
     [(or (= k 0) (= k n)) 1]
     [(even? k) 2]
     [else 4]))

  (define (simpson-term k)
    (* (coeffienct k)
       (f (+ a (* k h)))))

  (* (/ h 3.0)
     (sum simpson-term 0 inc n)))
