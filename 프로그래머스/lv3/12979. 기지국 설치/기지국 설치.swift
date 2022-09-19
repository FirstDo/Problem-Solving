import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
  var answer = 0
  var index = 0
  var location = 1
  
  while location <= n {
    if (stations[index] - w ... stations[index] + w).contains(location) {
      location = stations[index] + w + 1
      
      if stations.count - 1 > index { index += 1 }
    } else {
      answer += 1
      location += w * 2 + 1
    }
  }
  
  return answer
}
