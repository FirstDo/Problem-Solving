import Foundation

func solution(_ n:Int) -> Int {
  var numberOfOne = n.nonzeroBitCount
  var targetNumber = n+1
  
  while true {
    if targetNumber.nonzeroBitCount == numberOfOne {
      break
    }
    
    targetNumber += 1
  }
  
  return targetNumber
}
