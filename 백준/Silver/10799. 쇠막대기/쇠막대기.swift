import Foundation

let str = Array(readLine()!)

var stack = [Character]()
var result = 0

for (index, ch) in str.enumerated() {
  
  // 레이저일 경우 자르기
  if ch == ")" && str[index-1] == "(" {
    stack.removeLast() // stack에 들어간 레이저: ( 빼주기
    result += stack.count
  }
  else if ch == "(" {
    stack.append(ch)
  }
  else if ch == ")" {
    stack.removeLast()
    result += 1
  }
}

print(result)
