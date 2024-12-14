import Foundation

func solution() -> String {
  let n = Int(readLine()!)!
  
  return (0..<n).map { _ in Int(readLine()!)! }.sorted().map { String($0) }.joined(separator: "\n")
}

let result = solution()
print(result)
