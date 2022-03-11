let T = Int(readLine()!)!
var dp: [Int] = [Int](repeating: 0, count: 100)
dp[0..<8] = [1,1,1,2,2,3,4,5]


for i in 5..<100 {
    dp[i] = dp[i-1] + dp[i-5]
}

for _ in 0..<T {
    let n = Int(readLine()!)!
    print(dp[n-1])
}

