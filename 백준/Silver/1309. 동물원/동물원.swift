import Foundation

let n = Int(readLine()!)!
let mod = 9901

var dp = Array(repeating: [0, 0, 0], count: n)
// dp[n][k]: 2*n 배열에서 사자를 k(배치하지 않음, 왼쪽, 오른쪽) 했을때 배치하는 경우의 수
dp[0] = [1, 1, 1]

for i in 1..<n {
  dp[i][0] = (dp[i-1][0] + dp[i-1][1] + dp[i-1][2]) % mod
  dp[i][1] = (dp[i-1][0] + dp[i-1][2]) % mod
  dp[i][2] = (dp[i-1][0] + dp[i-1][1]) % mod
}

print(dp[n-1].reduce(0, +) % mod)
