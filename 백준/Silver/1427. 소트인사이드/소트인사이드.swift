import Foundation

func solution() -> String {
  return String(Int(readLine()!)!)
    .map { String($0) }
    .sorted(by: >)
    .joined()
}

let result = solution()
print(result)
