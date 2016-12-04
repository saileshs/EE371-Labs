#define switches (volatile char*) 0x00011010
#define leds ( char*) 0x00011000

void main()
{
	while(1){
		*leds = *switches;
	}

}



