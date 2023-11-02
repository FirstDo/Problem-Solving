import Foundation

func solution(_ elements:[Int]) -> Int {
  var result = Set<Int>()
  
  let elements = elements + elements
  
  for i in 0..<elements.count/2 {
    var sum = elements[i]
    result.insert(sum)
    
    for j in i+1..<i+elements.count/2 {
      sum += elements[j]
      result.insert(sum)
    }
  }
  
  return result.count
}
