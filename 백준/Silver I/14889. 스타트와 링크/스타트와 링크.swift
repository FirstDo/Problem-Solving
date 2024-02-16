import Foundation

let n = Int(readLine()!)!

func combintation() -> Int {
  var answer = Int.max
  
  let arr = (0..<n).map { Int($0) }
  let len = arr.count
  let limit = n/2
  cycle([], index: 0)
  
  func cycle(_ temp: [Int], index: Int) {
    if temp.count == limit {
      answer = min(answer, calculateAbility(temp))
      return
    }
    
    for i in index..<len {
      cycle(temp + [arr[i]], index: i+1)
    }
  }
  
  return answer
}

func calculateAbility(_ teamA: [Int]) -> Int {
  let teamB = Set((0..<n)).subtracting(teamA)
  var teamASum = 0
  var teamBSum = 0
  
  for i in teamA {
    for j in teamA {
      teamASum += s[i][j]
    }
  }
  
  for i in teamB {
    for j in teamB {
      teamBSum += s[i][j]
    }
  }

  return abs(teamASum - teamBSum)
}

let s = (0..<n).map { _ in
  readLine()!.split(separator: " ").map { Int($0)! }
}

print(combintation())