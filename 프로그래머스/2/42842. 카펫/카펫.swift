import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
  // a * b = yellow
  // a + b = (brown - 4)/2
  
  // a: 가로의 길이, b: 세로의 길이
  for a in 1...2_000_000 {
    let b = (brown - 4)/2 - a
    
    if a*b == yellow {
      return [a+2, b+2].sorted(by: >)
    }
  }
  return []
}