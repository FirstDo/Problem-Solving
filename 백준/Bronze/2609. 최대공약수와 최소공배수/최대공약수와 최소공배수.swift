import Foundation

func getGCD(a: Int, b: Int) -> Int {
  var (a, b) = (a, b)

  while b != 0 {
    let r = a % b
    a = b
    b = r
  }

  return a
}

func getLCM(a: Int, b: Int) -> Int {
  return a * b / getGCD(a: a, b: b)
}

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }

let (a,b) = (input[0], input[1])

print(getGCD(a: a, b: b))
print(getLCM(a: a, b: b))