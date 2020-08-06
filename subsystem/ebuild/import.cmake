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

set(EBUILD_VERSION "1.0.1")

#
# 1.0.1:
#     fix copy empty files to dir which cause cmake err
#
#
#

EMakeInfF("EBuild Version: ${EBUILD_VERSION}")

set(_ ${SUB_SYSTEM_DIR}/modules/)

include(${_}/EBuildSetupQtM.cmake)
include(${_}/EBuildSetupCompat.cmake)
include(${_}/EBuildControl.cmake)

include(${_}/EBuildUtilsM.cmake)

include(${_}/EBuildAddM.cmake)
include(${_}/EBuildExecExtM.cmake)
include(${_}/EBuildExecLibM.cmake)
include(${_}/EBuildExecPlgM.cmake)
include(${_}/EBuildExecAppM.cmake)
include(${_}/EBuildExecTypeM.cmake)
include(${_}/EBuildExecProdM.cmake)

include(${_}/EBuildExtAddExportM.cmake)
include(${_}/EBuildScanComponents.cmake)

include(${_}/EBuildDependsM.cmake)
include(${_}/EBuildScanKitsM.cmake)
include(${_}/EBuildSetupKitsM.cmake)
include(${_}/EBuildValidateKitsM.cmake)
include(${_}/EBuildGenerateM.cmake)

set(_)

set(EMAKE_SETUP_INCLUDED 1)

#include(${SUB_SYSTEM_DIR}/templates/ext/CMakeLists.txt)
#include(${SUB_SYSTEM_DIR}/templates/lib/CMakeLists.txt)
#include(${SUB_SYSTEM_DIR}/templates/plg/CMakeLists.txt)
#include(${SUB_SYSTEM_DIR}/templates/app/CMakeLists.txt)
#include(${SUB_SYSTEM_DIR}/templates/type/CMakeLists.txt)
#include(${SUB_SYSTEM_DIR}/templates/product/CMakeLists.txt)
