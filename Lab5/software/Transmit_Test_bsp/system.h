/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2_gen2_0' in SOPC Builder design 'nios_system'
 * SOPC Builder design path: ../../nios_system.sopcinfo
 *
 * Generated: Sun Dec 04 17:08:12 PST 2016
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00010820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x11
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x00008020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x11
#define ALT_CPU_NAME "nios2_gen2_0"
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00008000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00010820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x11
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x00008020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x11
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00008000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_NIOS2_GEN2


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone V"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_BASE 0x11148
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_BASE 0x11148
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_BASE 0x11148
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "nios_system"


/*
 * Transmit_enable configuration
 *
 */

#define ALT_MODULE_CLASS_Transmit_enable altera_avalon_pio
#define TRANSMIT_ENABLE_BASE 0x11000
#define TRANSMIT_ENABLE_BIT_CLEARING_EDGE_REGISTER 0
#define TRANSMIT_ENABLE_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TRANSMIT_ENABLE_CAPTURE 0
#define TRANSMIT_ENABLE_DATA_WIDTH 1
#define TRANSMIT_ENABLE_DO_TEST_BENCH_WIRING 0
#define TRANSMIT_ENABLE_DRIVEN_SIM_VALUE 0
#define TRANSMIT_ENABLE_EDGE_TYPE "NONE"
#define TRANSMIT_ENABLE_FREQ 50000000
#define TRANSMIT_ENABLE_HAS_IN 0
#define TRANSMIT_ENABLE_HAS_OUT 1
#define TRANSMIT_ENABLE_HAS_TRI 0
#define TRANSMIT_ENABLE_IRQ -1
#define TRANSMIT_ENABLE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TRANSMIT_ENABLE_IRQ_TYPE "NONE"
#define TRANSMIT_ENABLE_NAME "/dev/Transmit_enable"
#define TRANSMIT_ENABLE_RESET_VALUE 0
#define TRANSMIT_ENABLE_SPAN 16
#define TRANSMIT_ENABLE_TYPE "altera_avalon_pio"


/*
 * char_received configuration
 *
 */

#define ALT_MODULE_CLASS_char_received altera_avalon_pio
#define CHAR_RECEIVED_BASE 0x11030
#define CHAR_RECEIVED_BIT_CLEARING_EDGE_REGISTER 0
#define CHAR_RECEIVED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CHAR_RECEIVED_CAPTURE 0
#define CHAR_RECEIVED_DATA_WIDTH 1
#define CHAR_RECEIVED_DO_TEST_BENCH_WIRING 0
#define CHAR_RECEIVED_DRIVEN_SIM_VALUE 0
#define CHAR_RECEIVED_EDGE_TYPE "NONE"
#define CHAR_RECEIVED_FREQ 50000000
#define CHAR_RECEIVED_HAS_IN 1
#define CHAR_RECEIVED_HAS_OUT 0
#define CHAR_RECEIVED_HAS_TRI 0
#define CHAR_RECEIVED_IRQ -1
#define CHAR_RECEIVED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CHAR_RECEIVED_IRQ_TYPE "NONE"
#define CHAR_RECEIVED_NAME "/dev/char_received"
#define CHAR_RECEIVED_RESET_VALUE 0
#define CHAR_RECEIVED_SPAN 16
#define CHAR_RECEIVED_TYPE "altera_avalon_pio"


/*
 * char_sent configuration
 *
 */

#define ALT_MODULE_CLASS_char_sent altera_avalon_pio
#define CHAR_SENT_BASE 0x11020
#define CHAR_SENT_BIT_CLEARING_EDGE_REGISTER 0
#define CHAR_SENT_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CHAR_SENT_CAPTURE 0
#define CHAR_SENT_DATA_WIDTH 1
#define CHAR_SENT_DO_TEST_BENCH_WIRING 0
#define CHAR_SENT_DRIVEN_SIM_VALUE 0
#define CHAR_SENT_EDGE_TYPE "NONE"
#define CHAR_SENT_FREQ 50000000
#define CHAR_SENT_HAS_IN 1
#define CHAR_SENT_HAS_OUT 0
#define CHAR_SENT_HAS_TRI 0
#define CHAR_SENT_IRQ -1
#define CHAR_SENT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CHAR_SENT_IRQ_TYPE "NONE"
#define CHAR_SENT_NAME "/dev/char_sent"
#define CHAR_SENT_RESET_VALUE 0
#define CHAR_SENT_SPAN 16
#define CHAR_SENT_TYPE "altera_avalon_pio"


/*
 * cpu_data_in_0 configuration
 *
 */

#define ALT_MODULE_CLASS_cpu_data_in_0 altera_avalon_pio
#define CPU_DATA_IN_0_BASE 0x11100
#define CPU_DATA_IN_0_BIT_CLEARING_EDGE_REGISTER 0
#define CPU_DATA_IN_0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CPU_DATA_IN_0_CAPTURE 0
#define CPU_DATA_IN_0_DATA_WIDTH 8
#define CPU_DATA_IN_0_DO_TEST_BENCH_WIRING 0
#define CPU_DATA_IN_0_DRIVEN_SIM_VALUE 0
#define CPU_DATA_IN_0_EDGE_TYPE "NONE"
#define CPU_DATA_IN_0_FREQ 50000000
#define CPU_DATA_IN_0_HAS_IN 1
#define CPU_DATA_IN_0_HAS_OUT 0
#define CPU_DATA_IN_0_HAS_TRI 0
#define CPU_DATA_IN_0_IRQ -1
#define CPU_DATA_IN_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CPU_DATA_IN_0_IRQ_TYPE "NONE"
#define CPU_DATA_IN_0_NAME "/dev/cpu_data_in_0"
#define CPU_DATA_IN_0_RESET_VALUE 0
#define CPU_DATA_IN_0_SPAN 16
#define CPU_DATA_IN_0_TYPE "altera_avalon_pio"


/*
 * cpu_data_in_1 configuration
 *
 */

#define ALT_MODULE_CLASS_cpu_data_in_1 altera_avalon_pio
#define CPU_DATA_IN_1_BASE 0x11110
#define CPU_DATA_IN_1_BIT_CLEARING_EDGE_REGISTER 0
#define CPU_DATA_IN_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CPU_DATA_IN_1_CAPTURE 0
#define CPU_DATA_IN_1_DATA_WIDTH 8
#define CPU_DATA_IN_1_DO_TEST_BENCH_WIRING 0
#define CPU_DATA_IN_1_DRIVEN_SIM_VALUE 0
#define CPU_DATA_IN_1_EDGE_TYPE "NONE"
#define CPU_DATA_IN_1_FREQ 50000000
#define CPU_DATA_IN_1_HAS_IN 1
#define CPU_DATA_IN_1_HAS_OUT 0
#define CPU_DATA_IN_1_HAS_TRI 0
#define CPU_DATA_IN_1_IRQ -1
#define CPU_DATA_IN_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CPU_DATA_IN_1_IRQ_TYPE "NONE"
#define CPU_DATA_IN_1_NAME "/dev/cpu_data_in_1"
#define CPU_DATA_IN_1_RESET_VALUE 0
#define CPU_DATA_IN_1_SPAN 16
#define CPU_DATA_IN_1_TYPE "altera_avalon_pio"


/*
 * cpu_data_out_0 configuration
 *
 */

#define ALT_MODULE_CLASS_cpu_data_out_0 altera_avalon_pio
#define CPU_DATA_OUT_0_BASE 0x11130
#define CPU_DATA_OUT_0_BIT_CLEARING_EDGE_REGISTER 0
#define CPU_DATA_OUT_0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CPU_DATA_OUT_0_CAPTURE 0
#define CPU_DATA_OUT_0_DATA_WIDTH 8
#define CPU_DATA_OUT_0_DO_TEST_BENCH_WIRING 0
#define CPU_DATA_OUT_0_DRIVEN_SIM_VALUE 0
#define CPU_DATA_OUT_0_EDGE_TYPE "NONE"
#define CPU_DATA_OUT_0_FREQ 50000000
#define CPU_DATA_OUT_0_HAS_IN 0
#define CPU_DATA_OUT_0_HAS_OUT 1
#define CPU_DATA_OUT_0_HAS_TRI 0
#define CPU_DATA_OUT_0_IRQ -1
#define CPU_DATA_OUT_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CPU_DATA_OUT_0_IRQ_TYPE "NONE"
#define CPU_DATA_OUT_0_NAME "/dev/cpu_data_out_0"
#define CPU_DATA_OUT_0_RESET_VALUE 0
#define CPU_DATA_OUT_0_SPAN 16
#define CPU_DATA_OUT_0_TYPE "altera_avalon_pio"


/*
 * cpu_data_out_1 configuration
 *
 */

#define ALT_MODULE_CLASS_cpu_data_out_1 altera_avalon_pio
#define CPU_DATA_OUT_1_BASE 0x11120
#define CPU_DATA_OUT_1_BIT_CLEARING_EDGE_REGISTER 0
#define CPU_DATA_OUT_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CPU_DATA_OUT_1_CAPTURE 0
#define CPU_DATA_OUT_1_DATA_WIDTH 8
#define CPU_DATA_OUT_1_DO_TEST_BENCH_WIRING 0
#define CPU_DATA_OUT_1_DRIVEN_SIM_VALUE 0
#define CPU_DATA_OUT_1_EDGE_TYPE "NONE"
#define CPU_DATA_OUT_1_FREQ 50000000
#define CPU_DATA_OUT_1_HAS_IN 0
#define CPU_DATA_OUT_1_HAS_OUT 1
#define CPU_DATA_OUT_1_HAS_TRI 0
#define CPU_DATA_OUT_1_IRQ -1
#define CPU_DATA_OUT_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CPU_DATA_OUT_1_IRQ_TYPE "NONE"
#define CPU_DATA_OUT_1_NAME "/dev/cpu_data_out_1"
#define CPU_DATA_OUT_1_RESET_VALUE 0
#define CPU_DATA_OUT_1_SPAN 16
#define CPU_DATA_OUT_1_TYPE "altera_avalon_pio"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart
#define JTAG_UART_0_BASE 0x11148
#define JTAG_UART_0_IRQ 5
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8


/*
 * led_data configuration
 *
 */

#define ALT_MODULE_CLASS_led_data altera_avalon_pio
#define LED_DATA_BASE 0x11060
#define LED_DATA_BIT_CLEARING_EDGE_REGISTER 0
#define LED_DATA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LED_DATA_CAPTURE 0
#define LED_DATA_DATA_WIDTH 8
#define LED_DATA_DO_TEST_BENCH_WIRING 0
#define LED_DATA_DRIVEN_SIM_VALUE 0
#define LED_DATA_EDGE_TYPE "NONE"
#define LED_DATA_FREQ 50000000
#define LED_DATA_HAS_IN 0
#define LED_DATA_HAS_OUT 1
#define LED_DATA_HAS_TRI 0
#define LED_DATA_IRQ -1
#define LED_DATA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LED_DATA_IRQ_TYPE "NONE"
#define LED_DATA_NAME "/dev/led_data"
#define LED_DATA_RESET_VALUE 0
#define LED_DATA_SPAN 16
#define LED_DATA_TYPE "altera_avalon_pio"


/*
 * load configuration
 *
 */

#define ALT_MODULE_CLASS_load altera_avalon_pio
#define LOAD_BASE 0x11010
#define LOAD_BIT_CLEARING_EDGE_REGISTER 0
#define LOAD_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LOAD_CAPTURE 0
#define LOAD_DATA_WIDTH 1
#define LOAD_DO_TEST_BENCH_WIRING 0
#define LOAD_DRIVEN_SIM_VALUE 0
#define LOAD_EDGE_TYPE "NONE"
#define LOAD_FREQ 50000000
#define LOAD_HAS_IN 0
#define LOAD_HAS_OUT 1
#define LOAD_HAS_TRI 0
#define LOAD_IRQ -1
#define LOAD_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LOAD_IRQ_TYPE "NONE"
#define LOAD_NAME "/dev/load"
#define LOAD_RESET_VALUE 0
#define LOAD_SPAN 16
#define LOAD_TYPE "altera_avalon_pio"


/*
 * net_data_in configuration
 *
 */

#define ALT_MODULE_CLASS_net_data_in altera_avalon_pio
#define NET_DATA_IN_BASE 0x11050
#define NET_DATA_IN_BIT_CLEARING_EDGE_REGISTER 0
#define NET_DATA_IN_BIT_MODIFYING_OUTPUT_REGISTER 0
#define NET_DATA_IN_CAPTURE 0
#define NET_DATA_IN_DATA_WIDTH 8
#define NET_DATA_IN_DO_TEST_BENCH_WIRING 0
#define NET_DATA_IN_DRIVEN_SIM_VALUE 0
#define NET_DATA_IN_EDGE_TYPE "NONE"
#define NET_DATA_IN_FREQ 50000000
#define NET_DATA_IN_HAS_IN 1
#define NET_DATA_IN_HAS_OUT 0
#define NET_DATA_IN_HAS_TRI 0
#define NET_DATA_IN_IRQ -1
#define NET_DATA_IN_IRQ_INTERRUPT_CONTROLLER_ID -1
#define NET_DATA_IN_IRQ_TYPE "NONE"
#define NET_DATA_IN_NAME "/dev/net_data_in"
#define NET_DATA_IN_RESET_VALUE 0
#define NET_DATA_IN_SPAN 16
#define NET_DATA_IN_TYPE "altera_avalon_pio"


/*
 * net_data_out configuration
 *
 */

#define ALT_MODULE_CLASS_net_data_out altera_avalon_pio
#define NET_DATA_OUT_BASE 0x11040
#define NET_DATA_OUT_BIT_CLEARING_EDGE_REGISTER 0
#define NET_DATA_OUT_BIT_MODIFYING_OUTPUT_REGISTER 0
#define NET_DATA_OUT_CAPTURE 0
#define NET_DATA_OUT_DATA_WIDTH 8
#define NET_DATA_OUT_DO_TEST_BENCH_WIRING 0
#define NET_DATA_OUT_DRIVEN_SIM_VALUE 0
#define NET_DATA_OUT_EDGE_TYPE "NONE"
#define NET_DATA_OUT_FREQ 50000000
#define NET_DATA_OUT_HAS_IN 0
#define NET_DATA_OUT_HAS_OUT 1
#define NET_DATA_OUT_HAS_TRI 0
#define NET_DATA_OUT_IRQ -1
#define NET_DATA_OUT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define NET_DATA_OUT_IRQ_TYPE "NONE"
#define NET_DATA_OUT_NAME "/dev/net_data_out"
#define NET_DATA_OUT_RESET_VALUE 0
#define NET_DATA_OUT_SPAN 16
#define NET_DATA_OUT_TYPE "altera_avalon_pio"


/*
 * onchip_memory2_0 configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory2_0 altera_avalon_onchip_memory2
#define ONCHIP_MEMORY2_0_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_0_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_0_BASE 0x8000
#define ONCHIP_MEMORY2_0_CONTENTS_INFO ""
#define ONCHIP_MEMORY2_0_DUAL_PORT 0
#define ONCHIP_MEMORY2_0_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_INIT_CONTENTS_FILE "nios_system_onchip_memory2_0"
#define ONCHIP_MEMORY2_0_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY2_0_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_0_IRQ -1
#define ONCHIP_MEMORY2_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY2_0_NAME "/dev/onchip_memory2_0"
#define ONCHIP_MEMORY2_0_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_0_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_0_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY2_0_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_0_SIZE_VALUE 20480
#define ONCHIP_MEMORY2_0_SPAN 20480
#define ONCHIP_MEMORY2_0_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_0_WRITABLE 1


/*
 * read_inc1 configuration
 *
 */

#define ALT_MODULE_CLASS_read_inc1 altera_avalon_pio
#define READ_INC1_BASE 0x11090
#define READ_INC1_BIT_CLEARING_EDGE_REGISTER 0
#define READ_INC1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define READ_INC1_CAPTURE 0
#define READ_INC1_DATA_WIDTH 1
#define READ_INC1_DO_TEST_BENCH_WIRING 0
#define READ_INC1_DRIVEN_SIM_VALUE 0
#define READ_INC1_EDGE_TYPE "NONE"
#define READ_INC1_FREQ 50000000
#define READ_INC1_HAS_IN 0
#define READ_INC1_HAS_OUT 1
#define READ_INC1_HAS_TRI 0
#define READ_INC1_IRQ -1
#define READ_INC1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define READ_INC1_IRQ_TYPE "NONE"
#define READ_INC1_NAME "/dev/read_inc1"
#define READ_INC1_RESET_VALUE 0
#define READ_INC1_SPAN 16
#define READ_INC1_TYPE "altera_avalon_pio"


/*
 * read_inc2 configuration
 *
 */

#define ALT_MODULE_CLASS_read_inc2 altera_avalon_pio
#define READ_INC2_BASE 0x110a0
#define READ_INC2_BIT_CLEARING_EDGE_REGISTER 0
#define READ_INC2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define READ_INC2_CAPTURE 0
#define READ_INC2_DATA_WIDTH 1
#define READ_INC2_DO_TEST_BENCH_WIRING 0
#define READ_INC2_DRIVEN_SIM_VALUE 0
#define READ_INC2_EDGE_TYPE "NONE"
#define READ_INC2_FREQ 50000000
#define READ_INC2_HAS_IN 0
#define READ_INC2_HAS_OUT 1
#define READ_INC2_HAS_TRI 0
#define READ_INC2_IRQ -1
#define READ_INC2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define READ_INC2_IRQ_TYPE "NONE"
#define READ_INC2_NAME "/dev/read_inc2"
#define READ_INC2_RESET_VALUE 0
#define READ_INC2_SPAN 16
#define READ_INC2_TYPE "altera_avalon_pio"


/*
 * ready_to_transfer_in_0 configuration
 *
 */

#define ALT_MODULE_CLASS_ready_to_transfer_in_0 altera_avalon_pio
#define READY_TO_TRANSFER_IN_0_BASE 0x110f0
#define READY_TO_TRANSFER_IN_0_BIT_CLEARING_EDGE_REGISTER 0
#define READY_TO_TRANSFER_IN_0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define READY_TO_TRANSFER_IN_0_CAPTURE 0
#define READY_TO_TRANSFER_IN_0_DATA_WIDTH 1
#define READY_TO_TRANSFER_IN_0_DO_TEST_BENCH_WIRING 0
#define READY_TO_TRANSFER_IN_0_DRIVEN_SIM_VALUE 0
#define READY_TO_TRANSFER_IN_0_EDGE_TYPE "NONE"
#define READY_TO_TRANSFER_IN_0_FREQ 50000000
#define READY_TO_TRANSFER_IN_0_HAS_IN 1
#define READY_TO_TRANSFER_IN_0_HAS_OUT 0
#define READY_TO_TRANSFER_IN_0_HAS_TRI 0
#define READY_TO_TRANSFER_IN_0_IRQ -1
#define READY_TO_TRANSFER_IN_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define READY_TO_TRANSFER_IN_0_IRQ_TYPE "NONE"
#define READY_TO_TRANSFER_IN_0_NAME "/dev/ready_to_transfer_in_0"
#define READY_TO_TRANSFER_IN_0_RESET_VALUE 0
#define READY_TO_TRANSFER_IN_0_SPAN 16
#define READY_TO_TRANSFER_IN_0_TYPE "altera_avalon_pio"


/*
 * ready_to_transfer_in_1 configuration
 *
 */

#define ALT_MODULE_CLASS_ready_to_transfer_in_1 altera_avalon_pio
#define READY_TO_TRANSFER_IN_1_BASE 0x110e0
#define READY_TO_TRANSFER_IN_1_BIT_CLEARING_EDGE_REGISTER 0
#define READY_TO_TRANSFER_IN_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define READY_TO_TRANSFER_IN_1_CAPTURE 0
#define READY_TO_TRANSFER_IN_1_DATA_WIDTH 1
#define READY_TO_TRANSFER_IN_1_DO_TEST_BENCH_WIRING 0
#define READY_TO_TRANSFER_IN_1_DRIVEN_SIM_VALUE 0
#define READY_TO_TRANSFER_IN_1_EDGE_TYPE "NONE"
#define READY_TO_TRANSFER_IN_1_FREQ 50000000
#define READY_TO_TRANSFER_IN_1_HAS_IN 1
#define READY_TO_TRANSFER_IN_1_HAS_OUT 0
#define READY_TO_TRANSFER_IN_1_HAS_TRI 0
#define READY_TO_TRANSFER_IN_1_IRQ -1
#define READY_TO_TRANSFER_IN_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define READY_TO_TRANSFER_IN_1_IRQ_TYPE "NONE"
#define READY_TO_TRANSFER_IN_1_NAME "/dev/ready_to_transfer_in_1"
#define READY_TO_TRANSFER_IN_1_RESET_VALUE 0
#define READY_TO_TRANSFER_IN_1_SPAN 16
#define READY_TO_TRANSFER_IN_1_TYPE "altera_avalon_pio"


/*
 * scanner_rst configuration
 *
 */

#define ALT_MODULE_CLASS_scanner_rst altera_avalon_pio
#define SCANNER_RST_BASE 0x110b0
#define SCANNER_RST_BIT_CLEARING_EDGE_REGISTER 0
#define SCANNER_RST_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SCANNER_RST_CAPTURE 0
#define SCANNER_RST_DATA_WIDTH 1
#define SCANNER_RST_DO_TEST_BENCH_WIRING 0
#define SCANNER_RST_DRIVEN_SIM_VALUE 0
#define SCANNER_RST_EDGE_TYPE "NONE"
#define SCANNER_RST_FREQ 50000000
#define SCANNER_RST_HAS_IN 0
#define SCANNER_RST_HAS_OUT 1
#define SCANNER_RST_HAS_TRI 0
#define SCANNER_RST_IRQ -1
#define SCANNER_RST_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SCANNER_RST_IRQ_TYPE "NONE"
#define SCANNER_RST_NAME "/dev/scanner_rst"
#define SCANNER_RST_RESET_VALUE 0
#define SCANNER_RST_SPAN 16
#define SCANNER_RST_TYPE "altera_avalon_pio"


/*
 * start_scanning configuration
 *
 */

#define ALT_MODULE_CLASS_start_scanning altera_avalon_pio
#define START_SCANNING_BASE 0x110d0
#define START_SCANNING_BIT_CLEARING_EDGE_REGISTER 0
#define START_SCANNING_BIT_MODIFYING_OUTPUT_REGISTER 0
#define START_SCANNING_CAPTURE 0
#define START_SCANNING_DATA_WIDTH 8
#define START_SCANNING_DO_TEST_BENCH_WIRING 0
#define START_SCANNING_DRIVEN_SIM_VALUE 0
#define START_SCANNING_EDGE_TYPE "NONE"
#define START_SCANNING_FREQ 50000000
#define START_SCANNING_HAS_IN 0
#define START_SCANNING_HAS_OUT 1
#define START_SCANNING_HAS_TRI 0
#define START_SCANNING_IRQ -1
#define START_SCANNING_IRQ_INTERRUPT_CONTROLLER_ID -1
#define START_SCANNING_IRQ_TYPE "NONE"
#define START_SCANNING_NAME "/dev/start_scanning"
#define START_SCANNING_RESET_VALUE 0
#define START_SCANNING_SPAN 16
#define START_SCANNING_TYPE "altera_avalon_pio"


/*
 * start_transfer configuration
 *
 */

#define ALT_MODULE_CLASS_start_transfer altera_avalon_pio
#define START_TRANSFER_BASE 0x110c0
#define START_TRANSFER_BIT_CLEARING_EDGE_REGISTER 0
#define START_TRANSFER_BIT_MODIFYING_OUTPUT_REGISTER 0
#define START_TRANSFER_CAPTURE 0
#define START_TRANSFER_DATA_WIDTH 8
#define START_TRANSFER_DO_TEST_BENCH_WIRING 0
#define START_TRANSFER_DRIVEN_SIM_VALUE 0
#define START_TRANSFER_EDGE_TYPE "NONE"
#define START_TRANSFER_FREQ 50000000
#define START_TRANSFER_HAS_IN 0
#define START_TRANSFER_HAS_OUT 1
#define START_TRANSFER_HAS_TRI 0
#define START_TRANSFER_IRQ -1
#define START_TRANSFER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define START_TRANSFER_IRQ_TYPE "NONE"
#define START_TRANSFER_NAME "/dev/start_transfer"
#define START_TRANSFER_RESET_VALUE 0
#define START_TRANSFER_SPAN 16
#define START_TRANSFER_TYPE "altera_avalon_pio"


/*
 * sysid_qsys_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sysid_qsys_0 altera_avalon_sysid_qsys
#define SYSID_QSYS_0_BASE 0x11140
#define SYSID_QSYS_0_ID 0
#define SYSID_QSYS_0_IRQ -1
#define SYSID_QSYS_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_QSYS_0_NAME "/dev/sysid_qsys_0"
#define SYSID_QSYS_0_SPAN 8
#define SYSID_QSYS_0_TIMESTAMP 1480898402
#define SYSID_QSYS_0_TYPE "altera_avalon_sysid_qsys"


/*
 * wr_en1 configuration
 *
 */

#define ALT_MODULE_CLASS_wr_en1 altera_avalon_pio
#define WR_EN1_BASE 0x11070
#define WR_EN1_BIT_CLEARING_EDGE_REGISTER 0
#define WR_EN1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define WR_EN1_CAPTURE 0
#define WR_EN1_DATA_WIDTH 1
#define WR_EN1_DO_TEST_BENCH_WIRING 0
#define WR_EN1_DRIVEN_SIM_VALUE 0
#define WR_EN1_EDGE_TYPE "NONE"
#define WR_EN1_FREQ 50000000
#define WR_EN1_HAS_IN 0
#define WR_EN1_HAS_OUT 1
#define WR_EN1_HAS_TRI 0
#define WR_EN1_IRQ -1
#define WR_EN1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define WR_EN1_IRQ_TYPE "NONE"
#define WR_EN1_NAME "/dev/wr_en1"
#define WR_EN1_RESET_VALUE 0
#define WR_EN1_SPAN 16
#define WR_EN1_TYPE "altera_avalon_pio"


/*
 * wr_en2 configuration
 *
 */

#define ALT_MODULE_CLASS_wr_en2 altera_avalon_pio
#define WR_EN2_BASE 0x11080
#define WR_EN2_BIT_CLEARING_EDGE_REGISTER 0
#define WR_EN2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define WR_EN2_CAPTURE 0
#define WR_EN2_DATA_WIDTH 1
#define WR_EN2_DO_TEST_BENCH_WIRING 0
#define WR_EN2_DRIVEN_SIM_VALUE 0
#define WR_EN2_EDGE_TYPE "NONE"
#define WR_EN2_FREQ 50000000
#define WR_EN2_HAS_IN 0
#define WR_EN2_HAS_OUT 1
#define WR_EN2_HAS_TRI 0
#define WR_EN2_IRQ -1
#define WR_EN2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define WR_EN2_IRQ_TYPE "NONE"
#define WR_EN2_NAME "/dev/wr_en2"
#define WR_EN2_RESET_VALUE 0
#define WR_EN2_SPAN 16
#define WR_EN2_TYPE "altera_avalon_pio"

#endif /* __SYSTEM_H_ */
