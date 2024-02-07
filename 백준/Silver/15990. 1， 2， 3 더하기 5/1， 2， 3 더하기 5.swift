import Foundation

let t = Int(readLine()!)!
let mod = 1_000_000_009

var dp = Array(repeating: [0, 0, 0, 0], count: 100_001)

// dp[i][j]: i를 만드는 경우의수, 단 끝자리가 j로 끝남!

dp[1][1] = 1
dp[2][2] = 1
dp[3] = [0, 1, 1, 1]

for i in 4...100_000 {
  dp[i][1] = (dp[i-1][2] + dp[i-1][3]) % mod
  dp[i][2] = (dp[i-2][1] + dp[i-2][3]) % mod
  dp[i][3] = (dp[i-3][1] + dp[i-3][2]) % mod
}

for _ in 0..<t {
  let n = Int(readLine()!)!
  print(dp[n].reduce(0, +) % mod)
}
