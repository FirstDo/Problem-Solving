// 5052번 전화번호 목록

import Foundation

for _ in 0 ..< Int(readLine()!)! {
  let n = Int(readLine()!)!
  let numbers = (0..<n)
    .map { _ in
      readLine()!
    }
    .sorted(by: <)

  var flag = true
  
  for i in 0..<n-1 {
    let len = numbers[i].count
    
    if len <= numbers[i+1].count {
      let next = Array(numbers[i+1])[..<len].map { String($0) }.joined(separator: "")
      
      if numbers[i] == next {
        flag = false
        break
      }
    }
  }
  
  print( flag ? "YES" : "NO")
}
