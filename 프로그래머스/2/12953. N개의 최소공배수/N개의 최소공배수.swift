import Foundation

func solution(_ arr:[Int]) -> Int {
  var a = arr.first!
  
  for b in arr[1...] {
    a = getLCM(a, b)
  }
  
  return a
}

private func getLCM(_ a: Int, _ b: Int) -> Int {
  return a * b / getGCD(a, b)
}

private func getGCD(_ a: Int, _ b: Int) -> Int {
  if b == 0 {
    return a
  } else {
    return getGCD(b, a%b)
  }
}