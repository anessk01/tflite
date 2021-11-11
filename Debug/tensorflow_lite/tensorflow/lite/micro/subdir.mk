################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tensorflow_lite/tensorflow/lite/micro/all_ops_resolver.cc \
../tensorflow_lite/tensorflow/lite/micro/debug_log.cc \
../tensorflow_lite/tensorflow/lite/micro/flatbuffer_utils.cc \
../tensorflow_lite/tensorflow/lite/micro/memory_helpers.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_allocator.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_error_reporter.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_graph.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_interpreter.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_profiler.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_string.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_time.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_utils.cc \
../tensorflow_lite/tensorflow/lite/micro/mock_micro_graph.cc \
../tensorflow_lite/tensorflow/lite/micro/recording_micro_allocator.cc \
../tensorflow_lite/tensorflow/lite/micro/recording_simple_memory_allocator.cc \
../tensorflow_lite/tensorflow/lite/micro/simple_memory_allocator.cc \
../tensorflow_lite/tensorflow/lite/micro/system_setup.cc \
../tensorflow_lite/tensorflow/lite/micro/test_helpers.cc 

CC_DEPS += \
./tensorflow_lite/tensorflow/lite/micro/all_ops_resolver.d \
./tensorflow_lite/tensorflow/lite/micro/debug_log.d \
./tensorflow_lite/tensorflow/lite/micro/flatbuffer_utils.d \
./tensorflow_lite/tensorflow/lite/micro/memory_helpers.d \
./tensorflow_lite/tensorflow/lite/micro/micro_allocator.d \
./tensorflow_lite/tensorflow/lite/micro/micro_error_reporter.d \
./tensorflow_lite/tensorflow/lite/micro/micro_graph.d \
./tensorflow_lite/tensorflow/lite/micro/micro_interpreter.d \
./tensorflow_lite/tensorflow/lite/micro/micro_profiler.d \
./tensorflow_lite/tensorflow/lite/micro/micro_string.d \
./tensorflow_lite/tensorflow/lite/micro/micro_time.d \
./tensorflow_lite/tensorflow/lite/micro/micro_utils.d \
./tensorflow_lite/tensorflow/lite/micro/mock_micro_graph.d \
./tensorflow_lite/tensorflow/lite/micro/recording_micro_allocator.d \
./tensorflow_lite/tensorflow/lite/micro/recording_simple_memory_allocator.d \
./tensorflow_lite/tensorflow/lite/micro/simple_memory_allocator.d \
./tensorflow_lite/tensorflow/lite/micro/system_setup.d \
./tensorflow_lite/tensorflow/lite/micro/test_helpers.d 

OBJS += \
./tensorflow_lite/tensorflow/lite/micro/all_ops_resolver.o \
./tensorflow_lite/tensorflow/lite/micro/debug_log.o \
./tensorflow_lite/tensorflow/lite/micro/flatbuffer_utils.o \
./tensorflow_lite/tensorflow/lite/micro/memory_helpers.o \
./tensorflow_lite/tensorflow/lite/micro/micro_allocator.o \
./tensorflow_lite/tensorflow/lite/micro/micro_error_reporter.o \
./tensorflow_lite/tensorflow/lite/micro/micro_graph.o \
./tensorflow_lite/tensorflow/lite/micro/micro_interpreter.o \
./tensorflow_lite/tensorflow/lite/micro/micro_profiler.o \
./tensorflow_lite/tensorflow/lite/micro/micro_string.o \
./tensorflow_lite/tensorflow/lite/micro/micro_time.o \
./tensorflow_lite/tensorflow/lite/micro/micro_utils.o \
./tensorflow_lite/tensorflow/lite/micro/mock_micro_graph.o \
./tensorflow_lite/tensorflow/lite/micro/recording_micro_allocator.o \
./tensorflow_lite/tensorflow/lite/micro/recording_simple_memory_allocator.o \
./tensorflow_lite/tensorflow/lite/micro/simple_memory_allocator.o \
./tensorflow_lite/tensorflow/lite/micro/system_setup.o \
./tensorflow_lite/tensorflow/lite/micro/test_helpers.o 


# Each subdirectory must supply rules for building sources it contributes
tensorflow_lite/tensorflow/lite/micro/%.o: ../tensorflow_lite/tensorflow/lite/micro/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C++ Compiler'
	arm-none-eabi-c++ -DDEBUG -D__CODE_RED -D__NEWLIB__ -DCORE_M3 -D__USE_CMSIS=CMSIS_CORE_LPC17xx -D__USE_CMSIS_DSPLIB=CMSIS_DSPLIB_CM3 -DCPP_USE_HEAP -D__LPC17XX__ -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\CMSIS_CORE_LPC17xx\inc" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\CMSIS_DSPLIB_CM3\inc" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite\third_party\flatbuffers\include" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite\third_party\gemmlowp" -I"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\tfliteLPC\tensorflow_lite\third_party\ruy" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fno-rtti -fno-exceptions -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m3 -mthumb -D__NEWLIB__ -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


