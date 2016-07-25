(load "helper.ss")
(load "5.ss")

;;; Recursion

(define factorial
  (lambda (n)
    (if (= n 0) 1
        (* n (factorial (- n 1))))))


;;; `letrec'

(letrec ([local-even? (lambda (n)
                        (if (= n 0) #t
                            (local-odd? (- n 1))))]
         [local-odd? (lambda (n)
                       (if (= n 0) #f
                           (local-even? (- n 1))))])
  (print (list (local-even? 23) (local-odd? 23))))

(newline)


;;; Named `let'

(letrec ([countdown (lambda (i)
                      (if (= i 0) 'liftoff
                          (begin
                            (print i)
                            (countdown (- i 1)))))])
  (countdown 10))

(let countdown ([i 10])
  (if (= i 0) 'liftoff
      (begin
        (print i)
        (countdown (- i 1)))))

(newline)


;;; Iteration

(define list-position
  (lambda (o l)
    (let loop ([i 0] [l l])
      (if (null? l) #f
          (if (eqv? (car l)o) i
              (loop (+ i 1) (cdr l)))))))

(define s '(1 2 3 4 5))
(print s)
(print (list-position 3 s))

(define reverse!
  (lambda (s)
    (let loop ([s s] [r '()])
      (if (null? s) r
          (let ([d (cdr s)])
            (set-cdr! s r)
            (loop d s))))))

(print (reverse! s))
(print s)


;;; Mapping a procedure across a list

(print (map add2 '(1 2 3)))

(for-each display
          (list "one " "two " "buckle my shoe"))
(newline)

(print (map cons '(1 2 3) '(10 20 30)))
(print (map + '(1 2 3) '(10 20 30)))
