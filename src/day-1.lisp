(defpackage 24-advent-day1
  (:import-from :cl-ppcre #:split)
  (:import-from :lparallel #:plet #:psort)
  (:import-from :arrow-macros #:->>)
  (:export #:parse-day-input #:calculate-answer)
  (:use #:cl))

(in-package #:24-advent-day1)

(defun parse-line (line)
  (destructuring-bind (x y) (split "\\s+" line)
    (list (parse-integer x) (parse-integer y))))

(defun append-inputs (seqs vals)
  (destructuring-bind (f-seq s-seq x y) (append seqs vals)
    (list (cons x f-seq)
          (cons y s-seq))))

(defun not-blank? (x)
  (and x (not (string= x ""))))

(defun calc-diff (x y)
  (abs (- x y)))

(defun parse-day-input (buffer &optional (acc (list nil nil)))
  (let ((current-line (read-line buffer nil nil)))
    (if (not-blank? current-line)
        (->> (parse-line current-line)
          (append-inputs acc)
          (parse-day-input buffer))
        acc)))

(defun calculate-answer (seqs)
  (destructuring-bind (f-seq s-seq) seqs
    (plet ((sf-seq (sort f-seq #'>))
           (ss-seq (sort s-seq #'>)))
      (->> (mapcar #'calc-diff sf-seq ss-seq)
        (reduce #'+)))))
