## Copyright 2009-2021 Intel Corporation
## SPDX-License-Identifier: Apache-2.0

INCLUDE(GNUInstallDirs)

##############################################################
# Install Documentation
##############################################################

IF (WIN32)
  INSTALL(FILES "${PROJECT_SOURCE_DIR}/LICENSE.txt" DESTINATION doc COMPONENT lib)
  INSTALL(FILES "${PROJECT_SOURCE_DIR}/third-party-programs.txt" DESTINATION doc COMPONENT lib)
  INSTALL(FILES "${PROJECT_SOURCE_DIR}/third-party-programs-TBB.txt" DESTINATION doc COMPONENT lib)
#  INSTALL(FILES "${PROJECT_SOURCE_DIR}/CHANGELOG.md" DESTINATION doc COMPONENT lib)
ELSE()
  # Linux package builds include these separately
ENDIF()

##############################################################
# CPack specific stuff
##############################################################

SET(CPACK_PACKAGE_NAME "oneAPI Level Zero Ray Tracing Support")
IF (NOT DEFINED CPACK_PACKAGE_FILE_NAME)
  SET(CPACK_PACKAGE_FILE_NAME "intel-level-zero-gpu-raytracing-test")
ENDIF()
SET(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_FILE_NAME}_${ZE_RAYTRACING_VERSION}")
SET(CPACK_STRIP_FILES TRUE)

SET(CPACK_PACKAGE_VERSION_MAJOR ${ZE_RAYTRACING_VERSION_MAJOR})
SET(CPACK_PACKAGE_VERSION_MINOR ${ZE_RAYTRACING_VERSION_MINOR})
SET(CPACK_PACKAGE_VERSION_PATCH ${ZE_RAYTRACING_VERSION_PATCH})
SET(CPACK_PACKAGE_VERSION ${ZE_RAYTRACING_VERSION})
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Support library for Level Zero ray tracing extension.")
SET(CPACK_PACKAGE_VENDOR "Intel Corporation")
SET(CPACK_PACKAGE_CONTACT embree_support@intel.com)
#SET(CPACK_MONOLITHIC_INSTALL 0)
#SET(CPACK_COMPONENTS_GROUPING ONE_PER_GROUP)
#SET(CPACK_COMPONENTS_GROUPING IGNORE)

SET(CPACK_COMPONENT_LIB_DISPLAY_NAME "Library")
SET(CPACK_COMPONENT_LIB_DESCRIPTION "Library")
SET(CPACK_COMPONENT_LIB_GROUP LIB)

SET(CPACK_COMPONENT_DEVEL_DISPLAY_NAME "Development")
SET(CPACK_COMPONENT_DEVEL_DESCRIPTION "Development")
SET(CPACK_COMPONENT_DEVEL_GROUP DEVEL)

SET(CPACK_COMPONENT_TEST_DISPLAY_NAME "Tests")
SET(CPACK_COMPONENT_TEST_DESCRIPTION "Tests")
SET(CPACK_COMPONENT_TEST_GROUP TEST)

SET(CPACK_COMPONENTS_ALL LIB DEVEL TEST)

# Windows specific settings
IF(WIN32)
  SET(CPACK_GENERATOR ZIP)
  SET(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_FILE_NAME}.x64.windows")

# MacOSX specific settings
ELSEIF(APPLE)
  SET(CPACK_GENERATOR ZIP)
  SET(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_FILE_NAME}.x86_64.macosx")

# Linux specific settings
ELSE()

  SET(CPACK_GENERATOR TGZ)
  SET(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_FILE_NAME}.x86_64.linux")
 
ENDIF()
