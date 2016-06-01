# bebop_tutorials

## Prerequisities

Assumed ROS Indigo is already installed on your PC.

## Installation

```bash
roscd
cd ../src
git clone https://github.com/agent-system/bebop_tutorials
rosdep install --from-paths . --ignore-src -r -n -y
catkin b bebop_tutorials
roscd
source setup.bash
```

## Keyboard Teleop

1. Check your PC is connected to Bebop Wifi.

2. Execute commands followings:

```bash
roslaunch bebop_tutorials bebop_keyboard_teleop.launch
```

3. You can takeoff by pressing `t` key.

```lisp
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
```
