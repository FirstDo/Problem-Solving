import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
  
  for height in 1...yellow where yellow % height == 0 {
    let width = yellow / height

    if (width + 2) * (height + 2) == brown + yellow {
      return [width + 2, height + 2]
    }
  }
  
  return []
}