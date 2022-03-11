#include <iostream>
using namespace std;

bool button[10];		//true:broken   false: normal
int possible(int c) {
	if (c == 0)
		return button[0] ? 0 : 1;
	int len = 0;
	while (c > 0) {
		if (button[c % 10])
			return 0;
		len += 1;
		c /= 10;
	}
	return len;
}
int main(void) {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	int n;
	cin >> n;
	int m;
	cin >> m;
	for (int i = 0; i < m; i++){
		int broken;
		cin >> broken;
		button[broken] = true;
	}

	int ans = n - 100;
	if (ans < 0)
		ans = -ans;

	for (int i = 0; i <= 1000000; i++) {
		int ch = i;
		int len = possible(ch);
		if (len > 0) {
			int press = ch - n;
			if (press < 0)
				press =(-press);
			if (ans > len + press)
				ans = len + press;

		}
		
	}
	cout << ans << endl;
	
	return 0;

}