import Foundation

// 에라토스테네스의 체 사용
func allPrimes(_ max: Int) -> [Bool] {
  let limit = [max+1, 100].max()!
  
  var temp = Array(repeating: true, count: limit + 1)
  temp[0] = false
  temp[1] = false
  
  for i in 2 ..< Int(sqrt(Double(limit))) + 1 {
    if temp[i] {
      var j = 2
      
      while i * j <= limit {
        temp[i * j] = false
        j += 1
      }
    }
  }
  
  return temp
}

let n = Int(readLine()!)!
let numbers = readLine()!.components(separatedBy: " ").map { Int($0)! }

let primes = allPrimes(numbers.max()!)
print(numbers.filter { primes[$0] }.count)
