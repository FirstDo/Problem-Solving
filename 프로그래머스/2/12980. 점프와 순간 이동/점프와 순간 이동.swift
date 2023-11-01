import Foundation

func solution(_ n:Int) -> Int {
  var n = n
  var count = 0
  
  while true {
    if n == 0 {
      return count
    }
    
    if n % 2 == 0 {
      n /= 2
    } else {
      n -= 1
      count += 1
    }
  }
  
  return count
}