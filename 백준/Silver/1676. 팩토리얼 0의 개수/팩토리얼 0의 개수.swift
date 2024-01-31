import Foundation

let n = max(Int(readLine()!)!, 1)
var num2 = 0
var num5 = 0

for i in 1...n {
  var temp = i
  
  // i에 2가 몇번들어있는지 카운트
  while temp % 2 == 0 {
    temp = temp / 2
    num2 += 1
  }
  
  // i에 5가 몇번 들어있는지 카운트
  while temp % 5 == 0 {
    temp = temp / 5
    num5 += 1
  }
}

print(min(num2, num5))