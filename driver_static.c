#include<stdio.h>
#include "libas.h"
#include "libmd.h"

int main() {
  double a,b,ans;
  char sym='\0',c;
  while(1){
    scanf("%lf %c %lf",&a,&sym,&b);
    c = getchar();
    switch(sym){
        case '+' : ans = add(a,b); break;
        case '-' : ans = sub(a,b); break;
        case '*' : ans = mpy(a,b); break;
        case '/' : ans = div(a,b); break;
        default: fprintf(stderr,"Error: Format\n"); return 1;
    }
    printf("%g\n",ans);
    if(c=='\n') continue;
    else break;
  }
   return 0;
}