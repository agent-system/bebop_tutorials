#!/usr/bin/env roseus
;; bebop_keyboard_teleop.l
;; Author: Yuki Furuta <furushchev@jsk.imi.i.u-tokyo.ac.jp>

(require :kbhit "kbhit.l")

(ros::roseus "bebop_keyboard_teleop")

(ros::load-ros-manifest "geometry_msgs")

(ros::advertise "cmd_vel" geometry_msgs::Twist 1)

(defun send-command (cmd)
  (let ((topic-name (format nil "~A" cmd)))
    (unless (ros::get-topic-publisher topic-name)
      (ros::advertise topic-name std_msgs::Empty 1)
      (unix:sleep 1))
    (ros::publish topic-name (instance std_msgs::Empty :init))))

(setq *speed* 0.1)

(setq rate 20)
(ros::rate rate)
(let ((cnt 0)
      key msg)
  (while t
    (incf cnt)
    (setq msg (instance geometry_msgs::Twist :init))
    (case (kbhit :timeout (/ 1.0 rate))
     (#\q (return))
     (#\t
      (send-command "takeoff"))
     (#\n
      (send-command "land"))
     (#\r
      (send-command "reset"))
     (#\i ;; forward
      (send msg :linear :x *speed*))
     (#\k ;; backward
      (send msg :linear :x *speed*))
     (#\j ;; left
      (send msg :linear :y *speed*))
     (#\l ;; right
      (send msg :linear :y *speed*))
     (#\w ;; up
      (send msg :linear :z *speed*))
     (#\s ;; down
      (send msg :linear :z *speed*))
     (#\a ;; ccw
      (send msg :angular :z (deg2rad 3)))
     (#\d ;; cw
      (send msg :angular :z (deg2rad 3)))
     (t
      (decf cnt)))
    (ros::publish "cmd_vel" msg)
    (ros::sleep)))


(provide :bebop_keyboard_teleop) ;; end of bebop_keyboard_teleop.l
