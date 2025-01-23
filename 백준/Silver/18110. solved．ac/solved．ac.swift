import Foundation

func solution() {
  let n = Int(readLine()!)!
  
  if n == 0 {
    print(0)
    return
  }
  
  let scores = (0..<n).map { _ in Int(readLine()!)! }.sorted()
  let len = scores.count
  
  let limit = Int(round(Double(len) * 0.15))
  let sum = Double(scores[limit..<len-limit].reduce(0, +))
  let average = Int(round(sum / Double(n - limit * 2)))
  print(average)
}

solution()
