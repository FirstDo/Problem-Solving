#include <iostream>
#include <stack>
#include <string>
using namespace std;

int precedence(char ch) {
	if (ch == '(')
		return 0;
	else if (ch == '+' || ch == '-')
		return 1;
	else
		return 2;
}

int main(void){
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	string str;
	cin >> str;

	stack<char> s;

	for (char ch : str) {
		if (ch >= 'A' && ch <= 'Z') {		//if char is number, just print it
			cout << ch;
		}
		else if (ch == '(') {				//if char is '(', just push
			s.push(ch);
		}
		else if (ch == ')') {				//if char is ')', pop from stack until '(' is poped.
			while (!(s.top() == '(')) {
				cout << s.top();
				s.pop();
			}
			s.pop();
		}
		else {
			if (s.empty())
				s.push(ch);
			else {
				while (!s.empty() && (precedence(s.top()) >= precedence(ch))) {
					cout << s.top();
					s.pop();
				}
				s.push(ch);
			}
		}
	}
	while (!s.empty()) {
		cout << s.top();
		s.pop();
	}
	cout << '\n';
	return 0;
}