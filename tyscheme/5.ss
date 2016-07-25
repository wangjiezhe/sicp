(load "helper.ss")

;;; Lexical variables

(define x 9)
(define add2 (lambda (x) (+ x 2)))

(print x)
(print (add2 3))
(print (add2 x))
(print x)
(newline)


(set! x 20)

(define add2
  (lambda (x)
    (set! x (+ x 2))
    x))

(print (add2 x))
(print x)
(newline)


(define counter 0)

(define bump-counter
  (lambda ()
    (set! counter (+ counter 1))
    counter))

(print (bump-counter))
(print (bump-counter))
(print (bump-counter))
(newline)


;;; `let' and `let*'

(let ([x 1]
      [y 2]
      [z 3])
  (print (list x y z)))

(let ([x 1]
      [y x])
  (print (+ x y)))

(let* ([x 1]
       [y x])
  (print (+ x y)))

(let ([cons (lambda (x y) (+ x y))])
  (print (cons 1 2)))

(newline)


;;; `fluid-let'

(fluid-let ([counter 99])
  (print (bump-counter))
  (print (bump-counter))
  (print (bump-counter))
  )

(let ([counter 99])
  (print (bump-counter))
  (print (bump-counter))
  (print (bump-counter))
  )

(print counter)
