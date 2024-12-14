import Foundation

func solution() -> String {
  let n = Int(readLine()!)!
  let numbers = (0..<n).map { _ in Int(readLine()!)! }.sorted()
  return numbers.map { String($0) }.joined(separator: "\n")
}

let result = solution()
print(result)
