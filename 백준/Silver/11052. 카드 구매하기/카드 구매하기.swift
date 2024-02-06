import Foundation

let n = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map{ Int(String($0))! }

var dp = Array(repeating: 0, count: n+1)
//d[i]는 카드 i개를 사기 위해서 지불하는 금액의 최대값

for (index, cost) in cards.enumerated() {
  dp[index+1] = cost
}

for i in 1..<n+1 {
  for j in 1...i {
    dp[i] = max(dp[i], dp[i-j] + cards[j-1])
  }
}

print(dp[n])
