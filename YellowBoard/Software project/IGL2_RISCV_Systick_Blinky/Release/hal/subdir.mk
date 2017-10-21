################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../hal/hal_irq.c \
../hal/hw_reg_access.c 

OBJS += \
./hal/hal_irq.o \
./hal/hw_reg_access.o 

C_DEPS += \
./hal/hal_irq.d \
./hal/hw_reg_access.d 


# Each subdirectory must supply rules for building sources it contributes
hal/%.o: ../hal/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: RISC-V GCC/Newlib C Compiler'
	riscv64-unknown-elf-gcc -mabi=ilp32 -march=rv32im -I"D:\Work\SoftConsole\IGL2_RISCV_Systick_Blinky\hal" -I"D:\Work\SoftConsole\IGL2_RISCV_Systick_Blinky\riscv_hal" -I"D:\Work\SoftConsole\IGL2_RISCV_Systick_Blinky\drivers\CoreGPIO" -I"D:\Work\SoftConsole\IGL2_RISCV_Systick_Blinky\drivers\CoreUARTapb" -Os -ffunction-sections -fdata-sections -Wall -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


