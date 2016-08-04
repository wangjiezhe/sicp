(load "../helper.ss")
(load "2.2.ss")                         ; point & segment system

(define (length l)
  (distance (start-segment l) (end-segment l)))

(define (distance p q)
  (sqrt (+ (square (- (x-point p) (x-point q)))
           (square (- (y-point p) (y-point q))))))

(define (rect-perimeter rect)
  (* (+ (rect-width rect) (rect-length rect)) 2))

(define (rect-area rect)
  (* (rect-width rect) (rect-length rect)))


(define (make-rect p q1 q2) (cons p (cons q1 q2)))

(define (rect-length rect) (distance (car rect) (cadr rect)))

(define (rect-width rect) (distance (car rect) (cddr rect)))

(define A (make-point 1 2))
(define B (make-point 4 2))
(define C (make-point 1 4))
(define rect (make-rect A B C))
(print (rect-perimeter rect))
;;; => 10
(print (rect-area rect))
;;; => 6


(define (make-rect l w) (cons l w))

(define (rect-length rect) (length (car rect)))

(define (rect-width rect) (length (cdr rect)))

(define l1 (make-segment A B))
(define l2 (make-segment A C))
(define rect (make-rect l1 l2))
(print (rect-perimeter rect))
;;; => 10
(print (rect-area rect))
;;; => 6
