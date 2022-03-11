let n = Int(readLine()!)!
var m: [[Int]] = []

for _ in 0..<n {
    m.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count:n)
//dp[i][j] = min(dp[i][j], dp[i][k] + dp[k+1][j] + m[i][0] * m[k][1] * m[j][1])

for num in 1..<n {
    for i in 0..<n-num {
        let j = i + num
        dp[i][j] = Int.max
        for k in i..<j {
            dp[i][j] = min(dp[i][j], dp[i][k] + dp[k+1][j] + m[i][0] * m[k][1] * m[j][1])
        }
    }
}

print(dp[0][n-1])
