################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
P5_Serial_Port.elf.size \

ELFCHECK += \
P5_Serial_Port.elf.elfcheck \


# All Target
all: P5_Serial_Port.elf secondary-outputs

# Tool invocations
P5_Serial_Port.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L../../P5_Serial_Port_bsp/microblaze_0/lib -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.50.c -mno-xl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "P5_Serial_Port.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

P5_Serial_Port.elf.size: P5_Serial_Port.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size P5_Serial_Port.elf  |tee "P5_Serial_Port.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

P5_Serial_Port.elf.elfcheck: P5_Serial_Port.elf
	@echo 'Invoking: Xilinx ELF Check'
	elfcheck P5_Serial_Port.elf -hw ../../soft_processor_hw_platform/system.xml -pe microblaze_0  |tee "P5_Serial_Port.elf.elfcheck"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) P5_Serial_Port.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
