import Foundation

let str = readLine()!
let m = Int(readLine()!)!

var leftStack: [Character] = Array(str)
var rightStack = [Character]()

for _ in 0..<m {
  let input = readLine()!.last!

  switch input {
  case "L":
    if leftStack.isEmpty { break }

    rightStack.append(leftStack.removeLast())

  case "D":
    if rightStack.isEmpty { break }

    leftStack.append(rightStack.removeLast())

  case "B":
    if leftStack.isEmpty { break }

    leftStack.removeLast()

  default:
    leftStack.append(input)
  }
}

print((leftStack + rightStack.reversed()).map { String($0) }.joined(separator: ""))