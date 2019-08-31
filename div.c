#include <stdio.h>

double div(double a, double b){
	if(b == 0) fprintf(stderr, "%s", "Error: Illegal second operand.\n");
	return a / b;
}