;;; Continuation-Passing-Styel (CPS)

;;; normal factorial
(define (fact n)
  (if (= n 1)
      1
      (* n (fact (1- n)))))

;;; CPS factorial
(define (kfact n k)
  (if (= n 1)
      (k 1)
      (kfact (- n 1) (lambda (x) (k (* n x))))))


;;; normal product
(define (product ls)
  (let loop ([ls ls] [acc 1])
    (cond
     [(null? ls) acc]
     [(zero? (car ls)) 0]
     [else (loop (cdr ls) ((* (car ls) acc)))])))

;;; CPS product
(define (kproduct ls k)
  (let ([break k])
    (let loop ([ls ls] [k k])
      (cond
       [(null? ls) (k 1)]
       [(zero? (car ls)) (break 0)]
       [else (loop (cdr ls) (lambda (x) (k (* (car ls) x))))]))))


;;; exception handling
(define (non-number-value-error x)
  (display "Value error: ")
  (display x)
  (display " is not number.")
  (newline)
  'error)

(define (kproduct ls k k-value-error)
  (let ([break k])
    (let loop ([ls ls] [k k])
      (cond
       [(null? ls) (k 1)]
       [(not (number? (car ls))) (k-value-error (car ls))]
       [(zero? (car ls)) (break 0)]
       [else (loop (cdr ls) (lambda (x) (k (* (car ls) x))))]))))
