/*
 * receive.c
 *
 *  Created on: Dec 5, 2016
 *      Author: zhangw24
 */

#include "sys/alt_stdio.h"
#include "unistd.h"



#define transmit_en (volatile char*)   0x00011060
#define char_received (volatile char*) 0x00011090
#define char_sent (volatile char*) 0x00011080
#define load (volatile char*) 0x00011070
#define net_data_in (volatile char*) 0x000110b0
#define net_data_out (volatile char*) 0x000110a0

#define data_out_0 (volatile char*) 0x00011190
#define data_out_1 (volatile char*) 0x00011180

#define data_in_0 (volatile char*)  0x00011160
#define data_in_1 (volatile char*) 0x00011170

#define ready_to_transfer_0 (volatile char*) 0x00011150
#define ready_to_transfer_1 (volatile char*) 0x00011140
#define start_scanning (volatile char*) 0x00011130
#define start_transfer (volatile char*) 0x00011120
#define scanner_rst (volatile char*)    0x00011110
#define wr_en_1 (volatile char*) 0x000110d0
#define wr_en_2 (volatile char*) 0x000110e0
#define read_inc_1 (volatile char*) 0x000110f0
#define read_inc_2 (volatile char*) 0x00011100


#define start_scan_receive (volatile char*) 0x00011050
#define start_scan_send (volatile char*) 0x00011040

#define ready_transfer_send (volatile char*) 0x00011030
#define ready_transfer_receive (volatile char*) 0x00011020
#define transfer_receive (volatile char*) 0x00011010
#define transfer_send (volatile char*) 0x00011000

void reset(){
	*start_scan_send = 0;
	*ready_transfer_send = 0;
	*transfer_send = 0;
}

int main(){
	char buf = 'n';
	int i;
	reset();
	alt_printf("Initialized\n");

	while(1){
		while(buf == 'n'){
			alt_printf("start scanning?(y/n)\n");
			buf = alt_getchar();
			alt_getchar();
			if(buf == 'y'){
				*start_scan_send = 1;
				usleep(10);
				*start_scan_send = 0;
			}
		}
		alt_printf("waiting...\n");
		//*ready_transfer_send = 1;
		while(*ready_transfer_receive == 0){
			//alt_printf("1");
		}
		if(*ready_transfer_receive == 1){
			alt_printf("ready to transfer\n");
			alt_printf("transfer?(y/n)\n");
			buf = alt_getchar();
			alt_getchar();
			if(buf == 'y'){
				*transfer_send = 1;
				//if(*transfer_receive == 1){
				//	alt_printf("transfer signal received\n");
				//}


				for(i=0; i<10; i++){
					while(1){
						if(*char_received == 1){
							alt_putchar(*net_data_in + '0');
							break;
						}
					}
				}
				*transfer_send = 0;
			}

		}
		buf = 'n';
		alt_printf("\n");
	}


	return 0;
}
