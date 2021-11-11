################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/cr_cpp_config.cpp \
../src/cr_startup_lpc175x_6x.cpp \
../src/main.cpp 

C_SRCS += \
../src/crp.c \
../src/timerLib.c \
../src/uart.c 

OBJS += \
./src/cr_cpp_config.o \
./src/cr_startup_lpc175x_6x.o \
./src/crp.o \
./src/main.o \
./src/timerLib.o \
./src/uart.o 

CPP_DEPS += \
./src/cr_cpp_config.d \
./src/cr_startup_lpc175x_6x.d \
./src/main.d 

C_DEPS += \
./src/crp.d \
./src/timerLib.d \
./src/uart.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C++ Compiler'
	arm-none-eabi-c++ -DDEBUG -D__CODE_RED -D__NEWLIB__ -DCORE_M3 -D__USE_CMSIS=CMSIS_CORE_LPC17xx -D__USE_CMSIS_DSPLIB=CMSIS_DSPLIB_CM3 -DCPP_USE_HEAP -D__LPC17XX__ -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\CMSIS_CORE_LPC17xx\inc" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\CMSIS_DSPLIB_CM3\inc" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite\third_party\flatbuffers\include" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite\third_party\gemmlowp" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite\third_party\ruy" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fno-rtti -fno-exceptions -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m3 -mthumb -D__NEWLIB__ -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -DCORE_M3 -D__USE_CMSIS=CMSIS_CORE_LPC17xx -D__USE_CMSIS_DSPLIB=CMSIS_DSPLIB_CM3 -DCPP_USE_HEAP -D__LPC17XX__ -D__NEWLIB__ -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\CMSIS_CORE_LPC17xx\inc" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\CMSIS_DSPLIB_CM3\inc" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite\third_party\flatbuffers\include" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite\third_party\gemmlowp" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite\third_party\ruy" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m3 -mthumb -D__NEWLIB__ -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


