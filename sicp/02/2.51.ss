(define (below painter1 painter2)
  (let* ([split-point (make-vect 0.0 0.5)]
         [paint-down
          (transform-painter painter1
                             (make-vect 0.0 0.0)
                             (make-vect 1.0 0.0)
                             split-point)]
         [paint-up
          (transform-painter painter
                             split-point
                             (make-vect 1.0 0.5)
                             (make-vect 0.0 1.0))])))

(define (below painter1 painter2)
  (rotate90 (beside (rotate270 painter1)
                    (rotate270 painter2))))
