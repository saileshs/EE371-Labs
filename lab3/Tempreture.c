#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_BUF 64

void main(void)
{

   float temp_buf;
   float temp_result;
   char unit_o[MAX_BUF];
   char unit_d[MAX_BUF];

   printf("Welcome to tempreture converter\n");

   while(1){
       printf("Please enter the tempreture value\n");

       scanf("%f", &temp_buf);


       printf("Please enter the scale of this tempreture in Celsius, Fahrenheit or Kelvin\n");
       scanf("%s", unit_o);


       printf("Please enter the scale of the tempreture you wish to convert it into\n");
       scanf("%s", unit_d);


       if(unit_o[0] == 'C' || unit_o[0] == 'c'){
          temp_buf = temp_buf;
       } else if (unit_o[0] == 'F' || unit_o[0] == 'f'){
          temp_buf = (temp_buf - 32)/1.8;
       } else if (unit_o[0] == 'K' || unit_o[0] == 'k'){
          temp_buf = temp_buf - 273.15;
       }

       if(unit_d[0] == 'C' || unit_d[0] == 'c'){
          temp_result = temp_buf;
       } else if (unit_d[0] == 'F' || unit_d[0] == 'f'){
          temp_result = temp_buf * 1.8 + 32;
       } else if (unit_d[0] == 'K' || unit_d[0] == 'k'){
          temp_result = temp_buf + 273.15;
       }

       printf("The resulting tempreture is %.3f %c \n\n", temp_result, unit_d[0]);
   }
   return;
}
