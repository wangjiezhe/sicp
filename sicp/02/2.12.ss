(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100))))

(define (percent i)
  (*  (/ (width i) (center i)) 100))
