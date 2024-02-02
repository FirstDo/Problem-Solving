import Foundation

func makePrimes() -> [Bool] {
  let limit = 1_000_000
  var primes = Array(repeating: true, count: limit + 1)
  primes[0...1] = [false, false]
  
  for i in 2 ... Int(sqrt(Double(limit))) + 1 {
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

let t = Int(readLine()!)!

let primes = makePrimes()

for _ in 0..<t {
  let n = Int(readLine()!)!
  
  var count = 0
  
  for i in (2...n/2) where primes[i] && primes[n-i] {
    count += 1
  }
  
  print(count)
}