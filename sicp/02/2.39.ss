(define (reverse sequence)
  (fold-right (lambda (x y)
                (append y (list x)))
              nil sequence))

(print (reverse '(1 2 3)))
;;; => (3 2 1)

(define (reverse sequence)
  (fold-left (lambda (x y)
                (cons y x))
              nil sequence))

(print (reverse '(1 2 3)))
;;; => (3 2 1)
