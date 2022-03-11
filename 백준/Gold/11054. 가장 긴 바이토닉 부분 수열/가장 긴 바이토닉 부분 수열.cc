#include <iostream>
using namespace std;
const int MAX = 1000;
int a[MAX + 1];

int up[MAX + 1];
int down[MAX + 1];

int main(void) {
	ios_base::sync_with_stdio(false);
	cin.tie(nullptr);
	cout.tie(nullptr);

	int n;
	cin >> n;

	for (int i = 1; i <= n; i++) {
		cin >> a[i];
	}

	for (int i = 1; i <= n; i++) {
		up[i] = 1;
		for (int j = 1; j <= i; j++) {
			if (a[i] > a[j] && up[i] < up[j] + 1) {
				up[i] = up[j] + 1;
			}
		}
	}

	for (int i = n; i >= 1; i--) {
		down[i] = 1;
		for (int j =i+1 ; j<=n; j++) {
			if (a[i] > a[j] && down[i] < down[j] + 1)
				down[i] = down[j] + 1;
		}
	}

	int ans = up[1] + down[1];
	for (int i = 2; i <= n; i++) {
		if (ans < up[i] + down[i])
			ans = up[i] + down[i];
	}
	ans--;
	cout << ans;
	

	return 0;
}
