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

(pasca-triangle 10)
;;; =>
;; (1)
;; (1 1)
;; (1 2 1)
;; (1 3 3 1)
;; (1 4 6 4 1)
;; (1 5 10 10 5 1)
;; (1 6 15 20 15 6 1)
;; (1 7 21 35 35 21 7 1)
;; (1 8 28 56 70 56 28 8 1)
;; (1 9 36 84 126 126 84 36 9 1)
;; (1 10 45 120 210 252 210 120 45 10 1)
