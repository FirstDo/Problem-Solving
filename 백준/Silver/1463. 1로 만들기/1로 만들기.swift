import Foundation

let limit = 1_000_000
let x = Int(readLine()!)!

var dp = Array(repeating: limit, count: x+1)
dp[x] = 0

for i in stride(from: x, through: 1, by: -1) {
  if i % 3 == 0 {
    dp[i/3] = min(dp[i/3], dp[i] + 1)
  }
  
  if i % 2 == 0 {
    dp[i/2] = min(dp[i/2], dp[i] + 1)
  }
  
  dp[i-1] = min(dp[i-1], dp[i] + 1)
}

print(dp[1])
