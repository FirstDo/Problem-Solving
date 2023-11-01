import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
  var dicts = [String: Bool]()
  var lastWord = ""
  
  var personID = 1
  var count = 1
  
  for word in words {
    // 이전에 안나왔고, 한글자 아니고, 이전단어 마지막과 같으면
    if lastWord == "" || (dicts[word] == nil && word.count != 1 && word.first! == lastWord.last! ) {
      dicts[word] = true
      lastWord = word
      
      personID += 1
      
      if personID > n {
        personID = 1
        count += 1
      }
      
    } else {
      return [personID, count]
    }
  }
  
  return [0, 0]
}