#include <iostream>

using namespace std;

const int MAX = 1000000;
bool check[MAX];
int prime[MAX];
int idx;

void GetPrime(void) {
	for (int i = 2; i <= MAX; i++) {
		if (check[i] == false) {
			prime[idx++] = i;
			for (int j = i * 2; j <= MAX; j += i) {
				check[j] = true;
			}
		}
	}
}

int main(void){
	ios_base::sync_with_stdio(false);
	cin.tie(nullptr);
	cout.tie(nullptr);


	int T;
	cin >> T;

	GetPrime();

	while (T--) {
		int N;
		cin >> N;
		int count = 0;
		for (int i = 0; prime[i]<=N/2;i++) {
			if (check[N - prime[i]] == false)
				count++;
		}
		cout << count << '\n';
	}

	check[0] = check[1] = false;
	return 0;
}