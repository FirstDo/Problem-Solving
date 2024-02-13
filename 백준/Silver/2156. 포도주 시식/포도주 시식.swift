import Foundation
//2156번 포도주 시식
let n = Int(readLine()!)!

var dp = Array(repeating: 0, count: n)
var arr = [Int]()

for _ in 0..<n {
	arr.append(Int(readLine()!)!)
}
dp[0] = arr[0]
if n < 3 {
	print(arr.reduce(0,+))
} else {
	dp[1] = arr[0] + arr[1]
	dp[2] = max(dp[1],arr[1]+arr[2], arr[0]+arr[2])

	for i in 3..<n {
		dp[i] = max(dp[i-1],dp[i-2]+arr[i],dp[i-3] + arr[i-1] + arr[i])
	}
	print(dp[n-1])
}