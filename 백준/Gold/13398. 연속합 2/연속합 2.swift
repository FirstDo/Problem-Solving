let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var dp = Array(repeating: 0, count: 100_000)
var dp2 = Array(repeating: 0, count: 100_000)

// dp[n]: n까지의 연속합
// dp2[n]: n부터의 연속합

dp[0] = arr[0]
dp2[n-1] = arr[n-1]

for i in 1..<n {
  dp[i] = arr[i]
  
  if dp[i-1] > 0 {
    dp[i] = dp[i-1] + arr[i]
  }
}

for i in stride(from: n-2, to: -1, by: -1) {
  dp2[i] = arr[i]
  
  if dp2[i+1] > 0 {
    dp2[i] = dp2[i+1] + arr[i]
  }
}

var answer = max(dp[..<n].max()!, dp2[..<n].max()!)

for k in 1..<n {
  if k == 0 || k == n - 1 { continue }
  answer = max(dp[k-1] + dp2[k+1], answer)
}


print(answer)
