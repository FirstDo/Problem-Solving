import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: 0, count: n)
// dp[n]: n으로 끝나는 증가하는 부분수열의 합
dp[0] = arr[0]

for i in 1..<n {
  if let maxValue = (0..<i).filter({ arr[$0] < arr[i] }).map ({ dp[$0] }).max() {
    dp[i] = maxValue + arr[i]
  } else {
    dp[i] = arr[i]
  }
}

print(dp.max()!)
