################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../main.c 

OBJS += \
./main.o 

C_DEPS += \
./main.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: RISC-V GCC/Newlib C Compiler'
	riscv64-unknown-elf-gcc -mabi=ilp32 -march=rv32im -I"D:\Work\SoftConsole\IGL2_RISCV_Systick_Blinky\hal" -I"D:\Work\SoftConsole\IGL2_RISCV_Systick_Blinky\riscv_hal" -I"D:\Work\SoftConsole\IGL2_RISCV_Systick_Blinky\drivers\CoreGPIO" -I"D:\Work\SoftConsole\IGL2_RISCV_Systick_Blinky\drivers\CoreUARTapb" -Os -ffunction-sections -fdata-sections -Wall -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


