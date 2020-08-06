# =====================================================================================
#
#       Filename:  setup.cmake
#
#    Description:  set the configuration of emake frame work or subsystem
#
#        Version:  1.0
#        Created:  16/11/2017 04:38:34 PM
#       Revision:  none
#       Compiler:  cmake
#
#         Author:  Haitao Yang, joyhaitao@foxmail.com
#        Company:
#
# =====================================================================================

macro(EMakeRegisterConfigM)

    EMakeGetProjectDirF(MAIN_PROJECT_DIR)

    file(RELATIVE_PATH _dir ${MAIN_PROJECT_DIR}/src/ ${EXTS_DIR})
    set(EXTS_EXPORTS_DIR ${COMMONS_DIR}/${_dir})

    file(RELATIVE_PATH _dir ${MAIN_PROJECT_DIR}/src/ ${LIBS_DIR})
    set(LIBS_EXPORTS_DIR ${COMMONS_DIR}/${_dir})

    file(RELATIVE_PATH _dir ${MAIN_PROJECT_DIR}/src/ ${PLGS_DIR})
    set(PLGS_EXPORTS_DIR ${COMMONS_DIR}/${_dir})

    file(RELATIVE_PATH _dir ${MAIN_PROJECT_DIR}/src/ ${APPS_DIR})
    set(APPS_EXPORTS_DIR ${COMMONS_DIR}/${_dir})

    EMakeSetGlobalPropertyM(EXTS_DIR     VAR ${EXTS_DIR})
    EMakeSetGlobalPropertyM(LIBS_DIR     VAR ${LIBS_DIR})
    EMakeSetGlobalPropertyM(PLGS_DIR     VAR ${PLGS_DIR})
    EMakeSetGlobalPropertyM(APPS_DIR     VAR ${APPS_DIR})
    EMakeSetGlobalPropertyM(PRODS_DIR    VAR ${PRODS_DIR})

    EMakeSetGlobalPropertyM(COMMONS_DIR  VAR ${COMMONS_DIR})
    EMakeSetGlobalPropertyM(EXPORTS_DIR  VAR ${EXPORTS_DIR})

    EMakeSetGlobalPropertyM(BUILD_DIR    VAR ${BUILD_DIR})

    foreach(_mode DEBUG RELEASE RELWITHDEBINFO MINSIZEREL)

        if(NOT DEFINED EXT_${_mode}_POSTFIX)
            set(EXT_${_mode}_POSTFIX ${CMAKE_${_mode}_POSTFIX})
        endif()

        if(NOT DEFINED LIB_${_mode}_POSTFIX)
            set(LIB_${_mode}_POSTFIX ${CMAKE_${_mode}_POSTFIX})
        endif()

        if(NOT DEFINED PLG_${_mode}_POSTFIX)
            set(PLG_${_mode}_POSTFIX ${CMAKE_${_mode}_POSTFIX})
        endif()

        if(NOT DEFINED APP_${_mode}_POSTFIX)
            set(APP_${_mode}_POSTFIX ${CMAKE_${_mode}_POSTFIX})
        endif()

    endforeach()

    if(NOT DEFINED AUTO_COPY OR AUTO_COPY)
        set(AUTO_COPY ON)
    else()
        set(AUTO_COPY OFF)
    endif()

    EMakeInfF("Auto Copy : ${AUTO_COPY}")

endmacro()

macro(EMakeSetupSingleBuildM)

    # 设置 project
    EMakeGetNameFromWholePathF(${CMAKE_CURRENT_SOURCE_DIR} KIT_NAME)
    project(${KIT_NAME})

    set(_my_dir ${CMAKE_CURRENT_SOURCE_DIR})
    set(_need   1)

    if    (${_my_dir} MATCHES ${EXTS_DIR})
        set(KIT_TYPE "EXTS")
    elseif(${_my_dir} MATCHES ${LIBS_DIR})
        set(KIT_TYPE "LIBS")
    elseif(${_my_dir} MATCHES ${PLGS_DIR})
        set(KIT_TYPE "PLGS")
    elseif(${_my_dir} MATCHES ${APPS_DIR})
        set(KIT_TYPE "APPS")
    elseif(${_my_dir} MATCHES ${PRODS_DIR})
        EMakeErrF("single build not supported for prodcut/type ")
    else()
        #EMakeErrF("internal err: unkown types of target, can not found matches dir, please check you setting on EMakeSetupConfig.cmake\ncurrent dir is ${_my_dir}")
        set(_need)
    endif()

    if(_need)
        EMakeSetTargetPropertyM(${KIT_NAME} BUILD_IN_SINGLE_MODE VAR 1)
        EMakeSetTargetPropertyM(${KIT_NAME} KIT_TYPE             VAR ${KIT_TYPE})
    endif()

endmacro()

EBuildSetupConfigM()
EMakeRegisterConfigM()
EMakeSetupSingleBuildM()
