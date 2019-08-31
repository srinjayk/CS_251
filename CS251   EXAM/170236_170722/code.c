#include<stdio.h>
#include<string.h>
#include"basic.h"

int main(){
   char fname[128];
  // printf("Enter .txt file name:\n");
  // scanf("%s",fname);
  // if(strlen(fname)==0){
  //   printf("Please mention file name\n");
  // }
  // strcat(fname,".txt");
  FILE *fp;
  fp=fopen("/home/srinjayk/Desktop/170236_170722/input.txt","r");
  if(fp==NULL)
  {
    printf("%s File NOT FOUND!",fname);
    return 0;
  }
  float a,b;
  char c;
  char d='a';
  while(d!=EOF){
    fscanf(fp,"%f ",&a);
    fscanf(fp,"%c ",&c);
    fscanf(fp,"%f",&b);
    if(c=='+'){
      printf("Addition: %g\n",add(a,b));
    }
    else if(c=='-'){
      printf("Substraction: %g\n",sub(a,b));
    }
    else if(c=='*'){
      printf("Multiplication: %g\n",mpy(a,b));
    }
    else if(c=='/'){
      if(b==0){
        printf("Invalid input\n");
      }else{
        printf("Division: %g\n",div(a,b));
      }
    }
    else{
      printf("Invalid Input\n");
    }
    d=fgetc(fp);
  }
  fclose(fp);
  return 0;
}
