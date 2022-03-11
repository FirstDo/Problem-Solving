#include <iostream>
using namespace std;

const int MAX = 1000;
int arr[MAX];
int dp[MAX];
int v[MAX];

void go(int p) {
	if (p == -1)
		return ;
	go(v[p]);
	cout << arr[p] << ' ';
}

int main(void) {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	int n;
	cin >> n;

	for (int i = 0; i < n; i++) {
		dp[i] = 1;
		v[i] = -1;
	}	

	for (int i = 0; i < n; i++) {		//arr입력 받기	1~n까지
		cin >> arr[i];
	}

	for (int i = 0; i < n; i++) {
		for (int j = 0; j <i ; j++) {
			if (arr[j] < arr[i] && dp[i]<dp[j]+1) {
				dp[i] = dp[j] + 1;
				v[i] = j;
			}
		}
	}

	int p = 0;
	int ans = dp[0];
	for (int i = 0; i < n; i++) {
		if (ans < dp[i]) {
			ans = dp[i];
			p = i;
		}
	}
	cout << ans << '\n';

	go(p);
	cout << '\n';
	return 0;
}