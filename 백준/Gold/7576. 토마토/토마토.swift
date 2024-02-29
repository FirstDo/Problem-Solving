import Foundation

let mn = readLine()!.split(separator: " ").map {Int($0)!}
let (m, n) = (mn[0], mn[1])

var arr = (0..<n).map { _ in readLine()!.split(separator: " ").map {Int($0)!} }

print(bfs())

func bfs() -> Int {
  var date = -1
  
  var queue = [(Int, Int, Int)]()
  var index = 0
  
  for i in 0..<n {
    for j in 0..<m {
      if arr[i][j] == 1 {
        queue.append((i,j,0))
      }
    }
  }
  
  while queue.count > index {
    let (x,y,cnt) = queue[index]
    index += 1
    date = cnt
    
    for (dx,dy) in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
      let (nx, ny) = (x+dx, y+dy)
      
      if (0..<n) ~= nx && (0..<m) ~= ny && arr[nx][ny] == 0 {
        arr[nx][ny] = 1
        queue.append((nx, ny, cnt+1))
      }
    }
  }
  
  // 안익은 토마토 있으면 -1
  if arr.flatMap { $0 }.filter { $0 == 0 }.isEmpty {
    return date
  } else {
    return -1
  }
}