(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch st) (car st))

(define (right-branch st) (cadr st))

(define (branch-length br) (car br))

(define (branch-structure br) (cadr br))

(define (total-weight st)
  (if (atom? st)
      st
      (+ (total-weight (branch-structure (left-branch st)))
         (total-weight (branch-structure (right-branch st))))))

(define (balance? st)
  (if (atom? st)
      #t
      (and
       (= (branch-moment (left-branch st))
          (branch-moment (right-branch st)))
       (balance? (branch-structure (left-branch st)))
       (balance? (branch-structure (right-branch st))))))

(define (branch-moment br)
  (* (total-weight (branch-structure br))
     (branch-length br)))


(define a '((2 3) (3 2)))
(define b '((2 3) (3 ((1 2) (2 1)))))
(define c '((3 3) (3 ((1 2) (2 1)))))

(print (balance? a))
;;; => #t
(print (balance? b))
;;; => #f
(print (balance? c))
;;; => #t


(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch st) (car st))

(define (right-branch st) (cdr st))

(define (branch-length br) (car br))

(define (branch-structure br) (cdr br))


(define a (cons (cons 2 3) (cons 3 2)))
(define b (cons (cons 2 3) (cons 3 (cons (cons 1 2) (cons 2 1)))))
(define c (cons (cons 3 3) (cons 3 (cons (cons 1 2) (cons 2 1)))))

(print (balance? a))
;;; => #t
(print (balance? b))
;;; => #f
(print (balance? c))
;;; => #t
