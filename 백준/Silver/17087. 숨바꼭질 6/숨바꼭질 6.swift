import Foundation

func gcd(a: Int, b: Int) -> Int {
  if b == 0 { return a }
  return gcd(a: b, b: a % b)
}

let ns = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (n,s) = (ns[0], ns[1])

var stack = readLine()!.components(separatedBy: " ").map { Int($0)! }.map { abs($0 - s) }

var result = stack.removeLast()

while !stack.isEmpty {
  let target = stack.removeLast()
  result = gcd(a: target, b: result)
}

print(result)