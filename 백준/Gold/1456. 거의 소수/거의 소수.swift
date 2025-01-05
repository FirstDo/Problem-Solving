import Foundation

func makePrimes() -> [Bool] {
  let limit = 10_000_000
  var primes = Array(repeating: true, count: limit + 1)
  primes[0...1] = [false, false]
  
  for i in 2...Int(sqrt(Double(limit))) + 1 {
    if primes[i] {
      var j = i * 2
      
      while j <= limit {
        primes[j] = false
        j += i
      }
    }
  }
  
  return primes
}

func solution() -> Int {
  let ab = readLine()!.split(separator: " ").map {Double($0)!}
  let (a,b) = (ab[0], ab[1])
  
  let primes = makePrimes().enumerated().filter { $0.element }.map(\.offset)
  var cnt = 0
  
  for prime in primes {
    var temp = Double(prime * prime)
    
    while true {
      if temp < a {
        temp *= Double(prime)
      } else if temp > b {
        break
      } else {
        temp *= Double(prime)
        cnt += 1
      }
    }
  }
  
  return cnt
}

print(solution())
