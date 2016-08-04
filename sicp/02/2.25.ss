(print (cadr (caddr '(1 3 (5 7) 9))))
;;; => 7

(print (caar '((7))))
;;; => 7

(print (cadadr (cadadr (cadadr '(1 (2 (3 (4 (5 (6 7))))))))))
;;; => 7
