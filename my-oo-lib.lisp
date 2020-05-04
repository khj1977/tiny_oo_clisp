(defun makeEmptyObject ())

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

(defun getRootPrototypeObject)

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