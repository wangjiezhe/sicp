(load "helper.ss")

;;; Jumps

;;; `call-with-current-continuaion`
(print (+ 1 (call/cc
             (lambda (k)
               (* 2 (k 3))))))

(define r #f)
(print (+ 1 (call/cc
             (lambda (k)
               (set! r k)
               (+ 2 (k 3))))))

(r 5)
(+ 3 (r 5))
(newline)


;;; Escaping continuation
(define list-product
  (lambda (s)
    (let recur ([s s])
      (if (null? s)
          1
          (* (car s) (recur (cdr s)))))))

(print (list-product '(1 2 3 4 5)))
(print (list-product '(0 1 2 3 4)))

(define list-product
  (lambda (s)
    (call/cc
     (lambda (exit)
       (let recur ([s s])
         (if (null? s) 1
             (if (= (car s) 0)
                 (exit 0)
                 (* (car s) (recur (cdr s))))))))))

(print (list-product '(1 2 3 4 5)))
(print (list-product '(0 1 2 3 4)))
(newline)


;;; Tree matching
(define flatten
  (lambda (tree)
    (cond [(null? tree) '()]
          [(pair? (car tree))
           (append (flatten (car tree))
                   (flatten (cdr tree)))]
          [else
           (cons (car tree)
                 (flatten (cdr tree)))])))

(define same-fringe?
  (lambda (tree1 tree2)
    (let loop ([ftree1 (flatten tree1)]
               [ftree2 (flatten tree2)])
      (cond [(and (null? ftree1) (null? ftree2)) #t]
            [(or (null? ftree1) (null? ftree2)) #f]
            [(eqv? (car ftree1) (car ftree2))
             (loop (cdr ftree1) (cdr ftree2))]
            [else #f]))))

(print (same-fringe? '(1 (2 3)) '((1 2) 3)))
(print (same-fringe? '(1 (2 3)) '((1 3) 2)))

(define tree->generator
  (lambda (tree)
    (let ([caller '*])
      (letrec ([generate-leaves
                (lambda ()
                  (let loop ([tree tree])
                    (cond [(null? tree) 'skip]
                          [(pair? tree)
                           (loop (car tree))
                           (loop (cdr tree))]
                          [else
                           (call/cc
                            (lambda (rest-of-tree)
                              (set! generate-leaves
                                    (lambda ()
                                      (rest-of-tree 'resume)))
                              (caller tree)))]))
                  (caller '()))])
        (lambda ()
          (call/cc
           (lambda (k)
             (set! caller k)
             (generate-leaves))))))))

(define same-fringe?
  (lambda (tree1 tree2)
    (let ([gen1 (tree->generator tree1)]
          [gen2 (tree->generator tree2)])
      (let loop ()
        (let ([leaf1 (gen1)]
              [leaf2 (gen2)])
          (if (eqv? leaf1 leaf2)
              (if (null? leaf1) #t (loop))
              #f))))))

(print (same-fringe? '(1 (2 3)) '((1 2) 3)))
(print (same-fringe? '(1 (2 3)) '((1 3) 2)))
(newline)


;;; Coroutines
(define-syntax coroutine
  (syntax-rules ()
    [(_ x body ...)
     (lambda (x)
       (letrec ([+local-control-state
                 (lambda (x)
                   body ...)]
                [resume
                 (lambda (c v)
                   (call/cc
                    (lambda (k)
                      (set! +local-control-state k)
                      (c v))))])
         (lambda (v)
           (+local-control-state v))))]))
