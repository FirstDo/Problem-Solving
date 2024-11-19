import Foundation

func makeDP(_ n: Int) -> [Set<Int>] {
  var dp = Array(repeating: Set<Int>(), count: 9)
  
  // n, nn, nnn, .. nnnnnnnn 채우기
  var temp = n
  
  for i in 1...8 {
    dp[i] = [temp]
    temp = temp * 10 + n
  }
  
  return dp
}

func solution(_ N:Int, _ number:Int) -> Int {
  var dp = makeDP(N)
  
  for i in 1...8 {
    for j in 1..<i {
      var newSet = Set<Int>()
      for num1 in dp[j] {
        for num2 in dp[i-j] {
          newSet.insert(num1 + num2) // +
          newSet.insert(num1 - num2) // -
          
          if num2 != 0 {
            newSet.insert(num1 / num2) // /
          }
          
          newSet.insert(num1 * num2) // *
        }
      }
      dp[i].formUnion(newSet)
    }
  }
  
  for i in 1...8 {
    if dp[i].contains(number) {
      return i
    }
  }

  return -1
}