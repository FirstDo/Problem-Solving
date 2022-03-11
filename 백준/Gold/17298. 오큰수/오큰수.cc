#include <iostream>
#include <stack>
#include <string>
using namespace std;
int arr[1000001];
int main() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	stack<int> s;
	int N;
	cin >> N;
	for (int i = 0; i < N; i++) {
		cin >> arr[i];
	}
	s.push(0);
	for (int i = 1; i < N; i++) {
		if (s.empty()) {
			s.push(i);
		}
		while (!s.empty() && arr[s.top()] < arr[i]) {
			arr[s.top()] = arr[i];
			s.pop();
		}
		s.push(i);
	}
	while (!s.empty()) {
		arr[s.top()] = -1;
		s.pop();
	}
	for (int i = 0; i < N; i++) {
		if (arr[i] == 0)
			break;
		cout << arr[i] << ' ';
	}
	return 0;
}