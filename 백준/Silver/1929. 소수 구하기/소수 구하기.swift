import Foundation

func makePrimes() -> [Bool] {
  let limit = 1_000_000
  var prime = Array(repeating: true, count: limit+1)
  prime[0...1] = [false, false]
  
  for i in 2...limit {
    if prime[i] {
      var j = i * 2
      
      while j <= limit {
        prime[j] = false
        j += i
      }
    }
  }
  
  return prime
}

func solution() -> String {
  let mn = readLine()!.split(separator: " ").map {Int($0)!}
  let (m, n) = (mn[0], mn[1])
  
  let primes = makePrimes()
  
  return (m...n)
    .filter { primes[$0] }
    .map { String($0) }
    .joined(separator: "\n")
}

print(solution())
