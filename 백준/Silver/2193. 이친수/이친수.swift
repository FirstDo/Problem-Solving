let n = Int(readLine()!)!
var dp = [[UInt]](repeating: [UInt](repeating: 0, count: 2), count: n+1)

//dp[i][0] or dp[i][1]
//뒤에서 부터 시작한다고 생각하자..
dp[1] = [0,1]
//dp[2] = 

for i in 2..<n+1 {
    dp[i][0] = dp[i-1][0] + dp[i-1][1]
    dp[i][1] = dp[i-1][0]
}


print(dp[n].reduce(0,+))