import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
  var ans = 0
  var index = 0
  
  let a = a.sorted()
  let b = b.sorted()
  
  for num in a {
    while index < b.count {
      if num >= b[index] {
        index += 1
      } else {
        ans += 1
        index += 1
        break
      }
    }
  }
  
  return ans
}