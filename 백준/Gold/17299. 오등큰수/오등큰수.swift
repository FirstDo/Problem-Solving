import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var stack = [Int]()
var result = Array(repeating: -1, count: n)

var limit = 1_000_000
var F = Array(repeating: 0, count: limit + 1)

for i in arr {
  F[i] += 1
}

for index in 0..<n {
  while !stack.isEmpty, F[arr[stack.last!]] < F[arr[index]]  {
    let target = stack.removeLast()
    result[target] = arr[index]
  }
  
  stack.append(index)
}

print(result.map { String($0) }.joined(separator: " "))