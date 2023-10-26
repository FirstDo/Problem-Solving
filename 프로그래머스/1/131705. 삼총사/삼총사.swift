import Foundation

func solution(_ number:[Int]) -> Int {
  let len = number.count
  var answer = 0

  
  // 모든 경우의 수를 다 구하면 된다
  for i in 0..<len-2 {
    for j in i+1..<len-1 {
      for k in j+1..<len {
        
        if number[i] + number[j] + number[k] == 0 {
          answer += 1
        }
      }
    }
  }

  return answer
}