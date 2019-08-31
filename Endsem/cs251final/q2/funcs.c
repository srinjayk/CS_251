long long int add(long long int a, long long int b){
	return a+b;
}
long long int sub(long long int a, long long int b){
	return a-b;
}
long long int ltll(long long int a, long long int b){
	return a<b;
}
int ltf(float a, float b){
	return a<b;
}
int lteqf(float a, float b){
	return a<=b;
}
void swap(float *a, float *b){
	float temp=*a;
	*a = *b;
	*b = temp;
}