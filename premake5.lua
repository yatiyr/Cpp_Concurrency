
workspace "CONC"
	architecture "x86_64"
	startproject "C++ Concurrency"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	
	}

	flags
	{
		"MultiProcessorCompile"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "C++ Concurrency"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/**.h",
	  "src/**.hpp",
        "src/**.cpp",
	  "src/**.c"
    }

    includedirs
    {
          "include",
	    "src"
    }


    filter "configurations:Debug"
        defines "CONC_DBG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "CONC_REL"
        runtime "Release"
        optimize "speed"

    filter "configurations:Dist"
        defines "CONC_DIST"
        runtime "Release"
        optimize "on"
