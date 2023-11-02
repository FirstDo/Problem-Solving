import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
  let n = Int64(n)
  var li = left / n
  var lj = left % n
  
  let ri = right / n
  let rj = right % n
  
  var result = [Int]()
  
  while true {
    result.append(Int(max(li, lj) + 1))
    
    if li == ri && lj == rj { break }
    
    lj += 1
    
    if lj == n {
      li += 1
      lj = 0
    }
  }

  return result
}
