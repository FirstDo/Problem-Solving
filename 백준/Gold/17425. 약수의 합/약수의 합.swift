import Foundation
//1037번 약수
let T = Int(readLine()!)!
var ans = [Int]()
let MAX = 1000000

var dp = Array(repeating: 1, count: MAX+1)
var s = Array(repeating: 0, count: MAX+1)

for i in 2..<MAX+1 {
	var j = 1
	while i * j <= MAX {
		dp[i*j] += i
		j += 1
	}
}

for i in 1..<MAX+1 {
	s[i] = s[i-1] + dp[i]
}

for _ in 0..<T {
	let n = Int(readLine()!)!
	ans.append(s[n])
}
print(ans.map{String($0)}.joined(separator: "\n"))