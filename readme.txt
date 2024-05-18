first: create an src main.cpp
coppy the premake5.exe + premake5.lua to the root folder
change the project, workspace (and architecture, cppdialect, location if necessary)
run cmd: premake5 vs2022
run the .sln file

open Conan io center, choose the fmt/9.1.0 for simple input output (don't take too much time to compile)
    or spdlog/1.14.1 - this contain the fmt/9.1.0

add conanfile.py

change self.requires to get dependencies
run cmd: conan profile detect -> check the compiler.cppstd=?? 
    if the cpp++ version here is older than the C++ version of the project:
        - open the detected file C:\Users\ncson\.conan2\profiles\default   and change the compiler.cppstd to the value you need for the project


===============================================THOSE STEPS BELOW CAN BE REPLACED BY ADDING THE FILE :init.py AND RUN THE CMD: python init.py=================================
now we can install: run cmd: conan install . --output-folder=./dependencies

if install failed caused by missing packages. try cmd: conan install . --build missing --output-folder=./dependencies --settings=build_type=Debug
                                                                                            --settings=build_type=Debug option is use for runcode, debug in visual studio
                                                                                                                    (need CMake installed)

now open file premake5.lua, add first line: include "dependencies/conandeps.premake5.lua" 
                            add last line: conan_setup("release_x86_64")
                    
now run again cmd: premake5 vs2022

open visual studio -> at popup notification -> reload all

open file premake5.lua add last line linkoptions {"/IGNORE:4099"} (4009 is the code warning) to ignore those warning when compile code
===================================================================================================================================================================

In the future. When we have to include more dependencies, just go to the conanfile.py -> add line : self.requires("name.of.a.dependency.you.need.and.get.from.conanio")
then run cmd: python init.py