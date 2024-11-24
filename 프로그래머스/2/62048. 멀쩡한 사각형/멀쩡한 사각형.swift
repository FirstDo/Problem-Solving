import Foundation

// y = -h/w(x) + 12
func solution(_ w:Int, _ h:Int) -> Int64 {
  var answer = 0
  
  for i in 1...w {
    let (w, h) = (Double(w), Double(h))
    let numberOfBoxes = abs(Int(-h/w * Double(i) + h))
    answer += numberOfBoxes * 2
  }
  
  return Int64(answer)
}