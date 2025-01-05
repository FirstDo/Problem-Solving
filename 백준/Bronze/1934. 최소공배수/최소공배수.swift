import Foundation

func gcd(a: Int, b: Int) -> Int {
  if b > 0 {
    return gcd(a: b, b: a%b)
  } else {
    return a
  }
}

func lcm(a: Int, b: Int) -> Int {
  return a * b / gcd(a: a, b: b)
}

func solution() -> String {
  let t = Int(readLine()!)!
  var result = [Int]()
  
  for _ in 0..<t {
    let ab = readLine()!.split(separator: " ").map {Int($0)!}
    let (a,b) = (ab[0], ab[1])
    result.append(lcm(a: a, b: b))
  }
  
  return result.map {String($0)}.joined(separator: "\n")
}

print(solution())
