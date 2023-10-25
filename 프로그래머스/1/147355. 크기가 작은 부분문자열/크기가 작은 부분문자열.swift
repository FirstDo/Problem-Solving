import Foundation

func solution(_ t:String, _ p:String) -> Int {
  var result = [Int]()
  var t = Array(t)

// 길이가 p인 부분문자열을 모두 구한다 (result)
  
  for i in 0 ... t.count - p.count {
    let number = Int(String(t[i..<i+p.count]))!
    result.append(number)
  }

// result중 p보다 작거나 같은 수의 개수를 return 한다
  return result.filter { $0 <= Int(p)! }.count
}