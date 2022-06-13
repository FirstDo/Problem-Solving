// 16957번 체스판 위의 공

import Foundation

let dx = [-1,-1,-1,0,1,1,1,0]
let dy = [-1,0,1,1,1,0,-1,-1]

func findParent(_ x: Int) -> Int {
  if x != parent[x] {
    parent[x] = findParent(parent[x])
  }
  
  return parent[x]
}

let t = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (r, c) = (t[0], t[1])

let board = (0..<r).map { _ in readLine()!.components(separatedBy: " ").map { Int($0)! }}

var parent = Array(repeating: 0, count: r*c)
var answer = Array(repeating: 0, count: r*c)

for i in 0..<r {
  for j in 0..<c {
    
    // 최솟값 찾기
    var x = i
    var y = j

    for k in 0..<8 {
      let nx = i + dx[k]
      let ny = j + dy[k]
    
      guard (0..<r) ~= nx && (0..<c) ~= ny else { continue }
      
      if board[x][y] > board[nx][ny] {
        x = nx
        y = ny
      }
    }

    // 부모 업데이트 하기
    parent[i*c + j] = x * c + y
  }
}

for i in 0..<r {
  for j in 0..<c {
    answer[findParent(i*c + j)] += 1
  }
}

for i in 0..<r {
  for j in 0..<c {
    print(answer[i*c + j], terminator: " ")
  }
  print()
}
