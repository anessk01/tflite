################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include tensorflow_lite/tensorflow/lite/schema/subdir.mk
-include tensorflow_lite/tensorflow/lite/micro/memory_planner/subdir.mk
-include tensorflow_lite/tensorflow/lite/micro/kernels/subdir.mk
-include tensorflow_lite/tensorflow/lite/micro/subdir.mk
-include tensorflow_lite/tensorflow/lite/kernels/internal/reference/subdir.mk
-include tensorflow_lite/tensorflow/lite/kernels/internal/subdir.mk
-include tensorflow_lite/tensorflow/lite/kernels/subdir.mk
-include tensorflow_lite/tensorflow/lite/core/api/subdir.mk
-include tensorflow_lite/tensorflow/lite/c/subdir.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: tfliteLPC.axf

# Tool invocations
tfliteLPC.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MCU C++ Linker'
	arm-none-eabi-c++ -nostdlib -L"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\CMSIS_CORE_LPC17xx\Debug" -L"C:\Users\aness\Documents\MCUXpressoIDE_11.3.1_5262\workspace2\CMSIS_DSPLIB_CM3\lib" -Xlinker -Map="tfliteLPC.map" -Xlinker --cref -Xlinker --gc-sections -Xlinker -print-memory-usage -mcpu=cortex-m3 -mthumb -T "tfliteLPC_Debug.ld" -o "tfliteLPC.axf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(CC_DEPS)$(C++_DEPS)$(EXECUTABLES)$(C_UPPER_DEPS)$(CXX_DEPS)$(OBJS)$(CPP_DEPS)$(C_DEPS) tfliteLPC.axf
	-@echo ' '

post-build:
	-@echo 'Performing post-build steps'
	-arm-none-eabi-size "tfliteLPC.axf" ; arm-none-eabi-objcopy -v -O binary "tfliteLPC.axf" "tfliteLPC.bin" ; # checksum -p LPC1768 -d "tfliteLPC.bin"
	-@echo ' '

.PHONY: all clean dependents post-build

-include ../makefile.targets
