#define switches (volatile char*) 0x0003010
#define leds(volatile char*) 0x0003000

void main()
{
	while(1)
		*leds = *switches;
}