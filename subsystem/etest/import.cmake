# =====================================================================================
#
#       Filename:  import.cmake
#
#    Description:  this file is used for import framework or subsystem
#
#        Version:  1.0
#        Created:  2018.09.02 00:24:34 PM
#       Revision:  none
#       Compiler:  cmake
#
#         Author:  Haitao Yang, joyhaitao@foxmail.com
#        Company:
#
# =====================================================================================

set(ETEST_VERSION "1.0.4")  # add etest.h included for all test build target

EMakeInfF("ETest Version: ${ETEST_VERSION}")

include(${SUB_SYSTEM_DIR}/modules/ETestAdd.cmake)
include(${SUB_SYSTEM_DIR}/modules/ETestEngine.cmake)
include(${SUB_SYSTEM_DIR}/modules/ETestFileGenerator.cmake)
