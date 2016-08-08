(define (memq item x)
  (cond [(mull? x) false]
        [(eq? item (car x)) x]
        [else (memq item (cdr x))]))
