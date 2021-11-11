################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tensorflow_lite/tensorflow/lite/schema/schema_utils.cc 

CC_DEPS += \
./tensorflow_lite/tensorflow/lite/schema/schema_utils.d 

OBJS += \
./tensorflow_lite/tensorflow/lite/schema/schema_utils.o 


# Each subdirectory must supply rules for building sources it contributes
tensorflow_lite/tensorflow/lite/schema/%.o: ../tensorflow_lite/tensorflow/lite/schema/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C++ Compiler'
	arm-none-eabi-c++ -DDEBUG -D__CODE_RED -D__NEWLIB__ -DCORE_M3 -D__USE_CMSIS=CMSIS_CORE_LPC17xx -D__USE_CMSIS_DSPLIB=CMSIS_DSPLIB_CM3 -DCPP_USE_HEAP -D__LPC17XX__ -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\CMSIS_CORE_LPC17xx\inc" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\CMSIS_DSPLIB_CM3\inc" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite\third_party\flatbuffers\include" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite\third_party\gemmlowp" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite\third_party\ruy" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fno-rtti -fno-exceptions -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m3 -mthumb -D__NEWLIB__ -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


