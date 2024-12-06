(defpackage 24-advent-lisp
  (:export #:main)
  (:use #:cl))

(in-package #:24-advent-lisp)

#+(or)
(progn
  (main))

(defparameter *solutions*
  #((list 24-advent-day1:parse-day-input 24-advent-day1:calculate-answer)))

(defun get-parse-fn (day-number)
  (second (aref *solutions* (- 1 day-number))))

(defun read-parse-input (day-number)
  (let ((parse-fn (get-parse-fn day-number)))
    (with-open-file (file-stream (format nil "../inputs/day~D.txt" day-number))
      (apply parse-fn (list file-stream)))))

(defun elapsed-since (real-time)
  (format nil "~,4Fs"
          (/ (- (get-internal-real-time) real-time)
             (float internal-time-units-per-second))))

(defun time-exec (what fn &rest rest)
  (format t "Will trace exec time of ~A~&" what)
  (let* ((start (get-internal-real-time))
         (result (apply fn rest)))
    (format t "'~A' took: ~A~&" what (elapsed-since start))
    result))

(defun main ()
  (setf lparallel:*kernel* (lparallel:make-kernel 4))
  (let* ((parsed-input (time-exec "parsing" #'read-parse-input 1))
         (final-answer (time-exec "calculating" #'24-advent-day1:calculate-answer parsed-input)))
    (format t "Answer is ~A~&" final-answer)))
