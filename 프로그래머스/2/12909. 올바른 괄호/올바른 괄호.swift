import Foundation

func solution(_ s:String) -> Bool {
  var cnt = 0
  
  for ch in s {
    if ch == "(" {
      cnt += 1
    } else {
      if cnt == 0 { return false }
      cnt -= 1
    }
  }
  
  return cnt == 0
}
