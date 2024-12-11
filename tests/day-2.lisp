(defpackage 24-advent-lisp/tests/day-2
  (:nicknames :24-adv/test-2)
  (:use :cl :fiveam))

(in-package :24-adv/test-2)

(def-suite* second-day
  :description "Second day of christimas")

(defparameter day-example
  "7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9")

(defparameter parsed-example
  '((7 6 4 2 1)
    (1 2 7 8 9)
    (9 7 6 2 1)
    (1 3 2 4 5)
    (8 6 4 4 1)
    (1 3 6 7 9)))

(setf lparallel:*kernel* (lparallel:make-kernel 1))

(test parses-input
  (with-input-from-string (s day-example)
    (is (equal parsed-example (24-adv-2:parse-day-input s)))))

(test day-1-answer
  (is (equal 2 (24-adv-2:calculate-answer parsed-example))))

;; (test day-2-answer
;;  (is (equal 31 (24-adv-2:calculate-answer-2 parsed-example))))
