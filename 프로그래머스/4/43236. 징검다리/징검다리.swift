import Foundation

func binarySearch(rocks: [Int], n: Int) -> Int {
  var start = 0
  var end = rocks.last!
  var answer = 0
  
  while start <= end {
    let mid = (start + end) / 2 // 각 지점사이의 거리
    var cnt = 0 // 제거된 바위의 개수
    var prevRock = 0 // 이전 바위의 위치
    
    for rock in rocks {
      let diff = rock - prevRock
      
      // 두 바위 간격이 기준 이상이면, 이전바위 갱신
      if diff >= mid {
        prevRock = rock
      }
      // 두 바위 간격이 기준 미만이면, 바위 제거하기
      else {
        cnt += 1
      }
    }

    // 바위를 너무 많이 제거했을경우
    if cnt > n {
      end = mid - 1
    }
    // 바위를 너무 적게 제거했을경우 or 정답일 경우
    else {
      answer = mid
      start = mid + 1
    }
  }
  
  return answer
}

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
  let rocks = rocks.sorted() + [distance]
  let result = binarySearch(rocks: rocks, n: n)
  return result
}