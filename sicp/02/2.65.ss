(load "2.62.ss")                        ; union-set
(load "2.3.3.ss")                       ; intersection-set
(load "2.63.ss")                        ; tree->list-2
(load "2.64.ss")                        ; list->tree

(define (union-tree tree1 tree2)
  (list->tree
   (union-set (tree->list-2 tree1)
              (tree->list-2 tree2))))

(define (intersection-tree tree1 tree2)
  (list->tree
   (intersection-set (tree->list-2 tree1)
              (tree->list-2 tree2))))
