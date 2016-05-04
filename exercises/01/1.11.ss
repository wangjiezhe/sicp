(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (f-iter a b c n)
  (cond
   [(= n 0) c]
   [(= n 1) b]
   [(= n 2) a]
   [else (f-iter (+ a (* 2 b) (* 3 c)) a b (- n 1))]))

(define (f n)
  (f-iter 2 1 0 n))
