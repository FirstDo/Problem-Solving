import Foundation

func solution(_ citations:[Int]) -> Int {
  let citations = citations.sorted()
  
  return lowerBound(arr: citations)
}

func lowerBound(arr: [Int]) -> Int {
  var low = 0
  var high = arr.count
  var answer = 0
  
  while low <= high {
    let mid = (low + high) / 2

    let count = arr.filter { $0 >= mid }.count
    
    if mid <= count {
      low = mid + 1
      answer = max(answer, mid)
    } else {
      high = mid - 1
    }
  }
  
  return answer
}