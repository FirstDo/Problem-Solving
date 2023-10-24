import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {

  var count = 0
  var total = 0
  let sortedD = d.sorted()
  
  for element in sortedD {
    total += element
    
    if total > budget {
      return count
    }
    
    count += 1
  }
  
  
  return count
}
