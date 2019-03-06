#include "dep.h"
int put_in_tabl(char*yytext)
{
	char* idname = yytext;
	int i;
	for(i=0;i<100;i++)
	{
		//printf("%s-%s-%s\n",symbol[i][1],symbol[i][0],idname);
		if(strcmp(symbol[i][1],"0")==0)
		{
			break;
		}
		if(strcmp(symbol[i][0],idname)==0)
		{
			valid=1;
			return i;
		}
	}
	valid=0;
	//printf("Hello - %d\n",i);
	//fflush(stdout);
	strcpy(symbol[i][0],idname);
	strcpy(symbol[i][1],"1");
	return i;
}
char *strrev(char *str)
{
      char *p1, *p2;
	//printf("gvv- %s\n",str);
      if (! str || ! *str)
            return str;
      for (p1 = str, p2 = str + strlen(str) - 1; p2 > p1; ++p1, --p2)
      {
            *p1 ^= *p2;
            *p2 ^= *p1;
            *p1 ^= *p2;
      }
      return str;
}

char* itoa(int num,char* str) 
{ 
    int base=10;
    int i = 0; 
    int isNegative = 0; 
  
    /* Handle 0 explicitely, otherwise empty string is printed for 0 */
    if (num == 0) 
    { 
        str[i++] = '0'; 
        str[i] = '\0'; 
        return str; 
    } 
 // printf("tokval=%d\n",tokval);
  
    // In standard itoa(), negative numbers are handled only with  
    // base 10. Otherwise numbers are considered unsigned. 
    if (num < 0 && base == 10) 
    { 
        isNegative = 1; 
        num = -num; 
    } 
    // Process individual digits 
    while (num != 0) 
    { 
        int rem = num % base; 
        str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0'; 
        num = num/base; 
    } 
  
    // If number is negative, append '-' 
    if (isNegative) 
        str[i++] = '-'; 
  
    str[i] = '\0'; // Append string terminator 
  
    // Reverse the string 
    strcpy(str,strrev(str)); 
    return str; 
} 

