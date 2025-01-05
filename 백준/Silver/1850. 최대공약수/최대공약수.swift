import Foundation

func gcd(a: Int, b: Int) -> Int {
  if b == 0 {
    return a
  } else {
    return gcd(a: b, b: a%b)
  }
}

func solution() -> String {
  let ab = readLine()!.split(separator: " ").map {Int($0)!}
  let (a,b) = (ab[0], ab[1])
  
  let cnt = gcd(a: a, b: b)
  return String(repeating: "1", count: cnt)
}

print(solution())