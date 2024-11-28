import Foundation

func solution(_ sticker:[Int]) -> Int {
  if sticker.count == 1 || sticker.count == 2 {
    return sticker.max()!
  }
  
  let n =  sticker.count
    
  // dp[i]: i번째 스티커 까지의 최대값
  var dp = Array(repeating: 0, count: n)
  var dp2 = Array(repeating: 0, count: n)
  
  
  // 첫번째를 뜯었을 경우 (마지막은 뜯지 말아야함)
  dp[0] = sticker[0]
  dp[1] = sticker[0]
  
  for i in 2..<n-1 {
    dp[i] = max(dp[i-1], dp[i-2] + sticker[i])
  }
  
  // 첫번째를 뜯지 않았을 경우
  dp2[0] = 0
  dp2[1] = sticker[1]
  
  for i in 2..<n {
    dp2[i] = max(dp2[i-1], dp2[i-2] + sticker[i])
  }
  
  return max(dp.max()!, dp2.max()!)
}