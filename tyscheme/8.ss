(load "helper.ss")

;;; Macros
(define-syntax when
  (syntax-rules ()
    [(_ test branch ...)
     (if test (begin branch ...))]))

(when (< 1 2)
      (print #\<)
      (print #\1 #\2))

(define-syntax unless
  (syntax-rules ()
    [(_ test branch ...)
     (when (not test) branch ...)]))
