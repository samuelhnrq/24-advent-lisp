(defpackage 24-advent-day1
  (:import-from :cl-ppcre #:split)
  (:import-from :lparallel #:plet #:psort)
  (:import-from :arrow-macros #:->>)
  (:export #:parse-day-input #:calculate-answer #:calculate-answer-2)
  (:nicknames :24-adv-1)
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
  ;; (declare (type (or null string) x))
  (and x (not (string= x ""))))

(declaim (ftype (function (fixnum fixnum) fixnum) calc-diff)
         (inline calc-diff))
(defun calc-diff (x y)
  (abs (- x y)))

(defun parse-day-input (buffer &optional (acc (list nil nil)))
  (let ((current-line (read-line buffer nil nil)))
    (if (not-blank? current-line)
        (->> (parse-line current-line)
          (append-inputs acc)
          (parse-day-input buffer))
        acc)))

(defun create-occurence-map (f-seqs)
  (let ((amount-map (make-hash-table)))
    (dolist (digit f-seqs)
      (declare (type fixnum digit))
      (incf (gethash digit amount-map 0)))
    amount-map))

(defun calculate-answer-2 (seqs)
  (destructuring-bind (f-seq s-seq) seqs
    (let ((occur-map (create-occurence-map s-seq)))
      (->> f-seq
        (mapcar (lambda (x) (* x (gethash x occur-map 0))))
        (reduce #'+)))))

(defun calculate-answer (seqs)
  (destructuring-bind (f-seq s-seq) seqs
    (plet ((sf-seq (sort (copy-list f-seq) #'>))
           (ss-seq (sort (copy-list s-seq) #'>)))
      (->> (mapcar #'calc-diff sf-seq ss-seq)
        (reduce #'+)))))
