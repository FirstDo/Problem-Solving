import Foundation

// 에라토스테네스의 체를 이용한 소수인지 여부 배열을 구함
func makePrimes() -> [Bool] {
  let limit = 1_000_000
  
  var primes = Array(repeating: true, count: limit + 1)
  primes[0] = false
  primes[1] = false
  
  for i in 2 ..< Int(sqrt(Double(limit))) + 1 {
    if primes[i] == true {
      var j = 2
      
      while i * j <= limit {
        primes[i * j] = false
        j += 1
      }
    }
  }
  
  return primes
}

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (m, n) = (input[0], input[1])

let primes = makePrimes()

for i in m...n where primes[i] {
  print(i)
}