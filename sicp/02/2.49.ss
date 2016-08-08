(define (points->segment x1 y1 x2 y2)
  (make-segment (make-vect x1 y1)
                (make-vect x2 y2)))

(define border
  (segments->painter
   (map points->segment
        '((0 0 1 0)
          (0 0 0 1)
          (1 0 1 1)
          (0 1 1 1)))))

(define X
  (segments->painter
   (map points->segment
        '((0 0 1 1)
          (1 0 0 1)))))

(define diamond
  (segments->painter
   (map points->segment
        '((0 0.5 0.5 0)
          (0.5 0 1 0.5)
          (1 0.5 0.5 1)
          (0.5 1 0 0.5)))))
