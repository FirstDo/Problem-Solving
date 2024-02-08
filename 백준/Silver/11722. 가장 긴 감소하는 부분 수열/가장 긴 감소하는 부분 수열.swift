import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: 1, count: n)
// dp[n]: n으로 끝나는 감소하는 부분수열의 길이

for i in 1..<n {
  if let len = (0..<i).filter({ arr[$0] > arr[i] }).map({ dp[$0] }).max() {
    dp[i] = len + 1
  } else {
    dp[i] = 1
  }
}

print(dp.max()!)