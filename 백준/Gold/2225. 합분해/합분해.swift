let inputLine = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = inputLine[0]
let k = inputLine[1]

var dp = [[Int]](repeating: [Int](repeating: 1, count: k+1), count: n+1)
let mod = 1000000000

for i in 1..<n+1 {
    for j in 2..<k+1 {
        dp[i][j] = (dp[i-1][j] + dp[i][j-1]) % mod
    }
}
print(dp[n][k])