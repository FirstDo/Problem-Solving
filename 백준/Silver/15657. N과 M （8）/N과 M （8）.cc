#include <iostream>
#include <algorithm>
using namespace std;

bool c[9];
int a[9];

int n, m;

void go(int index, int start,int* arr) {
	if (index == m) {
		for (int i = 0; i < m; i++) {
			cout << a[i];
			if (i != m - 1)
				cout << " ";
		}
		cout << '\n';
		return;
	}
	for (int i = start; i < n; i++) {
		//if (c[i]) continue;
		//c[i] = true;
		a[index] = arr[i];
		go(index + 1, i,arr);
		//c[i] = false;
	}

}
bool SortStandard(int a, int b) {
	return a < b;
}

int main(void) {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	cin >> n >> m;
	int* arr = new int[n];
	for (int i = 0; i < n; i++)
		cin >> arr[i];
	sort(arr, arr + n, SortStandard);				//Ascending sort
	go(0,0,arr);


	delete[]arr;


	return 0;
}