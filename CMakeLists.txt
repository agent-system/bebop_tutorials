cmake_minimum_required(VERSION 2.8.3)
project(bebop_tutorials)

find_package(catkin REQUIRED COMPONENTS
  bebop_driver
  roseus
)

catkin_package(
)

install(DIRECTORY launch euslisp
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
  USE_SOURCE_PERMISSIONS)
