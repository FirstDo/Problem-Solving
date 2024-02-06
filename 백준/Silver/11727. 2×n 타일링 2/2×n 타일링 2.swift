import Foundation

let n = Int(readLine()!)!
let mod = 10_007

var dp = Array(repeating: 0, count: n+2)

dp[1] = 1
dp[2] = 3

for i in 1..<n {
  dp[i + 2] = (dp[i + 1] + dp[i] * 2) % mod
}

print(dp[n])