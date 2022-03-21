//9507번 Generations of Tribbles

var dp = Array(repeating: 0, count: 68)
dp[0] = 1
dp[1] = 1
dp[2] = 2
dp[3] = 4

func fibo(n: Int) -> Int {
    if dp[n] != 0 {
        return dp[n]
    }
    
    dp[n] = fibo(n: n-1)+fibo(n: n-2)+fibo(n: n-3)+fibo(n: n-4)
    return dp[n]
}


for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    print(fibo(n: n))
}
