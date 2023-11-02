import Foundation

func solution(_ s:String) -> Int {
  let len = s.count
  let doubleS = Array(s).map { String($0) } + Array(s).map { String($0) }
  var result = 0
  
  for i in 0..<len {
    let subStr = doubleS[i..<i+len].joined()
    if isRightString(subStr) {
      result += 1
    }
  }
  
  return result
}

private func isRightString(_ str: String) -> Bool {
  var stack = [Character]()
  
  for ch in str {
    switch (stack.last, ch) {
    case (_, "["), (_, "{"), (_, "("):
      stack.append(ch)
    case ("[","]"), ("{","}"), ("(",")"):
      stack.removeLast()
    default:
      return false
    }
  }
  
  return stack.isEmpty
}