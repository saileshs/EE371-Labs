#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

#define del_wire 180
#define del_device 5000
void main(void){

    int dev_num;
    float result_ps;
    float result_ns;

    printf("This program can help you calculate the total delay\n");
    printf("of signal through your logic circuit \n\n");

    while(1){
        printf("Please enter the number of logic devices you have\n");
        scanf("%d", &dev_num);

        result_ps = dev_num * del_device + (dev_num - 1) * (del_wire * 0.1);
        result_ns = result_ps/1000;

        printf("The total delay of the path is %.f picoseconds or %.2f nanoseconds \n\n", result_ps, result_ns);
    }
    return;
}
