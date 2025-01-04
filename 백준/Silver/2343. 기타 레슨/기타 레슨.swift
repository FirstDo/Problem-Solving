import Foundation

func input() -> (Int, Int, [Int]) {
  let nm = readLine()!.split(separator: " ").map {Int($0)!}
  let (n, m) = (nm[0], nm[1])
  let lectures = readLine()!.split(separator: " ").map {Int($0)!}
  return (n, m, lectures)
}

func solution(_ n: Int, _ m: Int, _ lectures: [Int]) -> Int {
  
  var (low, high) = (lectures.max()!, lectures.reduce(0, +))
  
  while low < high {
    let mid = (low + high) / 2 // 블루레이의 크기
    
    var cnt = 1
    var sum = 0
    
    for lecture in lectures {
      if sum + lecture > mid {
        cnt += 1
        sum = lecture
      } else {
        sum += lecture
      }
    }
    
    // 블루레이의 크기를 더 줄여도 됨
    if cnt <= m {
      high = mid
    }
    // 블루레이의 크기를 늘려야함
    else {
      low = mid + 1
    }
  }
  
  return high
}

let (n, m, lectures) = input()
let result = solution(n, m, lectures)
print(result)

