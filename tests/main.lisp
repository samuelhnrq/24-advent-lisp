(defpackage 24-advent-lisp/tests/main
  (:use :cl
        :24-advent-lisp
        :rove))
(in-package :24-advent-lisp/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :24-advent-lisp)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
