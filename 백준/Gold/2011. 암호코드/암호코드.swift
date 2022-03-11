let n = Array(readLine()!).map{Int(String($0))!}
let cnt = n.count
let mod = 1000000


//dp[i] = i로 나올수 있는 해석의 가지수
var dp = [Int](repeating: 0, count: cnt+1)
dp[0] = 1
dp[1] = 1

if n[0] == 0 {
    print(0)
} else {
    for i in 2..<cnt+1 {
        let one = n[i-1] 
        let two = n[i-2] * 10 + n[i-1]

        if one >= 1 && one <= 9 {
            dp[i] += dp[i-1]
        }
        if two >= 10 && two <= 26 {
            dp[i] += dp[i-2]
        }
        dp[i] %= mod
    }
    print(dp[cnt])
}

