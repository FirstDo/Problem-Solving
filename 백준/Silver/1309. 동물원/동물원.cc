#include <iostream>
#include <algorithm>
using namespace std;

const int MAX = 100000;
const int MOD = 9901;
int d[MAX + 1][3];

int main(void) {
	ios_base::sync_with_stdio(false);
	cin.tie(nullptr);
	cout.tie(nullptr);

	int N;
	cin >> N;	//input num of house

	
	d[1][0] = d[1][1] = d[1][2] = 1;
	for (int i = 2; i <= N; i++) {
		d[i][0] = d[i - 1][0] + d[i - 1][1] + d[i - 1][2];		//empty
		d[i][1] = d[i - 1][0] + d[i - 1][2];					//left
		d[i][2] = d[i - 1][0] + d[i - 1][1];					//right

		d[i][0] %= MOD;
		d[i][1] %= MOD;
		d[i][2] %= MOD;
	}

	cout << (d[N][0]+d[N][1]+d[N][2])%MOD << '\n';
	

	return 0;
}
