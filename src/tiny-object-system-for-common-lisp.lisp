; [15]> (defstruct object methods vals prototype)
; OBJECT
; [16]> (setf obj (make-object))
; #S(OBJECT :METHODS NIL :VALS NIL :PROTOTYPE NIL)
; [17]> (object-methods obj)
; NIL
; [18]> (setf (object-methods obj) "f")
; "f"
; [19]> (object-methods obj)
; "f"
; [20]> 

; vals is instance variables.
(defstruct object methods vals prototype delegateObject)

(defun makeEmptyObjectWithoutDelegate ()
  (make-object 
    :methods (make-hash-table :test #'equal)
    :vals (make-hash-table :test #'equal)
    :prototype nil
    :delegateObject nil
  )
)

(defun makeEmptyObject ()
  ; resolver hash resolves instance method name and instance val name
  (setf obj (makeEmptyObjectWithoutDelegate))
  obj
)

;(setf obj 
;  (object-methods obj)
; (makeEmptyObject)

(defun makeObject (prototype)
  (setf obj (makeEmptyObject))
  (setf (object-prototype obj) prototype)
  (setf (object-delegateObject obj) (makeNullDelegate))
  obj
)

; This object system is prototye base. So clone object has slightly different meaning compared with class based object system
(defun cloneObject (object))

;; hash
; (setf ht (make-hash-table :test #'equal))
; (setf (gethash "apple" ht) 150)
; (setf (gethash "orange" ht) 200)
; (format t "appple ~d " (gethash "apple" ht))
; (format t "orange ~d " (gethash "orange" ht))
; call lambda
; (funcall foo 1)

(defun addMethod (object methodNameAsSymbol func)
  ; (object-methods object) access to struct of object
  (setf (gethash methodNameAsSymbol (object-methods object)) func)

  object
)


(defun callMethod (object methodNameAsSymbol)
  ; debug add prototype and delegate call
  ; (setf (gethash methodNameAsSymbol (object-methods object)) func)
  (setf method (gethash methodNameAsSymbol (object-methods object)))
  (funcall method object)
  ; end of debug
)

(defun addInstanceVal (object valNameAsSymbol val)
  (setf (gethash valNameAsSymbol (object-vals object)) val)

  object
)


(defun getInstanceVal (object valNameAsSymbol)
  (gethash valNameAsSymbol (object-vals object))
)

(defun makeNullDelegate ()
  (setf obj (makeEmptyObjectWithoutDelegate))
  ; debug
  ; use exception if exists or use appropriate error handling
  (addMethod obj :call (lambda () "error"))
  ; end of debug

  obj
)

; inherit as prototype base object system
(defun setPrototype (object prototype)
  (setf (object-prototype object) prototype)

  object
)

(defun getRootPrototypeObject (object))

(defun setDelegate (object delegateObject)
  (setf (object-delegateObject object) delegate)
)

; protected
(defun searchMethodInThisObject (object methodNameAsSymbol))

; protected
(defun searchMethodRecursively (object methodNameAsSymbol))

; protected
(defun hasMethodRecursively (object methodNameAsSymbol))

; protected
(defun getAllMethodNamesInThisObject (object))

; protected
(defun getAllInstanceValNamesInThisObject (object))