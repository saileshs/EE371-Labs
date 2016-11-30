/*
 * scanner_integration.c
 *
 *  Created on: Nov 30, 2016
 *      Author: borenl93
 */

#include "sys/alt_stdio.h"
#include "unistd.h"

#define data_out_0 (volatile char*) 0x00011090
#define data_out_1 (volatile char*) 0x00011080
#define ready_to_transfer_0 (volatile char*) 0x00011050
#define ready_to_transfer_1 (volatile char*) 0x00011040
#define start_scanning (volatile char*) 0x00011030
#define start_transfer (volatile char*) 0x00011020
#define scanner_rst (volatile char*) 0x00011010
#define scanner_clk_ctrl (volatile char*) 0x00011000

void send(){
	*scanner_clk_ctrl = 1;
	usleep(100);
	*scanner_clk_ctrl = 0;
}

void scanner_init(){
	*scanner_clk_ctrl = 0;
	*scanner_rst = 0;
	*start_scanning = 1;
	*start_transfer = 1;
	send();
	*scanner_rst = 1;
}

int main(){
	int i = 0;

	scanner_init();


	*start_scanning = 0;
	*data_out_0 = 5;
	send();
	*start_scanning = 1;

	for(i=1; i<8; i++){
		*data_out_0 = 5 + i;
		send();
	}

	if(*ready_to_transfer_0 == 0){
		alt_putstr("scanner 0 not ready\n");
	}else{
		alt_putstr("ready to transfer 0\n");
	}






	return 0;
}



