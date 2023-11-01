import Foundation

func solution(_ n:Int) -> Int {
  var fibo = Array(repeating: 0, count: n+1)
  fibo[0] = 0
  fibo[1] = 1
  
  for i in 2...n {
    fibo[i] = (fibo[i-1] + fibo[i-2]) % 1234567
  }
  
  return fibo[n]
}
