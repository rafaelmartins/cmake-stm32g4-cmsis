# cmake-stm32g4-cmsis

[CMake](https://cmake.org/) module containing [CMSIS](https://arm-software.github.io/CMSIS_5) headers for [STMicroelectronics'](https://www.st.com/) [STM32G4 Series](https://www.st.com/en/microcontrollers-microprocessors/stm32g4-series.html) of [ARM Cortex-M4](https://developer.arm.com/Processors/Cortex-M4) microcontrollers.

The module provides a stripped-down selection of CMSIS headers required by the supported devices, that are ideal for bare-metal development.

The module requires a GCC cross toolchain for AArch32 bare-metal (`arm-none-eabi`). We recommend the [official GCC builds from ARM](https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads). `IAR™` and `Keil®` toolchains are not supported (yet?).


## How to use

TODO


## Examples

A simple example, suitable for the [`NUCLEO-G431KB` board](https://www.st.com/en/evaluation-tools/nucleo-g431kb.html), is provided [here](./example).
