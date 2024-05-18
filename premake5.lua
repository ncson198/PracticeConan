include "dependencies/conandeps.premake5.lua" 

workspace "PraticeConan"
    configurations { "Debug", "Release" }
    architecture "x64"

    project "HelloWorld"
        kind "ConsoleApp"
        language "C++"
        cppdialect "C++11"

        targetdir "build/%{cfg.buildcfg}/bin"
        objdir "build/%{cfg.buildcfg}/obj"

        location "./src"
        files { "%{prj.location}/**.h", "%{prj.location}/**.cpp" }

        filter { "configurations:Debug" }
            defines { "DEBUG" }
            symbols "On"
        filter {}

        filter { "configurations:Release" }
            defines { "NDEBUG" }
            optimize "On"
        filter {}
    conan_setup()
