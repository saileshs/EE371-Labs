/*
 * scanner_integration.c
 *
 *  Created on: Nov 30, 2016
 *      Author: borenl93
 */

#include "sys/alt_stdio.h"
#include "unistd.h"

#define data_out_0 (volatile char*) 0x000110c0
#define data_out_1 (volatile char*) 0x000110b0
#define data_in_0 (volatile char*) 0x00011090
#define data_in_1 (volatile char*) 0x000110a0
#define ready_to_transfer_0 (volatile char*) 0x00011080
#define ready_to_transfer_1 (volatile char*) 0x00011070
#define start_scanning (volatile char*) 0x00011060
#define start_transfer (volatile char*) 0x00011050
#define scanner_rst (volatile char*) 0x00011040
#define wr_en_1 (volatile char*) 0x00011000
#define wr_en_2 (volatile char*) 0x00011010
#define read_inc_1 (volatile char*) 0x00011020
#define read_inc_2 (volatile char*) 0x00011030




void scanner_init(){
	*scanner_rst = 0;
	*start_scanning = 0;
	*start_transfer = 0;
	*scanner_rst = 1;
	*wr_en_1 = 0;
	*wr_en_2 = 0;
	*read_inc_1 = 0;
	*read_inc_2 = 0;
}

void scan_inq(){
	char buf = 'n';
	while (buf == 'n'){
		alt_putstr("start scanning?(y/n)\n");
		buf = alt_getchar();
		alt_getchar();
		if(buf == 'y'){
			*start_scanning = 1;
			*start_scanning = 0;
			alt_putstr("scanning...\n");
		} else {
			*start_scanning = 0;
		}
	}
}

int main(){
	int i = 0;
	char buf1 = 'n';
	scanner_init();
	alt_putstr("\nscanners initialized\n");
	usleep(10);

	scan_inq();

	while(1){

	for(i=0; i<10; i++){
		*data_out_0 = i;
		*wr_en_1 = 1;
		usleep(500000);
		*wr_en_1 = 0;
		if (*ready_to_transfer_0 == 1 && i == 8) {
			alt_putstr("\nscanner 1 ready to transfer\n");
		}
	}
	usleep(10);
	*data_out_0 = 0;


		alt_putstr("start scanner 1 transfer?(y/n)\n");
		buf1 = alt_getchar();
		alt_getchar();
		if(buf1 == 'y'){
			*start_transfer = 1;
			*start_transfer = 0;
			alt_putstr("transferring...\n");
			for(i=0; i<10; i++){
				alt_putchar(*data_in_0 + '0');
				alt_putstr("\n");
				*read_inc_1 = 1;
				usleep(10);
				*read_inc_1 = 0;
				usleep(500000);
			}
			alt_putstr("transfer complete\n");
			scan_inq();
		}


		for(i=0; i<10; i++){
			*data_out_1 = i;
			*wr_en_2 = 1;
			usleep(500000);
			*wr_en_2 = 0;
			if (*ready_to_transfer_1 == 1 && i == 8) {
				alt_putstr("\nscanner 2 ready to transfer\n");
			}
		}
		*data_out_1 = 0;


		alt_putstr("start scanner 2 transfer?(y/n)\n");
		buf1 = alt_getchar();
		alt_getchar();
		if(buf1 == 'y'){
			*start_transfer = 1;
			*start_transfer = 0;
			alt_putstr("transferring...\n");

			for(i=0; i<10; i++){
				alt_putchar(*data_in_1 + '0');
				alt_putstr("\n");
				*read_inc_2 = 1;
				usleep(10);
				*read_inc_2 = 0;
				usleep(500000);
			}
			alt_putstr("transfer complete\n");
			scan_inq();
		}

	}


	return 0;
}



