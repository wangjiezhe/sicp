(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (if (leaf? tree)
      (if (eq? symbol (symbol-leaf tree))
          '()
          (error "no such symbol in the tree" symbol))
      (if (memq symbol (symbols (left-branch tree)))
          (cons 0 (encode-symbol symbol (left-branch tree)))
          (cons 1 (encode-symbol symbol (right-branch tree))))))

(define (encode-symbol symbol tree)
  (cond [(leaf? tree) '()]
        [(memq symbol (symbols (left-branch tree)))
         (cons 0 (encode-symbol symbol (left-branch tree)))]
        [(memq symbol (symbols (right-branch tree)))
         (cons 1 (encode-symbol symbol (right-branch tree)))]
        [else (error "no such symbol in the tree" symbol)]))


(print (encode '(A D A B B C A) sample-tree))
;;; => (0 1 1 0 0 1 0 1 0 1 1 1 0)
