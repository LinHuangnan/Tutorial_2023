
(cl:in-package :asdf)

(defsystem "pub_sub-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "number" :depends-on ("_package_number"))
    (:file "_package_number" :depends-on ("_package"))
  ))