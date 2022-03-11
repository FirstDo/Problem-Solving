#include <iostream>
#include <algorithm>
using namespace std;

int m, n;
int arr[8], res[8];
bool check[8];

void func(int cnt, int start) {
	if (cnt == m) {
		for (int i = 0; i < m; i++)
			cout << res[i]<<" ";
		cout << '\n';
		return;
	}
	int xx = 0;
	for (int i = start; i < n; i++) {
		if (!check[i] && arr[i] != xx) {
			res[cnt] = arr[i];
			xx = res[cnt];
			check[i] = true;
			func(cnt + 1,i);
			check[i] = false;
		}
	}
}

int main(void) {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	cin >> n >> m;
	for (int i = 0; i < n; i++)
		cin >> arr[i];
	sort(arr, arr + n);
	func(0,0);

	

	return 0;
}