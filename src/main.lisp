(defpackage 24-advent-lisp
  (:export #:main)
  (:nicknames :24-adv)
  (:use #:cl))

(in-package #:24-advent-lisp)

#+(or)
(progn
  (main))

(defparameter *solutions*
  (list (list #'24-adv-1:parse-day-input #'24-adv-1:calculate-answer #'24-adv-1:calculate-answer-2)
        (list #'24-adv-2:parse-day-input #'24-adv-2:calculate-answer #'24-adv-2:calculate-answer-2)))

(defun get-parse-fn (day-number)
  (nth 0 (nth (- day-number 1) *solutions*)))

(defun read-parse-input (day-number)
  (let ((parse-fn (get-parse-fn day-number))
        (file-name (format nil "inputs/day~D.txt" day-number)))
    (with-open-file (file-stream (asdf:system-relative-pathname "24-advent-lisp" file-name))
      (apply parse-fn (list file-stream)))))

(defun elapsed-since (real-time)
  (declare (type fixnum real-time))
  (format nil "~,4Fs"
          (/ (- (get-internal-real-time) real-time)
             (float internal-time-units-per-second))))

(defun time-exec (what fn &rest rest)
  (format t "Will trace exec time of ~A~&" what)
  (let* ((start (get-internal-real-time))
         (result (apply fn rest)))
    (format t "'~A' took: ~A~&" what (elapsed-since start))
    result))

(defun read-number (request)
  (declare (type simple-string request))
  (write-string request)
  (finish-output)
  (parse-integer (read-line)))

(defun main ()
  (setf lparallel:*kernel* (lparallel:make-kernel 4))
  (let* ((chosen-day (read-number "Please enter a number: "))
         (day-fns (nth (- chosen-day 1) *solutions*))
         (parsed-input (time-exec "parsing input" #'read-parse-input chosen-day))
         (final-answer (time-exec "calculating part 1" (nth 1 day-fns) parsed-input))
         (second-answer (time-exec "calculating part 2" (nth 2 day-fns) parsed-input)))
    (format t "Answer is ~A~&" final-answer)
    (format t "Second answ is ~A~&" second-answer)))
