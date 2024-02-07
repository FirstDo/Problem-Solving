import Foundation

let n = Int(readLine()!)!
let p = [0] + readLine()!.split(separator: " ").map{ Int(String($0))! }
// p[i]는 카드가 i개 포함된 카드팩의 가격

var dp = Array(repeating: Int.max, count: n+1)
// dp[i]는 카드 i개를 사기위해 지불해야 하는 금액의 최솟값

for (index, value) in p.enumerated() {
  dp[index] = value
}

for i in 2...n {
  for j in 1..<i {
    dp[i] = min(dp[i], dp[i-j] + p[j])
  }
}

print(dp[n])
