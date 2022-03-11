#include <iostream>
#include <stack>
#include <vector>
int freq[1000001];
using namespace std;
int main() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);


	stack<int> s;
	int N;
	cin >> N;
	vector<int> arr(N);
	vector<int> ans(N);

	for (int i = 0; i < N; i++) {
		cin >> arr[i];
		freq[arr[i]] += 1;
	}


	s.push(0);
	for (int i = 1; i < N; i++) {
		if (s.empty()) {
			s.push(i);
		}
		while (!s.empty() && freq[arr[s.top()]] < freq[arr[i]]) {
			ans[s.top()] = arr[i];
			s.pop();
		}
		s.push(i);
	}
	while (!s.empty()) {
		ans[s.top()] = -1;
		s.pop();
	}
	for (int i = 0; i < N; i++) {
		cout << ans[i] << ' ';
	}
	return 0;
}