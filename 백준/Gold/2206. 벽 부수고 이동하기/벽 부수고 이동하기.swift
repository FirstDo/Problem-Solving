import Foundation

func bfs(_ n: Int, _ m: Int, maps: [[Int]]) -> Int {
  let dx = [1,-1,0,0]
  let dy = [0,0,1,-1]
  
  var queue = [(x: Int, y: Int, wall: Int, cnt: Int)]()
  queue.append((0,0,0,0))
  var index = 0
  
  var visit = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: m), count: n)
  visit[0][0][0] = true
  
  while queue.count > index {
    let (x, y, wall, cnt) = queue[index]
    index += 1
    
    if x == n-1 && y == m-1 {
      return cnt + 1
    }
    
    for i in 0..<4 {
      let (nx, ny) = (x + dx[i], y + dy[i])
      
      if (0..<n) ~= nx && (0..<m) ~= ny {
        // 벽 아니고, 이동가능하면
        if maps[nx][ny] == 0 && visit[nx][ny][wall] == false {
          visit[nx][ny][wall] = true
          queue.append((nx, ny, wall, cnt + 1))
        }
        
        // 벽이고, 뚫을 수 있고, 이동가능하면
        if maps[nx][ny] == 1 && wall == 0 && visit[nx][ny][wall+1] == false {
          visit[nx][ny][wall + 1] = true
          queue.append((nx, ny, wall + 1, cnt + 1))
        }
      }
    }
  }
  
  return -1
}

func start() {
  let nm = readLine()!.components(separatedBy: " ").map {Int($0)!}
  let (n, m) = (nm[0], nm[1])
  let maps = (0..<n).map { _ in Array(readLine()!).map {Int(String($0))! } }
  let result = bfs(n, m, maps: maps)
  print(result)
}

start()
