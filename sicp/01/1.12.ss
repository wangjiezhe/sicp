(define (pasca-location line position)
  (cond
   [(= position 1) 1]
   [(= position line) 1]
   [else (+ (pasca-location (- line 1) (- position 1))
            (pasca-location (- line 1) position))]))

(define (pasca-line line)
  (pasca-line-iter line 1 '()))

(define (pasca-line-iter line position res)
  (if (> position line)
      res
      (pasca-line-iter line
                       (+ position 1)
                       (cons (pasca-location line position) res))))

(define (pasca-triangle line)
  (pasca-triangle-iter (+ line 1) 1))

(define (pasca-triangle-iter line count)
  (cond
   [(> count line) (void)]
   [else (display (pasca-line count))
         (newline)
         (pasca-triangle-iter line (+ count 1))]))
