import Foundation

func solution(_ clothes:[[String]]) -> Int {
  var dicts = [String: Int]()
  
  clothes.map { $0[1] }
    .forEach {
      if dicts[$0] == nil { dicts[$0] = 0 }
      dicts[$0]! += 1
    }
  
  return dicts.values.reduce(1) { $0 * ($1 + 1) } - 1
}
