import Foundation

func solution(_ s:String) -> Bool {
  var stack = [Character]()
  
  for ch in s {
    if ch == "(" {
      stack.append(ch)
    }
    else if ch == ")" && stack.last == "(" {
      stack.removeLast()
    }
    else {
      return false
    }
  }
  
  return stack.isEmpty
}
