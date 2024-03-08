import Foundation

func bfs() {
  var brokenWall = Int.max
  
  var visit = Array(repeating: Array(repeating: -1, count: m), count: n)
  visit[0][0] = 0
  
  var queue = [(x: 0, y: 0, wall:0)]
  var index = 0
  
  while queue.count > index {
    let (x,y,wall) = queue[index]
    index += 1
    
    if x == n-1 && y == m-1 {
      brokenWall = min(brokenWall, wall)
    }
    
    for (dx, dy) in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
      let (nx, ny) = (x+dx, y + dy)
      
      if (0..<n) ~= nx && (0..<m) ~= ny {

        // 아직 방문안했거나, 벽개수를 더 단축시킬수 있다면 방문
        if visit[nx][ny] == -1 || visit[nx][ny] > wall + arr[nx][ny] {
          visit[nx][ny] = wall + arr[nx][ny]
          queue.append((nx, ny, wall + arr[nx][ny]))
        }
      }
    }
  }
  
  print(brokenWall)
}

let mn = readLine()!.split(separator: " ").map {Int($0)!}
let (m, n) = (mn[0], mn[1])

var arr = (0..<n).map { _ in Array(readLine()!).map {Int(String($0))!}}

bfs()
