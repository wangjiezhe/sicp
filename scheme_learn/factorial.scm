;;; different method to define factorial

;;; recursion
(define (fact n)
  (if (= n 1)
      1
      (* n (fact (1- n)))))

;;; tail recursion
(define (fact-rec n p)
  (if (= n 1)
      p
      (let ([m (1- n)])
        (fact-rec m (* p m)))))

(define (fact-tail n)
  (fact-rec n n))

;;; named let
(define (fact-let n)
  (let loop ([n1 n] [p n])
    (if (= n1 1)
        p
        (let ([m (1- n)])
          (loop m (* p m))))))

;;; letrec <-> tail recusion
(define (fact-letrec n)
  (letrec ([iter (lambda (n1 p)
                   (if (= n1 1)
                       p
                       (let ([m (1- n)])
                         (iter m (* p m)))))])
    (iter n n)))

;;; do <-> named let
(define (fact-do n)
  (do ([n1 n (1- n1)] [p n (1- n1)])
      ((= n1 1) p)))
