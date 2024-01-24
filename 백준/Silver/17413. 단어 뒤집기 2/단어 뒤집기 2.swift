import Foundation

let str = Array(readLine()!)

var isTag = false
var result = ""
var word = ""

for (index, ch) in str.enumerated() {

  if isTag == false && ch != "<" && ch != ">" && ch != " " {
    word.append(ch)
  }
  
  // < 면 테그 시작
  if ch == "<" {
    isTag = true
  }
  
  if isTag || ch == " " {
    result.append(ch)
  }
  
  // > 면 테그 끝
  if ch == ">" {
    isTag = false
  }
  
  recordWordIfNeeded(index)
}

print(result)

// 단어 기록할 필요성 있으면 기록해주기 (단어가 있을때 -> 다음이 공백이거나, < 거나, 문자열의 끝이라면..)
func recordWordIfNeeded(_ index: Int) {
  if word.isEmpty { return }
  
  if str[safe: index + 1] == " " || str[safe: index + 1] == "<" || str[safe: index + 1] == nil {
    result.append(contentsOf: word.reversed())
    word = ""
  }
}

extension Array {
  subscript(safe index: Int) -> Element? {
    return indices ~= index ? self[index] : nil
  }
}
