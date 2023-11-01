import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
  var a = a, b = b
  
  var cnt = 0
  
  while true {
    a = (a+1)/2
    b = (b+1)/2
    cnt += 1
    
    if a == b { return cnt }
  }
  
  fatalError()
}
