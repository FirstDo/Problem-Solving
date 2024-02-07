import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var dp = Array(repeating: 0, count: n)
dp[0] = numbers[0]
// dp[n]: n까지의 최대 연속합

for i in 1..<n {
  dp[i] = max(numbers[i], dp[i-1] + numbers[i])
}

print(dp.max()!)