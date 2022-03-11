#include <iostream>
#include <algorithm>
using namespace std;

const int MAX = 100000;
int arr[MAX+1][2];		//to store sticker score
int d[MAX + 1][3];

int main(void) {
	ios_base::sync_with_stdio(false);
	cin.tie(nullptr);
	cout.tie(nullptr);

	int T;
	cin >> T;

	//initalize


	while (T--) {
		int n;
		cin >> n;

		for (int j = 0; j <= 1; j++) {		//store score to arr
			for (int i = 1; i <= n; i++) {
				cin >> arr[i][j];
			}
		}

		for (int i = 1; i <= n; i++) {
			d[i][0] = max({ d[i - 1][0], d[i - 1][1],d[i - 1][2] });
			d[i][1] = max(d[i - 1][0], d[i - 1][2]) + arr[i][0];
			d[i][2] = max(d[i - 1][0], d[i - 1][1]) + arr[i][1];
		}
		cout << max({d[n][0], d[n][1], d[n][2]}) << '\n';
	}
	return 0;
}
