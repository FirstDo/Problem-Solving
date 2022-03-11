#include <iostream>
using namespace std;
const int MAX = 1000;
int d[MAX + 1][3];
int cost[MAX + 1][3];

int main(void) {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	int n,result=1000*1000+1;
	cin >> n;
	for (int i = 1; i <= n; i++) {
		for(int j=0;j<=2;j++)
			cin>>cost[i][j];
	}

	for (int k = 0; k <= 2; k++) {		//house1's color
		for (int j = 0; j <= 2; j++) {
			if (j == k)
				d[1][j] = cost[1][j];
			else
				d[1][j] = 1000 * 1000 + 1;
		}
		for (int i = 2; i <= n; i++) {
			d[i][0] = min(d[i - 1][1], d[i - 1][2]) + cost[i][0];
			d[i][1] = min(d[i - 1][0], d[i - 1][2]) + cost[i][1];
			d[i][2] = min(d[i - 1][0], d[i - 1][1]) + cost[i][2];
		}

		for (int j = 0; j <= 2; j++) {	//houseN's color
			if (j == k) 
				continue;
			result = min(result, d[n][j]);
		}
	}
	cout << result << '\n';


}