import Foundation

func makePrimes() -> [Bool] {
  let limit = 1_000_000
  
  var primes = Array(repeating: true, count: limit+1)
  primes[0] = false
  primes[1] = false
  
  for i in 2 ..< Int(sqrt(Double(limit)))+1 {
    if primes[i] {
      var j = 2
      
      while i * j <= limit {
        primes[i * j] = false
        j += 1
      }
    }
  }
  
  return primes
}

var result = [String]()
let primes = makePrimes()

while true {
  let n = Int(readLine()!)!
  
  if n == 0 { break }
  
  for i in 2..<n where primes[i] && primes[n-i] {
    result.append("\(n) = \(i) + \(n-i)")
    break
  }
}

print(result.joined(separator: "\n"))
