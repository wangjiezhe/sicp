(load "helper.ss")

;;; Structures
(define-record tree
  (height girth age)
  ([leaf-shape 'frond] [leaf-color 'green]))

;;; compatibility feature
(define-structure
  (tree height girth age)
  ([leaf-shape 'frond] [leaf-color 'green]))
