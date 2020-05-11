(defun getCurrentDir ()
  (truename "./")
)

(defun myLoad (relativePath)
  (setf currentdir (getCurrentDir))
  (setf path (merge-pathnames currentdir relativepath))
  (if (eq (probe-file path) nil)
    (progn
      (return-from nil)
    )
  )
  (load path)
)

(myLoad "main.lisp")