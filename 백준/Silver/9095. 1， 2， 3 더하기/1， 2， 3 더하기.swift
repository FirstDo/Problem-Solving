var dp = Array(repeating: 0, count: 11)

dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4..<11 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

let t = Int(readLine()!)!
var nums: [Int] = []
for _ in 0..<t {
    nums.append(Int(readLine()!)!)
}

for n in nums {
    print(dp[n])
}