import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
  
  let multi = brown + yellow
  let sum = (brown + yellow + 4 - yellow) / 2
  
  for height in 1..<sum {
    let width = sum - height
    
    if height * width == multi {
      return [width, height]
    }
  }
  
  fatalError()
}