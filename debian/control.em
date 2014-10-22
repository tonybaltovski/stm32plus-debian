Source: stm32plus
Maintainer: Mike Purvis <mike@@uwmike.com>
Section: devel
Priority: extra
Standards-Version: 3.9.5
Build-Depends:
  debhelper (>= 9),
  gcc-arm-none-eabi,
  libstdc++-arm-none-eabi-newlib,
  scons,
Homepage: https://github.com/andysworkshop/stm32plus

Package: stm32plus-headers
Architecture: all
Depends:
  ${misc:Depends},
  dfu-util,
  gcc-arm-none-eabi,
  libstdc++-arm-none-eabi-newlib,
Description: stm32plus headers
 Include directory for stm32plus header files, and cmake find module.

@[for config_string in config_strings]
Package: stm32plus-@(config_string)
Architecture: all
Depends: ${misc:Depends}, stm32plus-headers
Description: stm32plus built library
 Pre-built static library for the @(config_string) build configuration.

Package: stm32plus-@(config_string)-examples
Architecture: all
Depends: ${misc:Depends}, dfu-util
Description: stm32plus example binaries
 Pre-built example binaries for the @(config_string) build configuration.
@[end for]
