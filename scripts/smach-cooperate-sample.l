#!/usr/bin/env roseus

(require :state-machine "package://roseus_smach/src/state-machine.l")
(require :state-machine-ros "package://roseus_smach/src/state-machine-ros.l")

(defun start-func (args)
  )

(defun check-volume-trash (args)
  :not-full
  :full)

(defun transfer-by-voice (args)
  success)

(defun confirm-give (args)
  success)

(defun collect-garbage (args)
  success)

(defun confirm-receive (args)
  success)

(defun move-to-room-73b2-trash (args)
  success)

(defun move-to-room-trash (args)
  success)


(defun lead-teleop-sm ()
  (let (sm)
    (setq sm
          (make-state-machine
           '((:start :started :move-to-room-73b2-trash)
             (:move-to-room-73b2-trash :not-full :end)
             (:move-to-room-73b2-trash :full :collect-garbage)

             (:end :finished :finish))
           '((:start 'start-func)
             (:move-to-room-73b2-trash 'move-to-room-73b2-trash) ;; function maps
             (:collect-garbage 'collect-garbage)
             (:end 'end-func))
           '(:start)      ;; initial
           '(:finish)       ;; goal
           ))
    (send sm :arg-keys 'description)
    sm))
