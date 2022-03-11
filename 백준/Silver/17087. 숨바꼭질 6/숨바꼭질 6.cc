#include <iostream>
#include <vector>

using namespace std;

int GCD(int a,int b) {
	if (b == 0)
		return a;
	else 
		return GCD(b, a % b);
}

int main(void){
	ios_base::sync_with_stdio(false);
	cin.tie(nullptr);
	cout.tie(nullptr);

	int N, S;
	cin >> N>>S;

	int arr[100000] = { 0, };
	for (int i = 0; i < N; i++) {
		cin >> arr[i];
		arr[i] = abs(S-arr[i]);
	}
	int D = arr[0];
	for (int i = 1; i < N; i++) {
		D = GCD(D, arr[i]);
	}
	cout << D << '\n';
	return 0;
}