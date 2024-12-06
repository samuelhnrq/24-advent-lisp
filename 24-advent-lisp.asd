(defsystem "24-advent-lisp"
  :version "0.0.1"
  :author ""
  :license ""
  :depends-on ("cl-ppcre"
               "lparallel"
               "arrow-macros")
  :components ((:module "src"
                :components
                ((:file "day-1")
                 (:file "main" :depends-on ("day-1")))))
  :description ""
  :build-operation "program-op"
  :build-pathname "24-advent-lisp"
  :entry-point "24-advent-lisp:main"
  :in-order-to ((test-op (test-op "24-advent-lisp/tests"))))

(defsystem "24-advent-lisp/tests"
  :author ""
  :license ""
  :depends-on ("24-advent-lisp"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for 24-advent-lisp"
  :perform (test-op (op c) (symbol-call :rove :run c)))
