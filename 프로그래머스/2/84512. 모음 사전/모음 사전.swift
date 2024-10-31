import Foundation

let list = ["A", "E", "I", "O", "U"]
var result = [String]()

func dfs(str: String) {
  if str.count == 5 { return }
  
  for i in 0..<5 {
    result.append(str + list[i])
    dfs(str: str + list[i])
  }
}

func solution(_ word:String) -> Int {
  dfs(str: "")
  return result.firstIndex(of: word)! + 1
}