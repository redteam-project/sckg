# Install script for directory: /root/content-0.1.47

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "0")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/scap-security-guide" TYPE FILE FILES "/root/content-0.1.47/LICENSE")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/scap-security-guide" TYPE FILE FILES "/root/content-0.1.47/README.md")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/scap-security-guide" TYPE FILE FILES "/root/content-0.1.47/Contributors.md")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man8" TYPE FILE FILES "/root/content-0.1.47/build/scap-security-guide.8")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/root/content-0.1.47/build/tests/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/chromium/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/debian8/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/debian9/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/eap6/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/fedora/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/firefox/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/fuse6/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/jre/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/ocp3/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/ocp4/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/ol7/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/ol8/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/opensuse/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/rhel6/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/rhel7/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/rhel8/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/rhosp13/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/rhv4/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/sle11/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/sle12/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/ubuntu1404/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/ubuntu1604/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/ubuntu1804/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/wrlinux8/cmake_install.cmake")
  INCLUDE("/root/content-0.1.47/build/wrlinux1019/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/root/content-0.1.47/build/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/root/content-0.1.47/build/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
