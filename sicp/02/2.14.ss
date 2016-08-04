(load "../helper.ss")                   ; print
(load "2.1.4.ss")
(load "2.7.ss")                         ; make-interval
(load "2.12.ss")                        ; make-interval-percent

(define r1 (make-center-percent 2 1))
(define r2 (make-center-percent 3 1))

(define (print-interval-percent x)
  (display (center x))
  (display " ± ")
  (display (percent x))
  (display "%")
  (newline))

(print-interval-percent r1)
;;; => 2 ± 1%
(print-interval-percent r2)
;;; => 3 ± 1%

(print-interval-percent (par1 r1 r2))
;;; => 1.2004800480048003 ± 2.999200239928008%
(print-interval-percent (par2 r1 r2))
;;; => 1.2000000000000002 ± 0.9999999999999916%

(print-interval-percent (div-interval r1 r1))
;;; => 1.0002000200020003 ± 1.9998000199980077%
(print-interval-percent (div-interval r1 r2))
;;; => 0.6668000133346668 ± 1.9998000199979908%
