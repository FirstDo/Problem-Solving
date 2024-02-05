import Foundation

let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map { Int(String($0))! }

var stack = [Int]()
var result = Array(repeating: -1, count: n)

for index in 0..<n {
  // 오큰수 발견하면 pop
  while stack.isEmpty == false, input[stack.last!] < input[index] {
    let target = stack.removeLast()
    result[target] = input[index]
  }
  
  stack.append(index)
}

print(result.map { String($0) }.joined(separator: " "))
