let n = Int(readLine()!)!

let mod: Int = 10007
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n+1)

dp[1] = [1,1,1,1,1,1,1,1,1,1]
//dp[i][k] = dp[i-1][0~k-1]
if n == 1 {
    print(10)
} else {
    for i in 2...n {
        for j in 0...9 {
            for k in 0...j {
                dp[i][j] += dp[i-1][k]
            }
            dp[i][j] %= mod
        }
    }   
    print((dp[n].reduce(0,+))%mod)
}