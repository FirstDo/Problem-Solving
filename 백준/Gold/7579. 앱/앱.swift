import Foundation
//7579번 앱
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (t[0],t[1])
let memory = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}
let cost = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}

let c = cost.reduce(0,+)
var dp = Array(repeating: Array(repeating: 0, count: c+1), count: N+1)
var result = Int.max

//dp[i][j]


for i in 1...N {
	for j in 0...c {
		if cost[i] > j {
			dp[i][j] = dp[i-1][j]
		} else {
			dp[i][j] = max(dp[i-1][j], memory[i] + dp[i-1][j-cost[i]])
		}

		if dp[i][j] >= M {
			result = min(result,j)
		}
	}
}

if M == 0 {
	print(0)
} else {
	print(result)
}

