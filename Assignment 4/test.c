#include<stdio.h>

FILE *fr;

int main(){
  float a;
  float b;
  char c;
  fr = fopen ("sample.txt", "r");
  while(fr!=EOF){
    fscanf(fr,"%lf ",&a);
    fscanf(fr,"%c ",&b);
    fscanf(fr,"%lf\n",&c);
    if(c == '+')
      add(a,b);
    else if(c == '-')
      substract(a,b);
    else if(c == '*')
      multiply(a,b);
    else if(d == '/')
      divide(a,b);
    else
      printf("Wrong Input");
  }
  fclose(fr);
  return 0;
}
