import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map {Int(String($0))!}

var dp = Array(repeating: 1, count: n)
var indexArr = Array(repeating: -1, count: n)

dp[0] = 1
indexArr[0] = -1

for i in 1..<n {
  dp[i] = 1
  
  for j in 0..<i {
    if arr[j] < arr[i] && dp[i] < dp[j] + 1 {
      dp[i] = dp[j] + 1
      indexArr[i] = j
    }
  }
}

var index = dp.enumerated().max(by: { $0.element < $1.element })!.offset
print(dp[index])

var result = [Int]()

while index != -1 {
  result.append(arr[index])
  index = indexArr[index]
}

print(result.map { String($0) }.reversed().joined(separator: " "))
