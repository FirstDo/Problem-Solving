import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
  var index = 0
  var wordSet = Set<String>()
  var result = [0, 0]
  
  for i in 0..<words.count {
    if i == 0 && words.count <= 1 {
      result = [index%n + 1, index/n + 1]
      break
    }
    
    /*
     - 한글자 X
     - 이전단어 끝글자 = 지금단어 첫글자
     - 이전에 나오지 않은 단어
     */
    if i != 0 &&
       (words[i].count <= 1 ||
       words[i-1].last != words[i].first ||
       wordSet.contains(words[i]))
    {
      result = [index%n + 1, index/n + 1]
      break
    }
    
    wordSet.insert(words[i])
    index += 1
  }
  
  return result
}