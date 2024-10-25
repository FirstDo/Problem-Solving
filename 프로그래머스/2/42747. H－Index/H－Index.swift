import Foundation

func solution(_ citations:[Int]) -> Int {
  var low = 0
  var high = citations.max()!
  
  var answer = 0
  
  while low <= high {
    let h = (low + high) / 2
    
    print(low, high, h)
    
    // h번 이상 인용된 논문이 h편 이상인지 여부
    let count = citations.filter { $0 >= h }.count
    
    if count >= h {
      answer = max(answer, h)
      low = h + 1
    } else {
      high = h - 1
    }
  }
  
  return answer
}
