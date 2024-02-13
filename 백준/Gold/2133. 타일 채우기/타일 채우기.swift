import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 31)

dp[0] = 1
dp[2] = 3

for i in 4...30 {
  dp[i] = 3 * dp[i-2]
  
  for j in stride(from: 4, through: i, by: 2) {
    dp[i] += dp[i-j] * 2
  }
}

print(dp[n])
