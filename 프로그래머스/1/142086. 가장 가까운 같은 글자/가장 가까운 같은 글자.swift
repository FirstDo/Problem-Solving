import Foundation

func solution(_ s:String) -> [Int] {
  var dicts = [Character: Int]()
  var result = [Int]()
  
  for (index, ch) in s.enumerated() {
    // 이전 인덱스가 있다면? -> 현재 index - 이전 index
    if let previousIndex = dicts[ch] {
      result.append(index - previousIndex)
    }
    // 이전 인덱스가 없다면? -> -1
    else {
      result.append(-1)
    }
    
    // ch, index로 딕셔너리 업데이트
    dicts[ch] = index
  }
  
  return result
}
