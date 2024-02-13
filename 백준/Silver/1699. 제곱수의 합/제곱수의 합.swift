let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n+1)
for i in 1 ..< (n+1) {
    var j = 1
    dp[i] = i
    while j*j <= i {
        if dp[i] > dp[i-j*j] + 1 {
            dp[i] = dp[i-j*j] + 1
        }
        j+=1
    }
}


print(dp[n])