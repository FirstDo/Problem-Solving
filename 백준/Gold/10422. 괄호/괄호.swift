import Foundation
//10422번 괄호

let div = 1000000007
var s = [1]

for i in 1...2500 {
	var sum = 0
	for j in 0..<i {
		sum = (sum + s[j] * s[i-j-1]) % div
	}
	s.append(sum)
}

for _ in 0..<Int(readLine()!)! {
	let l = Int(readLine()!)!
	print(l%2==1 ? 0 : s[l/2])
}