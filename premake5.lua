local _files =
{
	"src/**.h",
	"src/**.cpp",
	"include/**.h"
}

local _includedirs =
{
	"include",
	"src"
}

group "Dependencies"
	project "Box2D"
		kind "StaticLib"
		language "C++"
		cppdialect "C++20"
		staticruntime "off"
		architecture "x64"
		targetdir ("%{wks.location}/bin/" .. outputdir)
		objdir ("%{wks.location}/bin-int/" .. tmpdir)

		files(_files)
		includedirs(_includedirs)

		filter "system:windows"
			systemversion "latest"

		filter "configurations:Debug"
			runtime "Debug"
			symbols "on"
			optimize "Off"

		filter "configurations:Release"
			runtime "Release"
			optimize "full"

group "Browser/Dependencies"
	project "Box2D.Web"
		kind "StaticLib"
		targetname "Box2D"
		targetextension ".a"
		language "C++"
		cppdialect "C++20"
		staticruntime "off"
		architecture "x64"
		targetdir ("%{wks.location}/bin/" .. outputdirweb)
		objdir ("%{wks.location}/bin-int/" .. tmpdirweb)

		files(_files)
		includedirs(_includedirs)

		filter "system:windows"
			systemversion "latest"

		filter "configurations:Debug"
			runtime "Debug"
			symbols "on"
			optimize "Off"

		filter "configurations:Release"
			runtime "Release"
			optimize "full"

group ""