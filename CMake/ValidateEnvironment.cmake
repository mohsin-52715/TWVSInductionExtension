
macro(check_linux_package package_name)

    execute_process(
        COMMAND  apt list --installed ${package_name}
        COMMAND  grep -iw ${package_name}
        ERROR_QUIET
        RESULT_VARIABLE retCode
    )

    if(NOT retCode STREQUAL 0)
       
        list(APPEND failed_list ${package_name})

    endif()

endmacro()

if(CMAKE_HOST_SYSTEM_NAME STREQUAL Windows)

    #TODO Add Windows validations here

endif()

if(CMAKE_HOST_SYSTEM_NAME STREQUAL Linux)

   message(STATUS "Verifying packages installed on Linux ...")

   set(failed_list)

   check_linux_package("zip")
   check_linux_package("unzip")
   check_linux_package("build-essential")
   check_linux_package("libstdc++-10-dev")
   check_linux_package("gdbserver")
   check_linux_package("openssh-server")
   check_linux_package("libgl1-mesa-dev")
   check_linux_package("libdouble-conversion-dev")
   check_linux_package("libpcre2-16-0")
   check_linux_package("zlib1g")
   check_linux_package("zlib1g-dev")
   check_linux_package("libpcre2-dev")
   check_linux_package("libglib2.0-dev")
   check_linux_package("libgl1-mesa-dev")
   check_linux_package("libglfw3-dev")
   check_linux_package("libgles2-mesa-dev")
   check_linux_package("libegl1-mesa-dev")
   check_linux_package("libegl-dev")
   check_linux_package("libgegl-dev")
   check_linux_package("libatspi2.0-0")
   check_linux_package("libatspi2.0-dev")
   check_linux_package("libudev-dev")
   check_linux_package("libpng-dev")
   check_linux_package("libharfbuzz-dev")
   check_linux_package("libfreetype-dev")
   check_linux_package("libfontconfig1-dev")
   check_linux_package("libmtdev-dev")
   check_linux_package("libinput-dev")
   check_linux_package("libxcb-xkb-dev")
   check_linux_package("libxkbcommon-dev")
   check_linux_package("libx11-xcb-dev")
   check_linux_package("libxcb-composite0-dev")
   check_linux_package("libkf5pulseaudioqt-dev")
   check_linux_package("libfontconfig1-dev")
   check_linux_package("libfreetype6-dev")
   check_linux_package("libx11-dev")
   check_linux_package("libx11-xcb-dev")
   check_linux_package("libxext-dev")
   check_linux_package("libxfixes-dev")
   check_linux_package("libxi-dev")
   check_linux_package("libxrender-dev")
   check_linux_package("libxcb1-dev")
   check_linux_package("libxcb-glx0-dev")
   check_linux_package("libxcb-keysyms1-dev")
   check_linux_package("libxcb-image0-dev")
   check_linux_package("libxcb-shm0-dev")
   check_linux_package("libxcb-icccm4-dev")
   check_linux_package("libxcb-sync-dev")
   check_linux_package("libxcb-xfixes0-dev")
   check_linux_package("libxcb-shape0-dev")
   check_linux_package("libxcb-randr0-dev")
   check_linux_package("libxcb-render-util0-dev")
   check_linux_package("libxcb-util-dev")
   check_linux_package("libxcb-xinerama0-dev")
   check_linux_package("libxcb-xkb-dev")
   check_linux_package("libxkbcommon-dev")
   check_linux_package("libxkbcommon-x11-dev")
   check_linux_package("libxcb-xinput-dev")
   check_linux_package("libxcb-xinput0")
   check_linux_package("libtiff-dev")
   check_linux_package("libgbm-dev")
   check_linux_package("pulseaudio")
   check_linux_package("libdrm-dev")
   check_linux_package("libssl-dev")
   check_linux_package("qemu-kvm")
   check_linux_package("qemu-utils")

   list(LENGTH failed_list failed_count)
   if(NOT failed_count STREQUAL 0)
       
        message(NOTICE "Follow this page to install required packages on Linux : https://tallywiki.tallysolutions.com/display/TWP/Install+Required+Software+on+Linux+x64+Host")
        message(NOTICE "Run following command to install missing packages:")
        foreach(PKG ${failed_list})
           message(NOTICE "   sudo apt install ${PKG} -y")
        endforeach()
        
        message(FATAL_ERROR "One or more packages not installed.")

    endif()

endif()

if(CMAKE_HOST_SYSTEM_NAME STREQUAL Darwin)
    
    #TODO Add MacOS Validations here
    
endif()
