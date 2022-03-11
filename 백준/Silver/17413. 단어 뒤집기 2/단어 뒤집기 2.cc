#include <iostream>
#include <stack>
#include <string>
using namespace std;



int main() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	string str;
	getline(cin, str);
	stack<char> s;
	str += '\n';

	for (int i=0;i<str.size();i++) {
		if (str[i] == '<') {			//case : <
			while (!s.empty()) {		//if stack is not empty, pop all char and print it;
				cout << s.top();
				s.pop();
			}
			while (str[i] != '>') {		//print all char until you meet >
				cout << str[i];
				i++;
			}
			cout << str[i];
		}
		else if (str[i] != ' ' &&str[i]!='\n') {
			s.push(str[i]);
		}
		else if(str[i]==' ' || str[i]=='\n'){		//end of word. pop all char from stack+ and print it
			while (!s.empty()) {
				cout << s.top();
				s.pop();
			}
			cout << str[i];
		}
	}
	return 0;
}