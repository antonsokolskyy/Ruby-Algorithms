#include <string.h>

char * string_reverse(char* str) {
  int i, j;
  char temp;
  i=j=temp=0;

  j=strlen(str)-1;
  for (i=0; i<j; i++, j--)
  {
    temp=str[i];
    str[i]=str[j];
    str[j]=temp;
  }
  return str;
}
