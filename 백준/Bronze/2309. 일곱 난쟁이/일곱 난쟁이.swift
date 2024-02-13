import Foundation

let talls = (0..<9).map { _ in Int(readLine()!)! }.sorted()

func combinations(_ arr: [Int]) -> [[Int]] {
  var result = [[Int]]()
  combi(0, [])
  
  func combi(_ index: Int, _ now: [Int]) {
    if now.count == 7 && now.reduce(0, +) == 100 {
      result.append(now)
      return
    }
    
    for i in index..<arr.count {
      combi(i+1, now + [arr[i]])
    }
  }
  
  return result
}

combinations(talls).first!.forEach {
  print($0)
}
