import Foundation

func solution(_ s:String) -> [Int] {
  if s == "1" { return [0, 0] }
  
  var s = Array(s)
  var cnt = 0
  var removedZero = 0
  while true {
    // 0제거
    let sLen = s.count
    let onlyZeroSLen = s.filter { $0 == "0" }.count
    
    cnt += 1
    removedZero += onlyZeroSLen
    
    // 길이를 이진변환
    s = Array(String(sLen - onlyZeroSLen, radix: 2))
    
    if s == ["1"] { return [cnt, removedZero] }
  }
  
  return [cnt, removedZero]
}