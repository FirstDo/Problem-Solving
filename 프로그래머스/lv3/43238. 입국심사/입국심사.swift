import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
  var start = 0, end = n * times.max()!
  
  while start < end {
    let mid = (start + end) / 2
    let cnt = times.reduce(0) { partialResult, time in
      return partialResult + mid / time
    }
    
    if cnt >= n {
      end = mid
    } else {
      start = mid + 1
    }
  }
  
  return Int64(end)
}