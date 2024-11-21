import Foundation

func binarySearch(n: Int, times: [Int]) -> Int {
  var low = 0
  var high = Int.max / 10
  
  while low < high {
    let mid = (low + high) / 2
    
    // 주어진 시간에 처리할 수 있는 사람의 수
    let temp = times.reduce(0) { $0 + mid / $1}
    
    if temp < n {
      low = mid + 1
    } else {
      high = mid
    }
  }
  
  return high
}

func solution(_ n:Int, _ times:[Int]) -> Int64 {
  let result = binarySearch(n: n, times: times)
  return Int64(result)
}