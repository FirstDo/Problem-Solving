import Foundation

func solution() -> Int {
  let n = Int(readLine()!)!
  
  let meetings: [(start: Int, end: Int)] = (0..<n)
    .map { _ in
      let (se) = readLine()!.split(separator: " ").map {Int($0)!}
      return (se[0], se[1])
    }
    .sorted {
      if $0.1 == $1.1 {
        return $0.0 < $1.0
      } else {
        return $0.1 < $1.1
      }
    }
  
  var cnt = 0
  var endTime = 0
  
  for meeting in meetings {
    if meeting.start >= endTime {
      endTime = meeting.end
      cnt += 1
    }
  }
  
  return cnt
}

print(solution())
