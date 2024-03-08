(myLoad "tiny-object-system-for-common-lisp.lisp")

(setf obj (makeEmptyObject))
(addMethod obj :getOrange (lambda (x) "orange"))
(addMethod obj :getApplePie (lambda (x) "ApplePie"))
(format t "Hello ~s~%" (callMethod obj :getOrange))
(format t "Hello2 ~s~%" (callMethod obj :getApplePie))
(format t "Hello Validation: ~s~%" (callMethod obj :getOrange))

; test of delegate
(setf delegate (makeEmptyObject))
(addMethod delegate :getApple (lambda (x) "apple"))
(setDelegate obj delegate)
(format t "Hello from Delegate ~s!~%" (callMethod obj :getApple))

; test of prototype
(setf prt (makeEmptyObject))
(addMethod prt :getCinnamon (lambda (x) "cinnamon"))
(setPrototype obj prt)
(format t "Hello! Is it inherited? ~s~%" (callMethod obj :getCinnamon))