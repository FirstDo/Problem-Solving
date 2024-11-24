import Foundation

func solution(_ s:String) -> Int {
  
  var stack = [Character]()
  
  for ch in s {
    if stack.last == ch {
      _ = stack.removeLast()
    } else {
      stack.append(ch)
    }
  }
  
  return stack.isEmpty ? 1 : 0
}
