import Foundation

func solution(_ s:String) -> [Int] {
  
  var x = s.map { String($0) }
  var cnt = 0
  var zeroCnt = 0
  
  while true {
    if x == ["1"] { break }
    
    // x의 모든 0을 제거
    let len = x.count
    x = x.filter { $0 == "1" }
    
    cnt += 1
    zeroCnt += len - x.count
    
    // x의 길이를 이진법으로 바꾸기
    x = String(x.count, radix: 2).map { String($0) }
  }
  
  return [cnt, zeroCnt]
}