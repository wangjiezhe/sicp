(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame fr) (car fr))
(define (edge1-frame fr) (cadr fr))
(define (edge2-frame fr) (caddr fr))


(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (edge2-frame fr) (cddr fr))
