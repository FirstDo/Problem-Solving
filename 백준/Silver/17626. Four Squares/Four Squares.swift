import Foundation
//17626번 Four Squares
let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)
dp[1] = 1

if n == 1 {
	print(1)
} else {
	for i in 2...n {
		var minValue = 9876543210
		var j = 1
		while (j*j) <= i {
			minValue = min(minValue, dp[i-j*j])
			j += 1
		}
		dp[i] = minValue + 1
	}
	print(dp[n])
}