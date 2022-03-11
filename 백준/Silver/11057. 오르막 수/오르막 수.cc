#include <iostream>
#include <algorithm>
using namespace std;

const int MAX = 1000;
const long long MOD = 10007LL;
long long d[MAX + 1][10];

int main(void) {
	ios_base::sync_with_stdio(false);
	cin.tie(nullptr);
	cout.tie(nullptr);

	int N;
	cin >> N;	//input num of house

	for (int j = 0; j <= 9; j++) {
		d[1][j] = 1;
	}

	for (int i = 2; i <= N; i++) {
		for (int j = 0; j <= 9; j++) {
			for (int k = 0; k <= j; k++) {
				d[i][j] += d[i - 1][k];
				d[i][j] %= MOD;
			}
		}
	}

	long long ans = 0;
	for (int j = 0; j <= 9; j++) {
		ans += d[N][j];
	}
	ans %= MOD;
	cout << ans << '\n';


	return 0;
}