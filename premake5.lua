project "lodepng"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "Off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"lodepng.h",
		"lodepng.cpp",
		"lodepng_util.h",
		"lodepng_util.cpp"
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
		symbols "Off"

	filter "configurations:Dist"
		runtime "Release"
		optimize "On"
		symbols "Off"

	filter { ("configurations:Release" or "configurations:Dist") and "system:windows" }
		flags
		{
			"LinkTimeOptimization"
		}
