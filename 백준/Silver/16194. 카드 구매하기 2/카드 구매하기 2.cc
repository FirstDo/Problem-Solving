#include <iostream>
using namespace std;

const int PMAX = 10001;
const int DMAX = 1001;
int p[PMAX];
int d[DMAX];

int main(void) {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	int N;
	cin >> N;
	for (int i = 1; i <= N; i++) {
		cin >> p[i];
	}

	for (int i = 1; i <= N; i++) {
		d[i] = 1000 * 10000;
	}
	for (int i = 1; i <= N; i++) {
		for (int j = 1; j <= i; j++) {
			d[i] = min(d[i], d[i - j] + p[j]);
		}
	}
	cout << d[N];

	return 0;
}