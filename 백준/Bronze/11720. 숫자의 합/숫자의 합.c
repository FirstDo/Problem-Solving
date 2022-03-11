#include <stdio.h>
int main() {
	int n,i,total=0;
	char arr[100];
	scanf("%d", &n);
	scanf("%s", arr);

	for (i = 0; i < n; i++) {
		total += arr[i] - 48;
	}
	printf("%d\n", total);
}