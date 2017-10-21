################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include riscv_hal/subdir.mk
-include hal/subdir.mk
-include drivers/CoreUARTapb/subdir.mk
-include drivers/CoreGPIO/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_FLASH += \
IGL2_RISCV_Systick_Blinky.hex \

SECONDARY_LIST += \
IGL2_RISCV_Systick_Blinky.lst \

SECONDARY_SIZE += \
IGL2_RISCV_Systick_Blinky.siz \


# All Target
all: IGL2_RISCV_Systick_Blinky.elf secondary-outputs

# Tool invocations
IGL2_RISCV_Systick_Blinky.elf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: RISC-V GCC/Newlib C Linker'
	riscv64-unknown-elf-gcc -mabi=ilp32 -march=rv32im -T"D:\Work\SoftConsole\IGL2_RISCV_Systick_Blinky\Linker_Run_from_NVM.lds" -nostartfiles -Wl,--gc-sections -Wl,-Map,IGL2_RISCV_Systick_Blinky.map -o "IGL2_RISCV_Systick_Blinky.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

IGL2_RISCV_Systick_Blinky.hex: IGL2_RISCV_Systick_Blinky.elf
	@echo 'Invoking: RISC-V GCC/Newlib GNU Create Flash Image'
	riscv64-unknown-elf-objcopy -O ihex IGL2_RISCV_Systick_Blinky.elf  "IGL2_RISCV_Systick_Blinky.hex"
	@echo 'Finished building: $@'
	@echo ' '

IGL2_RISCV_Systick_Blinky.lst: IGL2_RISCV_Systick_Blinky.elf
	@echo 'Invoking: RISC-V GCC/Newlib Create Listing'
	riscv64-unknown-elf-objdump -h -S IGL2_RISCV_Systick_Blinky.elf > "IGL2_RISCV_Systick_Blinky.lst"
	@echo 'Finished building: $@'
	@echo ' '

IGL2_RISCV_Systick_Blinky.siz: IGL2_RISCV_Systick_Blinky.elf
	@echo 'Invoking: RISC-V GCC/Newlib Print Size'
	riscv64-unknown-elf-size --format=berkeley "IGL2_RISCV_Systick_Blinky.elf"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(SECONDARY_FLASH)$(SECONDARY_LIST)$(SECONDARY_SIZE)$(ASM_DEPS)$(S_UPPER_DEPS)$(C_DEPS) IGL2_RISCV_Systick_Blinky.elf
	-@echo ' '

secondary-outputs: $(SECONDARY_FLASH) $(SECONDARY_LIST) $(SECONDARY_SIZE)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
