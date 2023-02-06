import Foundation

private func makeElementDicts(array: [Character]) -> [String: Int] {
  var result = [String]()
  
  for i in 0..<array.count - 1 {
    result.append(String(array[i...i+1]))
  }
  
  result = result.filter {
    $0.first!.isLetter && $0.last!.isLetter
  }

  var dicts = [String: Int]()
  
  result.forEach {
    dicts[$0] = (dicts[$0] ?? 0) + 1
  }
  
  return dicts
}

func solution(_ str1:String, _ str2:String) -> Int {
  
  let dicts1 = makeElementDicts(array: Array(str1.lowercased()))
  let dicts2 = makeElementDicts(array: Array(str2.lowercased()))
  
  // 교집합 구하기
  var intersectionCount = 0
  
  dicts1.keys.forEach { key in
    if let value = dicts2[key] {
      intersectionCount += min(value, dicts1[key]!)
    }
  }
  
  // 합집합 구하기
  
  var unionCount = 0
  
  let keys = Set(Array(dicts1.keys) + Array(dicts2.keys))
  
  keys.forEach { key in
    unionCount += max((dicts1[key] ?? 0), (dicts2[key] ?? 0))
  }
  
  if unionCount == 0 && intersectionCount == 0 {
    return 65536
  }
  
  return Int(Double(intersectionCount) / Double(unionCount) * 65536)
}
