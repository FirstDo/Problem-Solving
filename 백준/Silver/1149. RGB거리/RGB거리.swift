import Foundation

let n = Int(readLine()!)!

var cost = Array(repeating: [0,0,0], count: n)
// cost[i]: i번째집을 r, g, b 로 칠하는 비용

for i in 0..<n {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  cost[i] = input
}

var dp = Array(repeating: [0, 0, 0], count: n)

// dp[i][k] i번째집을 r: 0, g: 1, b: 2 로 칠했을때의 비용의 최솟값

dp[0] = cost[0]

for i in 1..<n {
  dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + cost[i][0]
  dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + cost[i][1]
  dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + cost[i][2]
}

print(dp[n-1].min()!)