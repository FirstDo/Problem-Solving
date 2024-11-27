import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
  var dist = [Int]()
  var prev = 0
  
  for station in stations {
    // 기지국의 시작과 끝
    let a = max(station - 1 - w, 0)
    let b = min(station - 1 + w, n-1)
    
    if prev < a {
      dist.append(a - prev)
    }
    
    prev = b + 1
  }
  
  // 마지막 처리
  if prev < n {
    dist.append(n - prev)
  }
  
  return dist.reduce(0) {
    $0 + Int(ceil(Double($1) / Double(1 + w + w)))
  }
}
