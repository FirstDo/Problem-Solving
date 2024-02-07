let n = Int(readLine()!)!
let mod = 1000000000
let limit = 100

var dp = Array(repeating: Array(repeating: 0, count: 10), count: limit+1)

dp[1] = [0,1,1,1,1,1,1,1,1,1]

for i in 2...limit {
    for j in 0..<10 {
        if j >= 1 {
            dp[i][j] += dp[i-1][j-1]
        }
        if j < 9 {
            dp[i][j] += dp[i-1][j+1]
        }
        dp[i][j] %= mod
    }
}

print(dp[n].reduce(0, +) % mod)
