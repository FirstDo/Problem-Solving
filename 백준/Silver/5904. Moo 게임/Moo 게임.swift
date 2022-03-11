let N = Int(readLine()!)!

var dp: [Int] = [Int](repeating: 0, count: 100)

func moo(_ n: Int) -> Character{
    // 맨 앞 moo 일때
    if n<=3 {
        if n == 1 {
            return "m"
        } else {
            return "o"
        }
    }

    var m = 1
    while n > dp[m] {
        m += 1
    }

    //moo구간에 속할때
    if n <= dp[m] - dp[m-1] {
        if (n-dp[m-1] == 1) {
            return "m"
        } else {
            return "o"
        }
    }

    return moo(n-dp[m-1] - (m+3))


}

dp[0] = 3

for i in 1..<100 {
    dp[i] = dp[i-1] * 2 + (i+3)
    if dp[i] >= Int(1e9) {
        break
    }
}

print(moo(N))