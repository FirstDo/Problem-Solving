#include <stdio.h>
int main() {
	int num,temp,newnum,count=0;
	scanf("%d", &num);
	temp = num;
	do{
		newnum = num / 10 + num % 10;
		num = num % 10 * 10 + newnum % 10;
		count++;
	} while (temp != num);
	printf("%d", count);
}