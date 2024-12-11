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
                 (:file "day-2")
                 (:file "main" :depends-on ("day-1"
                                            "day-2")))))
  :description ""
  :build-operation "program-op"
  :build-pathname "24-advent-lisp"
  :entry-point "24-advent-lisp:main"
  :in-order-to ((test-op (test-op "24-advent-lisp/tests"))))

(defsystem "24-advent-lisp/tests"
  :author ""
  :license ""
  :depends-on ("24-advent-lisp"
               "fiveam")
  :components ((:module "tests"
                :components
                ((:file "day-1")
                 (:file "day-2"))))
  :description "Test system for 24-advent-lisp"
  :perform (test-op (op c)
                    (symbol-call :fiveam :run!)))
;; (find-symbol* :24-adv/test-1 :24-adv/test-2)
