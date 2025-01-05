import Foundation

func makePrimes() -> [Bool] {
  let limit = 1_004_000
  var prime = Array(repeating: true, count: limit + 1)
  prime[0...1] = [false, false]
  
  for i in 2...Int(sqrt(Double(limit))) + 1 {
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

func isPalindrome(_ num: Int) -> Bool {
  return String(num) == String(String(num).reversed())
}

func solution() -> Int {
  let limit = 1_004_000
  
  let n = Int(readLine()!)!
  let primes = makePrimes()
  
  for i in n...limit {
    if primes[i] && isPalindrome(i) {
      return i
    }
  }
  
  fatalError()
}

print(solution())