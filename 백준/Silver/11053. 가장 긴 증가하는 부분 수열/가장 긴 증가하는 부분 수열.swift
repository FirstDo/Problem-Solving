import Foundation

let n = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: 1, count: n)

// dp[n] n으로 끝나는 가장긴 부분수열의 길이

for i in 1..<n {
  // 이전 값들중, 나보다 작으면서 가장 dp[n]값이 큰걸 구한다
  if let value = (0..<i).filter { A[$0] < A[i] }.map { dp[$0] }.max() {
    dp[i] = value + 1
  }
}

print(dp.max()!)