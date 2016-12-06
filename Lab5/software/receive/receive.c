/*
 * receive.c
 *
 *  Created on: Dec 5, 2016
 *      Author: zhangw24
 */

#include "sys/alt_stdio.h"
#include "unistd.h"



#define transmit_en (volatile char*) 0x00011000
#define char_received (volatile char*) 0x00011030
#define char_sent (volatile char*) 0x00011020
#define load (volatile char*) 0x00011010
#define net_data_in (volatile char*) 0x00011050
#define net_data_out (volatile char*) 0x00011040

#define data_out_0 (volatile char*) 0x00011130
#define data_out_1 (volatile char*) 0x00011120
#define data_in_0 (volatile char*)  0x00011100
#define data_in_1 (volatile char*) 0x00011110
#define ready_to_transfer_0 (volatile char*) 0x000110f0
#define ready_to_transfer_1 (volatile char*) 0x000110e0
#define start_scanning (volatile char*) 0x000110d0
#define start_transfer (volatile char*) 0x000110c0
#define scanner_rst (volatile char*)    0x000110b0
#define wr_en_1 (volatile char*) 0x00011070
#define wr_en_2 (volatile char*) 0x00011080
#define read_inc_1 (volatile char*) 0x00011090
#define read_inc_2 (volatile char*) 0x000110a0


int main(){
	while(1){
		if(*char_received == 1){
			alt_putchar(*net_data_in);
		}
	}

	return 0;
}
