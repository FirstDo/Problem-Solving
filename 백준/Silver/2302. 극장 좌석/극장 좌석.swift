// 2302번 극장 좌석

import Foundation

func makeDP() -> [Int] {
  var dp = Array(repeating: 0, count: n+1)
  dp[0] = 1
  dp[1] = 1
  dp[2] = 2

  for i in 3...n {
    dp[i] = dp[i-1] + dp[i-2]
  }
  
  return dp
}

func countEmptySits() -> [Int] {
  var results = [Int]()
  var start = 1

  for vip in vips {
    results.append(vip - start)
    start = vip + 1
  }

  results.append(n + 1 - start)
  
  return results
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!

let vips = (0..<m).map { _ in Int(readLine()!)! }.sorted(by: <)
let dp = makeDP()

let answer = countEmptySits().reduce(into: 1) { partialResult, num in
  partialResult *= dp[num]
}

print(answer)