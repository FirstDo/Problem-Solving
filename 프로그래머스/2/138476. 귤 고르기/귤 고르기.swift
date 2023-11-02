import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
  var dicts = [Int: Int]() // 크기: 개수
  var k = k
  
  tangerine.forEach {
    if dicts[$0] == nil { dicts[$0] = 0 }
    dicts[$0]! += 1
  }
  
  for (index, value) in dicts.values.sorted(by: >).enumerated() {
    k -= value
    
    if k <= 0 {
      return index + 1
    }
  }
  
  return dicts.count
}