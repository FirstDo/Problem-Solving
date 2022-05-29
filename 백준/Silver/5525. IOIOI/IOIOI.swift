import Foundation
//5525번 IOIOI
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var str = Array(readLine()!)

var i = 1
var cnt = 0
var ans = 0

while i < m-1 {
	if str[i-1] == "I" && str[i] == "O" && str[i+1] == "I" {
		cnt += 1
		i += 1
		if cnt == n {
			cnt -= 1
			ans += 1
		}
	} else {
		cnt = 0
	}
	i += 1
}
print(ans)