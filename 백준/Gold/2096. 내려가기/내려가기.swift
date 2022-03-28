//2096번 내려가기
let n = Int(readLine()!)!
var arr = [[Int]]()
var dp = Array(repeating: Array(repeating: 0, count: 3), count: n)

for _ in 0..<n {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.append(t)
}

dp[0] = arr[0]

for i in 1..<n {
    dp[i][0] = max(dp[i-1][0], dp[i-1][1]) + arr[i][0]
    dp[i][1] = max(dp[i-1][0], dp[i-1][1], dp[i-1][2]) + arr[i][1]
    dp[i][2] = max(dp[i-1][1], dp[i-1][2]) + arr[i][2]
}

let maxValue = dp[n-1].max()!

dp = Array(repeating: Array(repeating: 0, count: 3), count: n)
dp[0] = arr[0]

for i in 1..<n {
    dp[i][0] = min(dp[i-1][0], dp[i-1][1]) + arr[i][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][1], dp[i-1][2]) + arr[i][1]
    dp[i][2] = min(dp[i-1][1], dp[i-1][2]) + arr[i][2]
}

let minValue = dp[n-1].min()!

print(maxValue, minValue)
