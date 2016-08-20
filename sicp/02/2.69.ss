(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leafs)
  (if (null? (cdr leafs))
      (car leafs)
      (successive-merge
       (adjoin-set (make-code-tree (car leafs)
                                   (cadr leafs))
                   (cddr leafs)))))

(print (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1))))
;;; =>
;; ((leaf A 4)
;;   ((leaf B 2) ((leaf D 1) (leaf C 1) (D C) 2) (B D C) 4)
;;   (A B D C)
;;   8)
