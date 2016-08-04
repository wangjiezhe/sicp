(load "../helper.ss")

(define one-through-four (list 1 2 3 4))

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define squares (list 1 4 9 16 25))

(print (list-ref squares 3))
;;; => 16

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define odds (list 1 3 5 7))

(print (length odds))
;;; => 4

(define (length items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

(define (apppend list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(print (append squares odds))
;;; => (1 4 9 16 25 1 3 5 7)


(define (scale-list items factor)
  (if (null? items)
      '()
      (cons (* (car items) factor)
            (scale-list (cdr items) factor))))

(print (scale-list (list 1 2 3 4 5) 10))
;;; => (10 20 30 40 50)

(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items)))))

(print (map abs (list -10 2.5 -11.6 17)))
;;; => (10 2.5 11.6 17)
(print (map (lambda (x) (* x x))
            (list 1 2 3 4)))
;;; => (1 4 9 16)

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))
