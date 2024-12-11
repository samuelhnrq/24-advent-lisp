(defpackage 24-advent-lisp/tests/day-1
  (:nicknames :24-adv/test-1)
  (:use :cl :fiveam))

(in-package :24-adv/test-1)

;; NOTE: To run this test file, execute `(asdf:test-system :24-advent-lisp)' in your Lisp.
(def-suite* first-day
  :description "first day")

(defparameter day1-example
  "3   4
4   3
2   5
1   3
3   9
3   3")

(defparameter parsed-example
  '((3 3 1 2 4 3) (3 9 3 5 3 4)))

(setf lparallel:*kernel* (lparallel:make-kernel 1))

(test parses-input
  (with-input-from-string (s day1-example)
    (is (equal parsed-example (24-adv-1:parse-day-input s)))))

(test day-1-answer
  (is (equal 11 (24-adv-1:calculate-answer parsed-example))))

(test day-2-answer
  (is (equal 31 (24-adv-1:calculate-answer-2 parsed-example))))
