import Foundation

var maze = (0..<8).map { _ in Array(readLine()!) }

func bfs() -> Int {
  var visit = Array(repeating: Array(repeating: Array(repeating: false, count: 8), count: 8), count: 8)
//  visit[0][7][0] = true
  
  var queue = [(x: 7, y: 0, t: 0)]
  var index = 0
  
  while queue.count > index {
    let (x, y, t) = queue[index]
    index += 1
    
    // 맨꼭대기에 도착했다면 무조건 성공
    if x == 0 { return 1 }
    
    for (dx,dy) in [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1), (0,0)] {
      let (nx,ny,nt) = (x+dx, y+dy, t+1)
      
      // 8초 이후에는 무조건 성공
      if nt >= 8 { return 1}
      
      // 범위밖일떄
      if !(0..<8).contains(nx) || !(0..<8).contains(ny) { continue }
      // 가려는 칸이 벽일때
      if nx-t >= 0 && maze[nx-t][ny] == "#" { continue }
      if nx-t-1 >= 0 && maze[nx-t-1][ny] == "#" { continue }
      
      if visit[nt][nx][ny] == false {
        visit[nt][nx][ny] = true
        queue.append((nx, ny, nt))
      }
      
    }
  }
  
  return -0
}

print(bfs())
