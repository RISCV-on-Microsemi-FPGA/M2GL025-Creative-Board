################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/CoreUARTapb/core_uart_apb.c 

OBJS += \
./drivers/CoreUARTapb/core_uart_apb.o 

C_DEPS += \
./drivers/CoreUARTapb/core_uart_apb.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/CoreUARTapb/%.o: ../drivers/CoreUARTapb/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: RISC-V GCC/Newlib C Compiler'
	riscv64-unknown-elf-gcc -mabi=ilp32 -march=rv32im -I"D:\Work\SoftConsole\IGL2_RISCV_Systick_Blinky\hal" -I"D:\Work\SoftConsole\IGL2_RISCV_Systick_Blinky\riscv_hal" -I"D:\Work\SoftConsole\IGL2_RISCV_Systick_Blinky\drivers\CoreGPIO" -I"D:\Work\SoftConsole\IGL2_RISCV_Systick_Blinky\drivers\CoreUARTapb" -Os -ffunction-sections -fdata-sections -Wall -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


