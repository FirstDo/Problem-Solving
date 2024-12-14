import Foundation

func solution() -> Int {
  let n = Int(readLine()!)!
  var numbers = (0..<n).map { i in (i, Int(readLine()!)!) }
  numbers.sort { $0.1 < $1.1 }
  
  var ans = 0
  
  for i in 0..<n {
    ans = max(ans, numbers[i].0 - i)
  }
  
  return ans + 1
}

let result = solution()
print(result)
