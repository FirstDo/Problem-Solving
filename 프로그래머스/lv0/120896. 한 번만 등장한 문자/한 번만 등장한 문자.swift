import Foundation

func solution(_ s:String) -> String {
  var dict: [Character:Int] = [:]
    
  s.forEach { ch in
    if dict[ch] == nil {
      dict[ch] = 0
    }
    dict[ch]! += 1
  }
    
  return Array(dict.filter { $0.value == 1 }.map { String($0.key) }).sorted().joined()
}