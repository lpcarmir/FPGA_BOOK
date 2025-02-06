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
P3_7Segment.elf.size \

ELFCHECK += \
P3_7Segment.elf.elfcheck \


# All Target
all: P3_7Segment.elf secondary-outputs

# Tool invocations
P3_7Segment.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L../../P3_7Segment_bsp/microblaze_0/lib -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.50.c -mno-xl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "P3_7Segment.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

P3_7Segment.elf.size: P3_7Segment.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size P3_7Segment.elf  |tee "P3_7Segment.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

P3_7Segment.elf.elfcheck: P3_7Segment.elf
	@echo 'Invoking: Xilinx ELF Check'
	elfcheck P3_7Segment.elf -hw ../../soft_processor_hw_platform/system.xml -pe microblaze_0  |tee "P3_7Segment.elf.elfcheck"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) P3_7Segment.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
