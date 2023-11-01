import Foundation

func solution(_ s:String) -> String {
  let words = s.components(separatedBy: " ")
  
  return words.map { word in
    if word.isEmpty { return "" }
    
    let wordArray = Array(word)
    return wordArray.first!.uppercased() + wordArray[1...].map { $0.lowercased() }.joined()
  }.joined(separator: " ")
}