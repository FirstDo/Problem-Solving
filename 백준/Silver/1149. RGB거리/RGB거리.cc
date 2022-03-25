#include <iostream>
#include <algorithm>
using namespace std;

const int MAX = 1000;
int	d[MAX + 1][3];
int a[MAX + 1][3];

int main(void) {
	ios_base::sync_with_stdio(false);
	cin.tie(nullptr);
	cout.tie(nullptr);

	int N;
	cin >> N;	//input num of house

	for (int i = 1; i <= N; i++) {		//input color cost of RGB for each house
		for (int j = 0; j < 3; j++) {
			cin>>a[i][j];
		}
	}


	
	for (int i = 1; i <= N; i++) {
			d[i][0] = min(d[i - 1][1], d[i - 1][2]) + a[i][0];
			d[i][1] = min(d[i - 1][0], d[i - 1][2]) + a[i][1];
			d[i][2] = min(d[i - 1][0], d[i - 1][1]) + a[i][2];
	}
	cout << min({ d[N][0] , d[N][1] ,d[N][2] }) << '\n';

	return 0;
}