import Foundation

func isCorrectString(str: [String]) -> Bool {
  var stack = [String]()
  
  for ch in str {
    if ch == "[" || ch == "{" || ch == "(" {
      stack.append(ch)
    } else if ch == "]", stack.last == "[" {
      _ = stack.removeLast()
    } else if ch == "}", stack.last == "{" {
      _ = stack.removeLast()
    } else if ch == ")", stack.last == "(" {
      _ = stack.removeLast()
    } else {
      return false
    }
  }
  
  return stack.isEmpty
}

func solution(_ s:String) -> Int {
  let s = (s + s).map { String($0) }
  let len = s.count
  
  var cnt = 0
  
  for i in 0..<len/2 {
    let target = Array(s[i..<i+len/2])
    if isCorrectString(str: target) {
      cnt += 1
    }
  }
  
  return cnt
}