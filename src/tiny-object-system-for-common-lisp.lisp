; vals is instance variables.
(defstruct object methods vals prototypeObject delegateObject)

(defun makeEmptyObjectWithoutDelegate ()
  (make-object 
    ; debug
    ; quick hack to prevent immutable element of struct
    ; is it really immutable? not seems so
    :methods (make-hash-table)
    :vals (make-hash-table)   
    :prototypeObject (make-hash-table)
    :delegateObject (make-hash-table)
    ; end of debug
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
  ; (setf (gethash methodNameAsSymbol (object-methods object)) func)
  (setf obj (makeEmptyObject))
  (setf (gethash :prototypeContainer (object-prototypeObject obj)) prototype)
  (setf (gethash :delegateContainer (object-delegateObject obj)) nil)
  obj
)

(defun makeObjectWithDelegate (prototype delegate)
  (setf obj (makeEmptyObject))
  (setf (gethash :prototypeContainer (object-prototypeObject obj)) prototype)
  (setf (gethash :delegateContainer (object-delegateObject obj)) delegate)
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
  ; (gethash valNameAsSymbol (object-vals object))

  ; debug
  ; add delegate
  ; end of debug
  (setf method (gethash methodNameAsSymbol (object-methods object)))
  (setf prototype (gethash :prototypeContainer (object-prototypeObject object)))
  (setf delegate (gethash :delegateContainer (object-delegateObject object)))

  (setf result nil)
  (if (not (eq method nil))
    (progn
      (setf result (funcall method object))
    )
    (progn
      (if (not (eq delegate nil))
        (progn
          (setf result (callMethod delegate methodNameAsSymbol))
          ; (return-from callMethod nil)
        )
        (progn
          (if (not (eq prototype nil))
          (setf result (callMethod prototype methodNameAsSymbol))) 
        )
      )
      
    )
  )
  
  result
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
  ; (setf prototype (gethash :prototype (object-prototype object)))
  (setf (gethash :prototypeContainer (object-prototypeObject object)) prototype)

  object
)

(defun setdelegate (self delegate)
  (setf (gethash :delegateContainer (object-delegateObject self)) delegate)

  self
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