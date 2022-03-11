#include <iostream>
using namespace std;
const int MAX = 1000;
int a[MAX + 1];
int d[MAX + 1];

int main(void) {
	ios_base::sync_with_stdio(false);
	cin.tie(nullptr);
	cout.tie(nullptr);

	int n;
	cin >> n;

	for (int i = 1; i <= n; i++) {
		cin >> a[i];
	}
	for (int i = n; i >= 1; i--) {
		d[i] = 1;
		for (int j = n; j > i; j--) {
			if (a[i] > a[j] && d[i] < d[j] + 1) {
				d[i] = d[j] + 1;
			}
		}
	}

	int ans = d[1];
	for (int i = 2; i <= n; i++) {
		if (ans < d[i])
			ans = d[i];
	}

	cout << ans;

	return 0;
}
