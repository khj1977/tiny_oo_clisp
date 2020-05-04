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

(defun makeEmptyObject ()
  ; resolver hash resolves instance method name and instance val name
  (defstruct object methods vals prototype delegateObject)
  ; (make-object 
  ;   :methods (make-hash-table :test #'equal)
  ;   :vals (make-hash-table :test #'equal)
  ;   :prototype nil
  (make-object)
)

(setf obj 
  (object-methods obj)
(makeEmptyObject)

(defun makeObject (prototype))

; This object system is prototye base. So clone object has slightly different meaning compared with class based object system
(defun clonObject (object))

;; hash
; (setf ht (make-hash-table :test #'equal))
; (setf (gethash "apple" ht) 150)
; (setf (gethash "orange" ht) 200)
; (format t "appple ~d " (gethash "apple" ht))
; (format t "orange ~d " (gethash "orange" ht))

(defun addMethod (object methodAsHash))

(defun addInstanceVals (object InstanceValsAsHash))

; inherit as prototype base object system
(defun setPrototype (object prototype))

(defun getRootPrototypeObject (object))

; func is lambda
(defun setMethod (object func))

(defun callMethod (object methodNameAsSymbol))

(defun setDelegate (object delegateObject))

; protected
(defun searchMethodInThisObject (object methodNameAsSymbol))

; protected
(defun searchMethodRecursively (object methodNameAsSymbol))

; protected
(defun hasMethodRecursively (object methodNameAsSymbol))