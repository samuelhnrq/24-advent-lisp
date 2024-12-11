(defpackage 24-advent-day2
  (:import-from :cl-ppcre #:split)
  (:import-from :lparallel #:plet #:psort)
  (:import-from :arrow-macros #:->>)
  (:export #:parse-day-input #:calculate-answer #:calculate-answer-2)
  (:nicknames :24-adv-2)
  (:use #:cl))

(in-package #:24-advent-day2)

(declaim (ftype (function ((or null string)) boolean) not-blank?)
         (inline blank?))
(defun blank? (x)
  (or (null x) (string= x "")))

(declaim (ftype (function (string) list) parse-line)
         (inline parse-line))
(defun parse-line (line)
  (if (blank? line)
      nil
      (mapcar #'parse-integer (split "\\s+" line))))

(declaim (ftype (function (list list) list) append-inputs)
         (inline append-inputs))
(defun append-inputs (acc next)
  (if (null next)
      acc
      (cons next acc)))

(defun parse-day-input (buffer &optional acc)
  (let ((current-line (string-trim " " (read-line buffer nil "EOF"))))
    (if (equal "EOF" current-line)
        (reverse acc)
        (parse-day-input buffer
                         (->> current-line
                           (parse-line)
                           (append-inputs acc))))))

(defun calculate-answer-2 (seqs)
  nil)

(defun calculate-answer (seqs)
  nil)
