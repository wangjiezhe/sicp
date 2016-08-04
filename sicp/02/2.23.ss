(define (for-each proc items)
  (cond [(null? items) ]
        [else
         (proc (car items))
         (for-each proc (cdr items))]))


(for-each (lambda (x) (display x) (newline))
          (list 57 321 88))
;;; =>
;; 57
;; 321
;; 88
