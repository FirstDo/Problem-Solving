//2482번 색상환

let mod = 1_000_000_003

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var dp = Array(repeating: Array(repeating: 0, count: 1001), count: 1001)

// dp[n][k], n개의 색이 있을때, 인접하지 않게 k개의 색을 고르는 경우의 수

for i in 0...n { dp[i][0] = 1 }

dp[1][1] = 1

for i in 2...n {
    for j in 1...(i+1)/2 {
        dp[i][j] = (dp[i-2][j-1] + dp[i-1][j]) % mod
    }
}

print((dp[n-3][k-1] + dp[n-1][k]) % mod)
