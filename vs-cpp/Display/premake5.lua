project "Display"  
    kind "ConsoleApp" 
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")
    
    files {
        "src/**.h",
        "src/**.cpp",
        "src/**.txt"
    }

    includedirs
    {
        "%{IncludeDir.SDL}",
    }

    libdirs
    {
        "%{LibraryDir.SDL}"
    }

    links
    {
        "SDL2", "SDL2main"
    }

    prebuildcommands
    {
        '{COPYFILE} "%{wks.location}dependencies/SDL2/lib/*.dll" "%{wks.location}%{prj.name}"'
    }

    postbuildcommands {
        '{COPYFILE} "%{cfg.buildtarget.relpath}" "%{wks.location}results/%{cfg.buildtarget.basename}_%{cfg.buildcfg}.exe"'
    }

    debugargs {
        "../results/forest10.txt.out"
    }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "Speed"