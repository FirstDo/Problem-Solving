import Foundation

func get2(_ num: Int) -> Int {
  var count = 0
  var i = 2
  
  while num >= i {
    count += num/i
    i *= 2
  }
  
  return count
}

func get5(_ num: Int) -> Int {
  var count = 0
  var i = 5
  
  while num >= i {
    count += num/i
    i *= 5
  }
  
  return count
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

// nCm = n! / (m!) (n-m)!
let num2 = get2(n) - get2(m) - get2(n-m)
let num5 = get5(n) - get5(m) - get5(n-m)
print(min(num2, num5))