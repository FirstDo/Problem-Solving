import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
  let n = Int(readLine()!)!
  let scores1 = readLine()!.split(separator: " ").map { Int(String($0))! }
  let scores2 = readLine()!.split(separator: " ").map { Int(String($0))! }
  let scores = [scores1, scores2]
  
  var dp = Array(repeating: [0, 0, 0], count: n)
  // dp[n][k]는 k: 0, 1, 2 (위스티커땜, 아래스티커땜, 안땜)일때 점수의 합의 최대값
  dp[0] = [scores[0][0], scores[1][0], 0]
  
  for i in 1..<n {
    dp[i][0] = max(dp[i-1][2], dp[i-1][1]) + scores[0][i]
    dp[i][1] = max(dp[i-1][2], dp[i-1][0]) + scores[1][i]
    dp[i][2] = max(dp[i-1][0], dp[i-1][1], dp[i-1][2])
  }
  
  print(dp[n-1].max()!)
}
