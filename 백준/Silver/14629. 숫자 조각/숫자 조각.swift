// 14629번 숫자 조각

import Foundation

func dfs(_ numbers: Int, _ depth: Int, _ limit: Int) {
  if limit == depth {
    if diff > abs(numbers - n) {
      diff = abs(numbers - n)
      answer = numbers
    }
    
    return
  }
  
  for i in 0..<10 {
    if !visit[i] {
      visit[i] = true
      dfs(numbers * 10 + i, depth + 1, limit)
      visit[i] = false
    }
  }
}

var visit = Array(repeating: false, count: 10)
var diff = Int.max
var answer = Int.max

let n = Int(readLine()!)!

if n > 9876543210 {
  print(9876543210)
} else {
  let targetNumbers = String(n).map { Int(String($0))! }
  
  dfs(0, 0, targetNumbers.count)
  print(answer)
}
