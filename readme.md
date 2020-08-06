EMake Framework
====

emake 是一个基于 cmake 的跨平台工程管理框架，用尽量简单的方式管理大规模的项目。

## 使用

创建一个项目目录，拷贝 emake 目录到此目录下，然后拷贝 emake/CMakeLists.sample.txt 到项目目录，并改名为CMakeLists.txt，就像这样：

    [PROJECT_DIR]
        |- emake/... 
        |- CMakeLists.txt

然后使用QtCreator打开本项目即可

### 模板文件内容示例：

    cmake_minimum_required(VERSION 3.1)
    
    # ------------------------------------
    # -- 加载 emake 框架
    include(emake/import.cmake)
    
    # ------------------------------------
    # -- 添加 kit
    #
    #EBuildAddExtM(ext_name  ON  "" [CREATE] [DEBUG])
    #EBuildAddLibM(lib_name  ON  "" [CREATE] [DEBUG])
    #EBuildAddPlgM(plg_name  ON  "" [CREATE] [DEBUG])
    #EBuildAddAppM(app_name  ON  "" [CREATE] [DEBUG])
    
    # ------------------------------------
    # -- 生成构建规则
    EBuildGenerateM()

## 配置

如有必要，可在如下文件中 查看 或 修改 配置：
* emake/config.cmake


## tutorial

可以直接打开 emake/testing 中的项目查看，建议使用 Qt

